import 'package:flutter/material.dart';
import 'package:food_delivery/screens/auth/sign_in_page.dart';
import 'package:food_delivery/screens/auth/sign_up.dart';
import 'package:food_delivery/screens/cart_history/cart_history.dart';
import 'package:food_delivery/screens/home/main_food_page.dart';
import 'package:food_delivery/screens/profile/profile_page.dart';
import 'package:food_delivery/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedindex = 0;
  // late PersistentTabController _controller;
  List pages = [
    const MainFoodPage(),
    const SignUpPage(),
    const CartHistoryPage(),
    const ProfilePAge(),
  ];

  void onTapnav(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  // @override
  // void initState() {
  //   _controller = PersistentTabController(initialIndex: 0);
  //   super.initState();
  // }

  // List<Widget> _buildScreens() {
  //   return [
  //     const MainFoodPage(),
  //     Container(child: const Center(child: Text("nextpage"))),
  //     Container(child: const Center(child: Text("next next page"))),
  //     Container(child: const Center(child: Text("next next next page"))),
  //   ];
  // }

  // List<PersistentBottomNavBarItem> _navBarsItems() {
  //   return [
  //     PersistentBottomNavBarItem(
  //       icon: const Icon(Icons.home),
  //       title: ("Home"),
  //       activeColorPrimary: Colors.blue,
  //       inactiveColorPrimary: Colors.grey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: const Icon(Icons.settings),
  //       title: ("Settings"),
  //       activeColorPrimary: Colors.blue,
  //       inactiveColorPrimary: Colors.grey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: const Icon(Icons.card_giftcard),
  //       title: ("cart"),
  //       activeColorPrimary: Colors.blue,
  //       inactiveColorPrimary: Colors.grey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: const Icon(Icons.settings),
  //       title: ("me"),
  //       activeColorPrimary: Colors.blue,
  //       inactiveColorPrimary: Colors.grey,
  //     ),
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: Colors.amberAccent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          currentIndex: _selectedindex,
          onTap: onTapnav,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.archive), label: "history"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "me"),
          ]),
    );
  }
}
 /* @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}*/
