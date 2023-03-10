import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:final_project/pages/invoice_detail_page.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/models/store.dart';
import 'package:final_project/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';


import 'models/folder.dart';
import 'pages/navigationbar_page.dart';
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

    for (final store in providers) {
      final providersCollection = FirebaseFirestore.instance.collection('provider');
      final resDoc = providersCollection.doc(store.id);
      resDoc.set(store.toMap());
    }
    for (final folder in folders) {
      final folderCollection = FirebaseFirestore.instance.collection('folder');
      final resDoc1 = folderCollection.doc(folder.id);
      resDoc1.set(folder.toMap());
      print(folder.folderName);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'),
      ],
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
              '??????????',
              style: GoogleFonts.almarai(
                  textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25), color: CustomTheme.darkBlue),
            )
          ],
        ),
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: isLoggedIn ? const NavigationPage() : const LoginPage(),
      ),
    );
  }
}
