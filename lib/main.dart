import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:final_project/pages/on_boarding_page.dart';
import 'package:final_project/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          nextScreen: OnBoardingPage(),
        ));
  }
}

// import 'package:final_project/pages/login/login_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations(<DeviceOrientation>[
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'TheGorgeousLogin',
//       home: LoginPage(),
//     );
//   }
// }