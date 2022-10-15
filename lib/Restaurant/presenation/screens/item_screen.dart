import 'package:flutter/material.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              //   automaticallyImplyLeading: true,
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
              expandedHeight: MediaQuery.of(context).size.height * .35,
              backgroundColor: Color(0xFFFAFAFA),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/cover.png',
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
          ];
        },
        body: ListView(
          shrinkWrap: true,
          // padding: const EdgeInsets.all(12),
          children: [
            ListTile(
              title: Text(
                'Beef Burger',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'A simply delicious grilled 100% beef patty with onions, pickles, mustard and a dollop',
                strutStyle: StrutStyle(height: 1.6),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Size',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Small',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text('33 EPG'),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Medium',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text('33 EPG'),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Large',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text('33 EPG'),
                            ]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Extra Options ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                                text: '(Optional)',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Small',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text('33 EPG'),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Medium',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text('33 EPG'),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Large',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text('33 EPG'),
                            ]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
