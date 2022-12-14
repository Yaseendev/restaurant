import 'package:flutter/material.dart';
import '../widgets/loaded/home_loaded_content.dart';
import '../widgets/loading/home_loading_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 5)).then((value) => false);
        },
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              child: Card(
                color: Theme.of(context).primaryColor,
                margin: EdgeInsets.symmetric(horizontal: 12),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20))),
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
                                maxWidth:
                                    MediaQuery.of(context).size.width * .77),
                            child: Text.rich(
                              TextSpan(
                                text: 'Delivering To: ',
                                children: [
                                  TextSpan(
                                    text: 'Some Locations',
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

            //HomeLoadingWidget(),
            HomeLoadedWidget(),
            // Row(
            //   // shrinkWrap: true,
            //   children: [
            //     RestaurantCard(),
            //     RestaurantCard(),
            //   ],
            // ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
