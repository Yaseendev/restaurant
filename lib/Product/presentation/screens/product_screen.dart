import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/Order/data/models/order_item.dart';
import 'package:restaurant_app/Order/presentation/widgets/desciption_section.dart';
import 'package:restaurant_app/Order/presentation/widgets/options_section.dart';
import 'package:restaurant_app/Order/presentation/widgets/order_footer_button.dart';
import 'package:restaurant_app/Product/blocs/product_bloc/product_bloc.dart';
import 'package:restaurant_app/Product/data/models/product_option.dart';
import 'package:restaurant_app/Product/presentation/widgets/size_listView.dart';
import 'package:restaurant_app/Product/data/models/product.dart';
import 'package:restaurant_app/utils/constants.dart';

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
    if (widget.product.sizes != null) if (widget.product.sizes!.isNotEmpty)
      size = widget.product.sizes?.first;
    options = widget.product.options;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is ProductNotLoggedIn) {
          //TODO: diplay a log in dialog
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: Duration(seconds: 2),
              content: ListTile(
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 0,
                leading: Icon(Icons.error),
                subtitle: Text(
                    'You are not logged in\nLog in to add it to your favorites'),
                iconColor: Colors.white,
                textColor: Colors.white,
              )));
        } else if (state is ProductError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: Duration(seconds: 2),
              content: ListTile(
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 0,
                leading: Icon(Icons.error),
                subtitle: Text('Something went wrong'),
                iconColor: Colors.white,
                textColor: Colors.white,
              )));
        }
        if (state is ProductNoInternet) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: Duration(seconds: 2),
              content: ListTile(
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 0,
                leading: Icon(Icons.error),
                subtitle: Text('No Internet Connection'),
                iconColor: Colors.white,
                textColor: Colors.white,
              )));
        }
      },
      child: SafeArea(
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
                        child: CachedNetworkImage(
                          imageUrl: widget.product.imgUrl,
                          height: MediaQuery.of(context).size.height * .3,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                          errorWidget: (context, error, stackTrace) {
                            return Image.asset(
                              Images.CATEGORY_PLACEHOLDER,
                              height: MediaQuery.of(context).size.height * .3,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            );
                          },
                          placeholder: (context, _) {
                            return Image.asset(
                              Images.CATEGORY_PLACEHOLDER,
                              height: MediaQuery.of(context).size.height * .3,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: BlocBuilder<ProductBloc, ProductState>(
                            builder: (context, state) {
                              return ElevatedButton(
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(5),
                                  shape: MaterialStateProperty.all(
                                    CircleBorder(),
                                  ),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.all(8)),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                                onPressed: state is ProductLoading
                                    ? null
                                    : () {
                                        if (state is ProductLoaded) {
                                          if (state.isFav)
                                            context
                                                .read<ProductBloc>()
                                                .add(RemoveFromFav());
                                          else
                                            context
                                                .read<ProductBloc>()
                                                .add(AddToFav());
                                        } else if (state
                                            is ProductNotLoggedIn) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  duration:
                                                      Duration(seconds: 2),
                                                  content: ListTile(
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    horizontalTitleGap: 0,
                                                    leading: Icon(Icons.error),
                                                    subtitle: Text(
                                                        'You are not logged in\nLog in to add it to your favorites'),
                                                    iconColor: Colors.white,
                                                    textColor: Colors.white,
                                                  )));
                                        } else if (state is ProductError) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  duration:
                                                      Duration(seconds: 2),
                                                  content: ListTile(
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    horizontalTitleGap: 0,
                                                    leading: Icon(Icons.error),
                                                    subtitle: Text(
                                                        'Something went wrong'),
                                                    iconColor: Colors.white,
                                                    textColor: Colors.white,
                                                  )));
                                        }
                                      },
                                child: state is ProductLoading
                                    ? CircularProgressIndicator(
                                        color: Colors.black,
                                        strokeWidth: 2,
                                      )
                                    : state is ProductLoaded
                                        ? Icon(
                                            state.isFav
                                                ? Icons.favorite_rounded
                                                : Icons
                                                    .favorite_outline_rounded,
                                            size: 35,
                                            color: state.isFav
                                                ? Theme.of(context).primaryColor
                                                : Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .color,
                                          )
                                        : Icon(
                                            Icons.favorite_outline_rounded,
                                            size: 35,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .color,
                                          ),
                              );
                            },
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
                            onUpdate: (total) =>
                                setState(() => options = total),
                          )
                        : Container()
                    : Container(),
                SizedBox(height: 14.h),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
      ),
    );
  }

  num getTotalPrice() {
    if (options != null) {
      return (options!.fold(
                  0,
                  (num previousValue, element) =>
                      previousValue + element.price) +
              (size != null ? size!.price : 0)) *
          ammount;
    } else if (size != null)
      return size!.price * ammount;
    else
      return widget.product.price;
  }
}
