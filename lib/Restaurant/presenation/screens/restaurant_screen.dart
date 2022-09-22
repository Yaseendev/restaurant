import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flavor/flavor_assets.dart';
import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/Restaurant/presenation/widgets/restaurant_stats_widget.dart';
import 'package:restaurant_app/utils/constants.dart';
import '../widgets/items_listView.dart';
import '../widgets/restaurant_app_bar.dart';
import '../widgets/restaurant_header.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  bool isContolled = true;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ExtendedNestedScrollView(
          //controller: _listScroll,
          //onlyOneScrollInBody: true,
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height * .7,
                backgroundColor: Color(0xFFFAFAFA),
                elevation: 0,
                floating: true,
                pinned: true,
                bottom: PreferredSize(
                  preferredSize:
                      Size(MediaQuery.of(context).size.width, kToolbarHeight),
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
                                          elevation:
                                              MaterialStateProperty.all(5),
                                          shape: MaterialStateProperty.all(
                                            CircleBorder(),
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all(
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
                                            tiles: [
                                              ListTile(
                                                title: Text(
                                                  'Burger Sandwiches',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                trailing: Text(
                                                  '3',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                                onTap: () {
                                                  Navigator.pop(context, 0);
                                                },
                                              ),
                                              ListTile(
                                                title: Text(
                                                  'Meals',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                trailing: Text(
                                                  '2',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                                onTap: () {
                                                  Navigator.pop(context, 1);
                                                },
                                              ),
                                              ListTile(
                                                title: Text(
                                                  'Kids Meals',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                trailing: Text(
                                                  '20',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                                onTap: () {
                                                  Navigator.pop(context, 2);
                                                },
                                              ),
                                              ListTile(
                                                title: Text(
                                                  'Burger Sandwiches',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                trailing: Text(
                                                  '7',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                                onTap: () {
                                                  Navigator.pop(context, 3);
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
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
                          isScrollable: true,
                          labelColor: Colors.black,
                          indicatorPadding:
                              EdgeInsets.symmetric(horizontal: 16),
                          tabs: [
                            Tab(
                              text: 'Burger Sandwiches',
                            ),
                            Tab(
                              text: 'Meals',
                            ),
                            Tab(
                              text: 'Kids Meals',
                            ),
                            Tab(
                              text: 'Burger Sandwiches',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  collapseMode: CollapseMode.pin,
                  background: Column(
                    children: [
                      RestaurantAppBar(
                        coverUri: 'assets/images/cover.png',
                        profileUri: AppImages.TRANSAPPLOGO,
                        onFavTap: () {},
                      ),
                      RestaurantHeader(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: RestaurantStatsWidget(),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          }, //TODO: To be fixed later
          body: TabBarView(
            controller: _tabController,
            children: [
              ItemsListView(
                title: 'Burger Sandwiches',
              ),
              ItemsListView(
                title: 'Meals',
              ),
              ItemsListView(
                title: 'Kids Meals',
              ),
              ItemsListView(
                title: 'Burger Sandwiches',
              ),
            ],
          ),

          // body: SingleChildScrollView(
          //   controller: isContolled ? _listScroll : null,
          //   physics: NeverScrollableScrollPhysics(),
          //   child: Column(
          //       // controller: _listScroll,
          //       // physics: NeverScrollableScrollPhysics(),
          //       // padding: EdgeInsets.all(12),
          //       children: List.generate(
          //     30,
          //     (index) => AutoScrollTag(
          //       key: ValueKey(index),
          //       controller: _listScroll,
          //       index: index,
          //       child: InkWell(
          //         onTap: () {
          //           // Navigator.of(context).push(
          //           //     MaterialPageRoute(builder: (_) => ItemScreen()));
          //           setState(() {
          //             isContolled = true;
          //           });
          //           _listScroll
          //               .scrollToIndex(6,
          //                   preferPosition: AutoScrollPosition.begin)
          //               .then((value) {
          //             // print(value);
          //             // setState(() => isContolled = false);
          //           });
          //         },
          //         child:
          //             Card(child: ListTile(title: Text('Item $index'))),
          //       ),
          //     ),
          //   )
          // itemBuilder: (context, index) {
          //   return AutoScrollTag(
          //     key: ValueKey(index),
          //     controller: _listScroll,
          //     index: index,
          //     child: InkWell(
          //       onTap: () {
          //         Navigator.of(context).push(
          //             MaterialPageRoute(builder: (_) => ItemScreen()));
          //         // _listScroll.scrollToIndex(6,
          //         //     preferPosition: AutoScrollPosition.begin);
          //       },
          //       child:
          //           Card(child: ListTile(title: Text('Item $index'))),
          //     ),
          //   );
          // },
          // separatorBuilder: (context, index) {
          //   return Divider();
          // },
          // itemCount: 30,
        ),
      ),
    );
  }
}
