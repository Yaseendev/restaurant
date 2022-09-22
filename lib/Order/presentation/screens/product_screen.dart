import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/desciption_section.dart';
import '../widgets/options_section.dart';
import '../widgets/order_footer_button.dart';
import '../widgets/size_listView.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int ammount = 1;
  num productPrice = 75.25;
  num totalOptions = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              leading: Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(5),
                    shape: MaterialStateProperty.all(
                      CircleBorder(),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFFF5F5F5)),
                    alignment: Alignment.centerLeft,
                    // /padding: MaterialStateProperty.all(EdgeInsets.only(left: 10)),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.close_rounded,
                    size: 26,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
              ),
              expandedHeight: MediaQuery.of(context).size.height * .3,
              backgroundColor: Color(0xFFFAFAFA),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/cover.png',
                  fit: BoxFit.fill,
                  //height: MediaQuery.of(context).size.height * .3,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
          ],
          body: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 8),
            children: [
              DescriptionSection(
                onUpdate: (value) {
                  setState(() {
                    ammount = value;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Divider(),
              ),
              SizeListView(),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Divider(),
              ),
              OptionsSection(
                onUpdate: (total) => setState(() => totalOptions = total),
              ),
              SizedBox(height: 14.h),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: OrderFooterButton(
          text: 'Add To Order',
          priceTxt: ((productPrice + totalOptions) * ammount).toString(),
          onPress: () {
            Navigator.of(context).pop((productPrice + totalOptions) * ammount);
          },
        ),
      ),
    );
  }
}
