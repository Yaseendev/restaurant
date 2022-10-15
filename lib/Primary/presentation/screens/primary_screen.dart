import 'package:flutter/material.dart';
import 'package:restaurant_app/Home/presentation/screens/home_screen.dart';
import 'package:restaurant_app/Map/presentation/screens/map_screen.dart';
import 'package:restaurant_app/Order/presentation/screens/orders_screen.dart';
import 'package:restaurant_app/QR/presentation/screens/qr_screen.dart';
import 'package:restaurant_app/Shared/presentation/widgets/custom_app_bar.dart';
import 'package:restaurant_app/User/presentation/screen/account_screen.dart';
import '../widgets/notched_bottom_bar.dart';

class PrimaryScreen extends StatefulWidget {
  const PrimaryScreen({Key? key}) : super(key: key);

  @override
  State<PrimaryScreen> createState() => _PrimaryScreenState();
}

class _PrimaryScreenState extends State<PrimaryScreen> {
  int _currentIndex = 0;
  Map<String, Widget> _pages = {};
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    _pages.addAll({
      'Home': HomeScreen(),
      'Map': MapScreen(),
      'My Orders': OrdersScreen(),
      'My Account': AccountScreen(),
    });
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //context.read<MenuBloc>().add(LoadMenuEvent());
    });
  }

  Future<void> goToPage(int page) async {
    setState(() {
      _currentIndex = page;
    });
    pageController.animateToPage(page,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  extendBodyBehindAppBar: _currentIndex == 2,
      appBar:
          CustomAppBar.appBar(context, _pages.keys.elementAt(_currentIndex)),
      resizeToAvoidBottomInset: true,
      body: WillPopScope(
        onWillPop: onWillPop,
        child: PageView(
          children: _pages.values.toList(),
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(4.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => QRScreen()));
          },
          child: Icon(Icons.qr_code_2, size: 30),
        ),
      ),
      bottomNavigationBar: NotchedBottomBar(
        index: _currentIndex,
        onPress: goToPage,
      ),
      /* CurvedNavigationBar(
        buttonBackgroundColor: AppColors.WADILY_COLOR,
        height: 70,
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: _currentIndex == 0 ? Colors.white : Colors.black,
          ),
          Icon(
            Icons.assignment,
            size: 30,
            color: _currentIndex == 1 ? Colors.white : Colors.black,
          ),
          Icon(
            Icons.menu,
            size: 30,
            color: _currentIndex == 2 ? Colors.white : Colors.black,
          ),
        ],
        onTap: (index) {
          goToPage(index);
        },
        backgroundColor: AppColors.WADILY_COLOR,
        color: Theme.of(context).scaffoldBackgroundColor,
        index: _currentIndex,
        animationCurve: Curves.fastOutSlowIn,
      ),*/
    );
  }

  Future<bool> onWillPop() async {
    if (_currentIndex == 0) {
      return Future.value(true);
    } else {
      goToPage(0);
      return Future.value(false);
    }
  }
}
