import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:final_project/pages/invoices/add_inv_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: AnimatedSplashScreen(
        splash: Icons.home,
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: const AddInvPage(),
      ),
    );
  }
}
