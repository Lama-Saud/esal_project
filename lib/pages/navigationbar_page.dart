import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:final_project/pages/dashboared_page.dart';
import 'package:final_project/pages/invoices_home_page.dart';
import 'package:final_project/pages/profile_page.dart';
import 'package:final_project/pages/providers_page.dart';
import 'package:flutter/material.dart';

import 'add_invoice_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageeState();
}

class _NavigationPageeState extends State<NavigationPage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const DashboaredPage(),
      const ProvidersPage(),
      const AddInvoicePage(),
      const InvoicesHomePage(),
      const ProfilePage(),
    ];
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(
            Icons.home,
            color: Color(0xFF1B165C),
          ),
          Icon(
            Icons.list_rounded,
            color: Color(0xFF1B165C),
          ),
          Icon(
            Icons.add_circle,
            color: Color(0xFF1B165C),
          ),
          Icon(
            Icons.receipt_rounded,
            color: Color(0xFF1B165C),
          ),
          Icon(
            Icons.person,
            color: Color(0xFF1B165C),
          ),
        ],
        backgroundColor: const Color(0xFF1B165C),
        onTap: (newIndex) {
          currentIndex = newIndex;
          setState(() {});
        },
      ),
    );
  }
}
