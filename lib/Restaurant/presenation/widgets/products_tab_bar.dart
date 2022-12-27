import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/Category/data/models/product_category.dart';
import 'package:restaurant_app/Product/data/models/product.dart';

class ProductsTabBar extends StatelessWidget {
  final Map<ProductCategory, List<Product>> products;

  const ProductsTabBar({
    Key? key,
    required TabController? tabController,
    required this.products,
  })  : _tabController = tabController,
        super(key: key);

  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: const Radius.circular(20),
                ),
              ),
              elevation: 2,
              isScrollControlled: true,
              builder: (context) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * .4,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text(
                          'Categories',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        trailing: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(5),
                            shape: MaterialStateProperty.all(
                              CircleBorder(),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFFF5F5F5)),
                            alignment: Alignment.center,
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
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: ListTile.divideTiles(
                            context: context,
                            tiles: products.keys.map(
                              (category) => ListTile(
                                title: Text(
                                  category.name,
                                  style: TextStyle(fontSize: 16),
                                ),
                                trailing: Text(
                                  '${products[category]?.length}',
                                  style: TextStyle(fontSize: 18),
                                ),
                                onTap: () {
                                  Navigator.pop(context,
                                      products.keys.toList().indexOf(category));
                                },
                              ),
                            ),
                          ).toList(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ).then((index) {
              if (index != null) _tabController?.animateTo(index);
            });
          },
          icon: Icon(Icons.menu),
          color: AppColors.PRIMARY_COLOR,
        ),
        Expanded(
          child: TabBar(
            controller: _tabController,
            isScrollable: _tabController!.length > 3,
            labelColor: Colors.black,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
            tabs: products.keys
                .map((e) => Tab(
                      text: e.name,
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
