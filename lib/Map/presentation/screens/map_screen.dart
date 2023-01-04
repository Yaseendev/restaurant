import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_app/Map/blocs/map_bloc/map_bloc.dart';
import '../widgets/branches_list_view.dart';
import '../widgets/branches_vertical_list_view.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final GoogleMapController googleMapController;
  final ScrollController controller = ScrollController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {});
    super.initState();
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapBloc, MapState>(
      listener: (context, state) {
        if (state is MapLoaded) {
          controller.animateTo(
            (270 * (state.index ?? 0)) - 16,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
          googleMapController.animateCamera(CameraUpdate.newLatLng(
              state.branches[state.index ?? 0].location!.toLatLng()));
        }
      },
      buildWhen: (previous, current) =>
          current is MapLoaded || current is MapInitial,
      builder: (context, state) {
        if (state is MapLoaded)
          return Stack(
            children: [
              GoogleMap(
                myLocationButtonEnabled: false,
                myLocationEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: LatLng(state.branches.first.location!.latitude,
                      state.branches.first.location!.longitude),
                  zoom: 12.5,
                ),
                onMapCreated: (gController) {
                  googleMapController = gController;
                  controller.animateTo(
                    (270 * (state.index ?? 0)) - 16,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                  );
                  googleMapController.animateCamera(CameraUpdate.newLatLng(
                      state.branches[state.index ?? 0].location!.toLatLng()));
                },
                onTap: (pos) => print('Location $pos'),
                markers: state.branches
                    .map((b) => Marker(
                          markerId: MarkerId('marker${b.id}'),
                          icon: BitmapDescriptor.fromBytes(
                            state.byteData.buffer.asUint8List(),
                            size: const Size(140, 140),
                          ),
                          draggable: false,
                          position: LatLng(
                              b.location!.latitude, b.location!.longitude),
                        ))
                    .toSet(),
              ),
              //CategoriesBaner(),
              ScreenUtil().orientation == Orientation.portrait
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: BlurryContainer(
                        color: Colors.white.withOpacity(0.0),
                        //filter: ui.ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                        height: 156.sp,
                        width: MediaQuery.of(context).size.width,
                        blur: 5,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, bottom: 8),
                                child: Text(
                                  'Nearst Branches',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              //PlaceCard(),
                              BranchesListView(
                                controller: controller,
                                onPressed: (location) =>
                                    googleMapController.animateCamera(
                                        CameraUpdate.newLatLng(location)),
                                branches: state.branches,
                              ),
                            ]),
                      ),
                    )
                  : Align(
                      alignment: Alignment.topLeft,
                      child: BlurryContainer(
                        color: Colors.white.withOpacity(0.0),
                        height: MediaQuery.of(context).size.height,
                        //width: MediaQuery.of(context).size.width,
                        blur: 5,
                        elevation: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nearst Branches',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            Expanded(
                              child: VerticalBranchesListView(
                                controller: controller,
                                onPressed: (location) =>
                                    googleMapController.animateCamera(
                                        CameraUpdate.newLatLng(location)),
                                branches: state.branches,
                              ),
                            ),
                          ],
                        ),
                      )),
            ],
          );
        return Container();
      },
    );
  }
}
