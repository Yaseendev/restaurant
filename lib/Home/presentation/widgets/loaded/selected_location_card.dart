import 'package:flutter/material.dart';
import 'package:restaurant_app/Shared/Location/data/models/address_location.dart';

class SelectedLocationCard extends StatelessWidget {
  final AddressLocation currentLocation;
  const SelectedLocationCard({
    Key? key,
    required this.currentLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                            text: currentLocation.name, //'Some Locations',
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
    );
  }
}
