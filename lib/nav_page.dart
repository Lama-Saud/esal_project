import 'package:final_project/pages/dashboared_page.dart';
import 'package:final_project/pages/profile_page.dart';
import 'package:final_project/pages/providers_page.dart';
import 'package:flutter/material.dart';

import 'pages/folders_page.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  var currentIndex = 0;

  static const pages = [
    ProfilePage(),
    ProvidersPage(),
    DashboaredPage(),
    FoldersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.flash_on_outlined), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.inventory_outlined), label: 'Providers'),
          BottomNavigationBarItem(icon: Icon(Icons.production_quantity_limits), label: 'Dashboared'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'invoices'),
        ],
        onTap: (newIndex) {
          currentIndex = newIndex;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        backgroundColor: const Color(0xFF111322),
        selectedItemColor: const Color(0xFF5579f3),
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
