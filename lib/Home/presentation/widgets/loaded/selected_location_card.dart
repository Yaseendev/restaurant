import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/Home/blocs/home_bloc/home_bloc.dart';
import 'package:restaurant_app/Map/data/models/address.dart';
import 'package:restaurant_app/Shared/Location/bloc/location_bloc.dart';

import 'current_location_tile.dart';

class SelectedLocationCard extends StatelessWidget {
  final Address currentLocation;
  final List<Address> addresses;
  const SelectedLocationCard({
    Key? key,
    required this.currentLocation,
    required this.addresses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          )),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * .5,
          ),
          builder: (context) {
            return BlocProvider<LocationBloc>(
              create: (context) => LocationBloc()..add(DetectCurrentLocation()),
              child: BottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                )),
                onClosing: () {},
                builder: (context) {
                  return ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      Text(
                        'Choose Delivery Location',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...ListTile.divideTiles(
                        context: context,
                        tiles: [
                          ...addresses.map(
                            (address) => ListTile(
                              leading: Icon(
                                Icons.location_on,
                                size: 28,
                                color: Theme.of(context).primaryColor,
                              ),
                              title: Text(
                                address.city,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(address.title),
                              trailing: address == currentLocation
                                  ? Icon(
                                      Icons.check_circle_rounded,
                                      color: Theme.of(context).primaryColor,
                                    )
                                  : null,
                              contentPadding: EdgeInsets.zero,
                              horizontalTitleGap: 0,
                              onTap: () => Navigator.pop(context, address),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      CurrentLocationTile(
                        onSelect: (address) => Navigator.pop(context, address),
                      ),
                      const Divider(),
                      ListTile(
                        leading: Icon(
                          Icons.pin_drop,
                          size: 28,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: Text(
                          'Deliver to different location',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text('Choose the location on map'),
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 0,
                        //onTap: () => Navigator.pop(context, address),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ).then((value) {
          if (value != null) {
            print(value);
            context.read<HomeBloc>().add(ReloadHomeScreenData(
                  currentAddress: value,
                  branches:
                      (context.read<HomeBloc>().state as HomeLoaded).branches,
                ));
          }
        });
      },
      child: SizedBox(
        height: 40,
        child: Card(
          color: Theme.of(context).primaryColor,
          margin: EdgeInsets.symmetric(horizontal: 15),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * .77),
                      child: Text.rich(
                        TextSpan(
                          text: 'Deliver To: ',
                          children: [
                            TextSpan(
                              text:
                                  '${currentLocation.name.isEmpty ? currentLocation.neighbourhood : currentLocation.name}, ${currentLocation.city}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
