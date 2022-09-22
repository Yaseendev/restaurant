import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_app/utils/constants.dart';

class NotchedBottomBar extends StatelessWidget {
  final Function(int) onPress;
  final int index;
  const NotchedBottomBar({Key? key, required this.index, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      elevation: 20,
      clipBehavior: Clip.hardEdge,
      child: Container(
        height: kBottomNavigationBarHeight,
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    iconSize: 32,
                    onPressed: () {
                      onPress(0);
                    },
                    icon: Icon(Icons.home),
                    color: index == 0
                        ? AppColors.PRIMARY_COLOR
                        : Colors.black,
                  ),
                  IconButton(
                    iconSize: 28,
                    onPressed: () {
                      onPress(1);
                      
                    },
                    icon: Icon(FontAwesomeIcons.mapLocationDot),
                    color: index == 1
                        ? AppColors.PRIMARY_COLOR
                        : Colors.black,
                  ),
                ],
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * .2),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    iconSize: 32,
                    onPressed: () {
                      onPress(2);
                    },
                    icon: Icon(Icons.assignment),
                    color: index == 2
                        ? AppColors.PRIMARY_COLOR
                        : Colors.black,
                  ),
                  IconButton(
                    iconSize: 32,
                    onPressed: () {
                      onPress(3);
                    },
                    icon: Icon(Icons.account_circle),
                    color: index == 3
                        ? AppColors.PRIMARY_COLOR
                        : Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
