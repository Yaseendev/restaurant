import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/Map/data/models/address.dart';
import 'package:restaurant_app/Shared/Location/bloc/location_bloc.dart';

class CurrentLocationTile extends StatelessWidget {
  final Function(Address address) onSelect;
  const CurrentLocationTile({
    Key? key,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        if (state is LocationDetected) {
          return ListTile(
            leading: Icon(
              Icons.gps_fixed_rounded,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Deliver to current location',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(state.currentLocation.title),
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: 0,
            onTap: () => onSelect(state.currentLocation),
          );
        } else if (state is LocationError) {
          return ListTile(
            leading: Icon(Icons.gps_fixed_rounded),
            title: Text('Deliver to current location'),
            subtitle: Text('Could not detect your current location'),
            trailing: Icon(Icons.warning_rounded),
            contentPadding: EdgeInsets.zero,
            enabled: false,
            horizontalTitleGap: 0,
          );
        }
        return ListTile(
          leading: Icon(Icons.gps_fixed_rounded),
          title: Text('Deliver to current location'),
          subtitle: Text('Detecting location...'),
          trailing: CircleAvatar(
              radius: 14,
              backgroundColor: Colors.transparent,
              child: CircularProgressIndicator.adaptive(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
              )),
          contentPadding: EdgeInsets.zero,
          enabled: false,
          horizontalTitleGap: 0,
        );
      },
    );
  }
}
