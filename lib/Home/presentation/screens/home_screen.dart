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
