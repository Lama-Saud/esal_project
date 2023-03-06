import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../home_page.dart';
import 'add_invoice_page.dart';
import 'invoices_home_page.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomePage(),
      const AddInvoicePage(),
      const InvoicesHomePage(),
    ];
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        color: const Color(0xFF1B165C),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            gap: 8,
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'لوحة التحكم',
              ),
              GButton(
                icon: Icons.add_circle,
                text: 'إضافة',
              ),
              GButton(
                icon: Icons.receipt_rounded,
                text: 'الفواتير',
              ),
            ],
            backgroundColor: const Color(0xFF1B165C),
            color: Colors.white,
            activeColor: Colors.black,
            tabBackgroundColor: const Color.fromARGB(255, 222, 245, 255),
            onTabChange: (newIndex) {
              currentIndex = newIndex;
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
