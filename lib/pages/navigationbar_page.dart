import 'package:final_project/pages/dashboared_page.dart';
import 'package:final_project/pages/folders_page.dart';
import 'package:final_project/pages/providers_page.dart';
import 'package:final_project/pages/settings_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
      const FoldersPage(),
      const SettingsProfilePage(),
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
                icon: Icons.list_rounded,
                text: 'مزودي الخدمة',
              ),
              GButton(
                icon: Icons.add_circle,
                text: 'إضافة',
              ),
              GButton(
                icon: Icons.receipt_rounded,
                text: 'الفواتير',
              ),
              GButton(
                icon: Icons.person,
                text: 'الملف الشخصي',
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
