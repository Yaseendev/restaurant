import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_app/Branch/data/Models/branch.dart';
import 'place_card.dart';

class BranchesListView extends StatelessWidget {
  final List<Branch> branches;
  final Function(LatLng location) onPressed;
  final ScrollController controller;
  const BranchesListView({
    Key? key,
    required this.branches,
    required this.onPressed,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(branches.length, (index) => PlaceCard(
                    branch: branches[index],
                    onPress: () {
                      print(controller.offset);
                      controller.animateTo(
                        (270 * index) - 16,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                      onPressed(LatLng(branches[index].location!.latitude,
                          branches[index].location!.longitude));
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
