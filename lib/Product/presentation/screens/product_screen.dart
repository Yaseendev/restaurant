import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/Order/models/order_item.dart';
import 'package:restaurant_app/Order/presentation/widgets/desciption_section.dart';
import 'package:restaurant_app/Order/presentation/widgets/options_section.dart';
import 'package:restaurant_app/Order/presentation/widgets/order_footer_button.dart';
import 'package:restaurant_app/Product/models/product_option.dart';
import 'package:restaurant_app/Product/presentation/widgets/size_listView.dart';
import 'package:restaurant_app/Product/models/product.dart';

class ProductScreen extends StatefulWidget {
  final Product product;
  const ProductScreen(this.product, {Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int ammount = 1;
  num productPrice = 75.25;
  num totalOptions = 0;
  ProductOption? size;
  List<ProductOption>? options = [];

  @override
  void initState() {
    size = widget.product.sizes?.last;
    super.initState();
  }

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
              expandedHeight: MediaQuery.of(context).size.height * .34,
              backgroundColor: Color(0xFFFAFAFA),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        widget.product.imgUrl, //TODO: Change to this later
                        //'assets/images/cover.png',
                        fit: BoxFit.fill,
                        height: MediaQuery.of(context).size.height * .3,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(5),
                            shape: MaterialStateProperty.all(
                              CircleBorder(),
                            ),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(8)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.favorite_outline_rounded,
                            size: 35,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          body: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 8),
            children: [
              DescriptionSection(
                item: widget.product,
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
              widget.product.sizes != null
                  ? widget.product.sizes!.isNotEmpty
                      ? SizeListView(
                          sizes: widget.product.sizes!,
                          onSelect: (selectedSize) {
                            setState(() {
                              size = selectedSize;
                            });
                          },
                        )
                      : Container()
                  : Container(),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Divider(),
              ),
              widget.product.options != null
                  ? widget.product.options!.isNotEmpty
                      ? OptionsSection(
                          options: widget.product.options ?? [],
                          onUpdate: (total) => setState(() => options = total),
                        )
                      : Container()
                  : Container(),
              SizedBox(height: 14.h),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: OrderFooterButton(
          text: 'Add To Order',
          priceTxt: getTotalPrice().toString(),
          onPress: () {
            Navigator.of(context).pop(OrderItem(
              product: widget.product,
              quantity: ammount,
              size: size,
              options: options,
              totalPrice: getTotalPrice(),
            ));
          },
        ),
      ),
    );
  }

  num getTotalPrice() {
    if (options != null) {
      return (options!.fold(
                  0,
                  (num previousValue, element) =>
                      previousValue + element.price) +
              (size != null ? size!.price : 0 )) *
          ammount;
    } else
      return size!.price * ammount;
  }
}
