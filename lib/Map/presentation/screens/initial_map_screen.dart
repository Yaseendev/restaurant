import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_app/Branch/data/Models/branch.dart';
import 'package:restaurant_app/Home/blocs/home_bloc/home_bloc.dart';
import 'package:restaurant_app/Map/blocs/map_bloc/map_bloc.dart';
import 'package:restaurant_app/Map/data/models/location_result.dart';
import 'package:restaurant_app/Map/data/repositories/map_repository.dart';
import 'package:restaurant_app/Primary/presentation/screens/primary_screen.dart';
import 'package:restaurant_app/Shared/Location/data/models/geo_latLng.dart';
import 'package:restaurant_app/Shared/Location/data/repositories/location_repository.dart';
import 'package:restaurant_app/User/blocs/account_bloc/account_bloc.dart';
import 'package:restaurant_app/utils/locator.dart';

class InitialMapScreen extends StatefulWidget {
//  final LatLng currentLocation;
  final bool fromHome;
  const InitialMapScreen({
    super.key,
    this.fromHome = false,
  });

  @override
  State<InitialMapScreen> createState() => _InitialMapScreenState();
}

class _InitialMapScreenState extends State<InitialMapScreen> {
  late LatLng location;
  late final CameraPosition _initialCameraPosition;
  late final GoogleMapController googleMapController;
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    location = const LatLng(30.0504132, 31.2073222);
    _initialCameraPosition = CameraPosition(
      target: location,
      //zoom: 12.5,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapBloc, MapState>(
      listener: (context, state) {
        if (state is MapError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 2),
            content: ListTile(
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 0,
              // dense: true,
              leading: Icon(Icons.info_rounded),
              title: Text('Something went wrong'),
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
          ));
        } else if (state is MapCurrentLocation) {
          if (state.curentLocation != null) {
            googleMapController
                .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target: LatLng(state.curentLocation!.latitude,
                  state.curentLocation!.longitude),
              zoom: 15,
            )));
          }
        } else if (state is MapServiceDisabled) {
          showDialog(
            context: context,
            builder: (contxt) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                title: Text('Location Service Disabled'),
                content: Text(
                    'To Detect your current location, the location service must be enabled'),
                actions: [
                  TextButton(
                    onPressed: () {
                      locator.get<LocationRepository>().openLocationSettings();
                      Navigator.of(context).pop();
                    },
                    child: Text('Open Settings'),
                  ),
                  TextButton(
                    onPressed: Navigator.of(context).pop,
                    child: Text('Cancel'),
                  ),
                ],
              );
            },
          );
        } else if (state is MapLocationChoosen) {
          context.read<HomeBloc>().add(FetchHomeScreenData());
          context.read<AccountBloc>().add(LoadUserProfileEvent());
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                settings: const RouteSettings(name: '/primary'),
                builder: (ctx) => const PrimaryScreen(),
              ),
              (route) => false);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: widget.fromHome
            ? AppBar(
                title: Text('Different Delivery Location'),
              )
            : null,
        body: SafeArea(
          child: Stack(
            children: [
              GoogleMap(
                mapToolbarEnabled: false,
                zoomControlsEnabled: false,
                myLocationEnabled: true,
                initialCameraPosition: _initialCameraPosition,
                onMapCreated: (controller) {
                  googleMapController = controller;
                },
                onTap: (pos) {
                  googleMapController.animateCamera(CameraUpdate.newLatLng(
                    pos,
                  ));
                },
                onCameraMove: (cameraPos) {
                  location = cameraPos.target;
                },
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Icon(
                    Icons.location_on,
                    size: 35,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TypeAheadField(
                  errorBuilder: (context, error) {
                    return Container();
                  },
                  textFieldConfiguration: TextFieldConfiguration(
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      fillColor: Color(0xFFF6F6F6),
                      filled: true,
                      hintText: 'Search Location',
                      prefixIcon: Icon(Icons.search),
                    ),
                    textAlignVertical: TextAlignVertical.bottom,
                    controller: textController,
                  ),
                  suggestionsCallback: (pattern) async {
                    print(pattern);

                    //if (pattern.isEmpty) return Future.value();
                    return await locator
                        .get<MapRepository>()
                        .getLoactionSearchResult(pattern);
                    //await BackendService.getSuggestions(pattern);
                  },
                  autoFlipDirection: true,
                  itemBuilder: (context, LocationResult suggestion) {
                    // return Container();
                    return ListTile(
                      leading: Icon(Icons.location_on_rounded),
                      title: Text(suggestion.displayPlace),
                      subtitle: Text(
                          '${suggestion.address.road} ${suggestion.address.state} ${suggestion.address.country}'),
                    );
                  },
                  onSuggestionSelected: (LocationResult suggestion) {
                    googleMapController.animateCamera(
                        CameraUpdate.newCameraPosition(CameraPosition(
                      target: LatLng(
                        suggestion.position.latitude,
                        suggestion.position.longitude,
                      ),
                      zoom: 15,
                    )));
                    textController.text = suggestion.displayPlace;
                  },
                  keepSuggestionsOnLoading: false,
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: BlocBuilder<MapBloc, MapState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          onPressed: () {
                            // Navigator.of(context).pushReplacement(
                            //     MaterialPageRoute(
                            //         builder: (_) => PrimaryScreen()));
                            //TODO: Implement choose location
                            //1. Save Location
                            //2. Fetch branch data
                            //3. Go to Home Screen
                            //4. Fetch Home screen data
                            //5.

                            if (!(state is MapLoading))
                              context.read<MapBloc>().add(ChooseLocation(
                                  GeoLatLng.fromLatLng(location)!));
                          },
                          child: state is MapLoading
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text('Choose Delivery Location'),
                        );
                      },
                    ),
                  )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (!(context.read<MapBloc>().state is MapLoading))
              context.read<MapBloc>().add(LoadCurrentLocation());
          },
          child: Icon(
            Icons.gps_fixed,
            size: 28,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }
}
