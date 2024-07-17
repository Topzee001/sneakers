import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sneakers/constants/svg_icons.dart';

import 'pages/cart_page.dart';
import 'pages/home_page.dart';
import 'pages/profile.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key, this.initialIndex = 0});
  final int initialIndex;

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const MyHomePage(),
    Text('Products Page'),
    const MyCart(),
    Text('My Orders Page'),
    const MyProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color _iconColor(int index) {
    return _selectedIndex == index
        ? Color.fromRGBO(0, 144, 198, 1)
        : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.string(
              SvgIcons.products,
              color: _iconColor(1),
            ),
            label: 'All Products',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.string(SvgIcons.cart1, color: _iconColor(2)),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.string(SvgIcons.myOrders, color: _iconColor(3)),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.string(SvgIcons.profile, color: _iconColor(4)),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(0, 114, 198, 1),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
