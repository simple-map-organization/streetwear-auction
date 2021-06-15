import 'package:flutter/material.dart';

import 'screens/watchlist/watchlist_view.dart';
import 'screens/home/home_view.dart';
import 'screens/profile/profile_view.dart';
import 'screens/seller_product/seller_product_view.dart';

class NavBarWrapper extends StatefulWidget {
  static MaterialPageRoute createRoute() =>
      MaterialPageRoute(builder: (_) => NavBarWrapper());
  @override
  _NavBarWrapperState createState() => _NavBarWrapperState();
}

class _NavBarWrapperState extends State<NavBarWrapper> {
  int _selectedIndex = 0;

  List _navBarItem = [
    {
      'icon': Icons.home,
      'label': 'Home',
      'Widget': HomeScreen(),
    },
    {'icon': Icons.bookmark, 'label': 'Watchlist', 'Widget': WatchListScreen()},
    {
      'icon': Icons.shopping_bag_rounded,
      'label': 'My Product',
      'Widget': SellerProductScreen()
    },
    {
      'icon': Icons.shopping_basket,
      'label': 'Purchase',
      'Widget': WatchListScreen()
    },
    {
      'icon': Icons.account_circle,
      'label': 'Profile',
      'Widget': ProfileScreen()
    }
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navBarItem[_selectedIndex]['Widget'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          ..._navBarItem.map((item) => BottomNavigationBarItem(
              icon: Icon(
                item['icon'],
              ),
              label: item['label']))
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Color.fromRGBO(118, 166, 208, 1),
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}
