import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:plantproject/constants.dart';
import 'package:plantproject/models/plants.dart';
import 'package:plantproject/ui/scan_page.dart';
import 'package:plantproject/ui/screens/cart_page.dart';
import 'package:plantproject/ui/screens/favorite_page.dart';
import 'package:plantproject/ui/screens/home_page.dart';
import 'package:plantproject/ui/screens/profile_page.dart';
import 'package:page_transition/page_transition.dart' as transition; // Alias for page_transition

class RootPage extends StatefulWidget {
  // ignore: use_super_parameters
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Plant> favorites = [];
  List<Plant> myCart = [];
  int _bottomNavIndex = 0;

  List<Widget> _widgetOptions() {
    return [
      HomePage(),
      FavoritePage(favoritedPlants: favorites),
      CartPage(addedToCartPlants: myCart),
      const ProfilePage(),
    ];
  }

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  List<String> titleList = [
    'Home',
    'Favorite',
    'Cart',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[_bottomNavIndex],
              style: TextStyle(
                color: Constants.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            Icon(Icons.notifications, color: Constants.blackColor, size: 30.0),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            transition.PageTransition(
              child: const ScanPage(),
              type: transition.PageTransitionType.bottomToTop,
            ),
          );
        },
        // ignore: sort_child_properties_last
        child: Image.asset('assets/images/code-scan-two.png', height: 30.0),
        backgroundColor: Constants.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        // ignore: deprecated_member_use
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
            favorites = Plant.getFavoritedPlants();
            myCart = Plant.addedToCartPlants().toSet().toList();
          });
        },
      ),
    );
  }
}
