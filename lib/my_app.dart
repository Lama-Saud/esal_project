import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:final_project/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'nav_page.dart';
import 'theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();

    // Listen to changes user made during signin method.
    FirebaseAuth.instance.authStateChanges().listen((user) {
      // Not null means user is still loggedin .
      isLoggedIn = user != null;
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: AnimatedSplashScreen(
        splashIconSize: 400,
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/esal_logo.png',
              width: 80,
              height: 80,
            ),
            Text(
              'إيصال',
              style: GoogleFonts.almarai(
                  textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25), color: CustomTheme.darkBlue),
            )
          ],
        ),
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: isLoggedIn ? const NavPage() : const LoginPage(),
      ),
    );
  }
}
