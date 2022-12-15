import 'package:flavor/flavor_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/Shared/Rate/presentation/screens/add_rate_screen.dart';
import 'package:restaurant_app/utils/constants.dart';
import '../screens/order_screen.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => OrderScreen()));
      },
      child: SizedBox(
        width: 142.w,
        child: Card(
          color: Colors.white,
          margin: const EdgeInsets.only(bottom: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 1.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(AppImages.APPLOGO),
                ),
                title: Text(
                  appName,
                  //'Exception',
                  //'Gad Restaurant',
                  //'Pizza Master',
                  //'Zad',
                  //'Abo Saleh',
                  //'HeatAttack',
                  // 'Tata\s Sons',
                  //'Burger King',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                tileColor: Color(0xFFE6F4F9),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(8), top: Radius.circular(10))),
              ),
              ListTile(
                dense: true,
                leading: Text(
                  'X1',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 18),
                ),
                horizontalTitleGap: 2,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                title: Text(
                  'Jumbo Burger',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                dense: true,
                leading: Text(
                  'X2',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 18),
                ),
                horizontalTitleGap: 2,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                title: Text(
                  'Chiken Shwarma',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '10 / 10 / 2020  - 10:00 pm',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => AddRateScreen()));
                        },
                        icon: Icon(Icons.arrow_back),
                        label: Text('Rate'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
