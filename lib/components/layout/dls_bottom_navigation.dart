import 'package:flutter/material.dart';

class DLSBottomNav extends StatelessWidget {
  final int selectedIndex;
  final onItemTapped;

  DLSBottomNav({this.selectedIndex, this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.build),
          title: Text('Parts'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Color(0xFF195532),
      onTap: onItemTapped,
    );
  }
}
