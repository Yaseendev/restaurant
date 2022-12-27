import 'package:flutter/material.dart';
import 'package:restaurant_app/Category/data/models/product_category.dart';
import 'package:restaurant_app/Product/data/models/product.dart';

import 'products_listView.dart';

class ProductsView extends StatefulWidget {
  final Map<ProductCategory, List<Product>> products;
  final int initIndex;
  const ProductsView(
    this.products, {
    super.key,
    this.initIndex = 0,
  });

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
        length: widget.products.length,
        initialIndex: widget.initIndex,
        vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color(0xFFFAFAFA),
          child: Row(
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
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFFF5F5F5)),
                                  alignment: Alignment.center,
                                  // /padding: MaterialStateProperty.all(EdgeInsets.only(left: 10)),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Icon(
                                  Icons.close_rounded,
                                  size: 26,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color,
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  ...ListTile.divideTiles(
                                    context: context,
                                    tiles: widget.products.keys.map(
                                      (category) => ListTile(
                                        title: Text(
                                          category.name,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        trailing: Text(
                                          '${widget.products[category]?.length}',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        onTap: () {
                                          Navigator.pop(
                                              context,
                                              widget.products.keys
                                                  .toList()
                                                  .indexOf(category));
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ).then((index) {
                    if (index != null) _tabController.animateTo(index);
                  });
                },
                icon: Icon(Icons.menu),
                color: Theme.of(context).primaryColor,
              ),
              Expanded(
                child: TabBar(
                  controller: _tabController,
                  isScrollable: _tabController.length > 3,
                  labelColor: Colors.black,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
                  tabs: widget.products.keys
                      .map((e) => Tab(
                            text: e.name,
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.products.entries
                .map((e) => ProductsListView(
                      title: e.key.name,
                      products: e.value,
                      onProducrOrder: (ordersList) {
                        print('added');
                      },
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
