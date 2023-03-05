// import 'package:final_project/pages/login/signup_page.dart';
// import 'package:flutter/material.dart';

// import 'components/esal_button.dart';
// import 'components/esal_text_field.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 80, 180, 226),
//       body: Container(
//         margin: const EdgeInsets.only(top: 80),
//         decoration: const BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(30),
//               topRight: Radius.circular(30),
//             ),
//             color: Colors.white),
//         child: Padding(
//           padding: const EdgeInsets.all(40.0),
//           child: SizedBox(
//             width: double.infinity,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Image.asset('lib/assets/esal_logo.png', width: 80),
//                 const SizedBox(height: 30),
//                 const Text('تسجيل الدخول', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
// const Text(
//   'إيصال هو تطبيق يساعدك على حفظ وتنظيم فواتيرك وضماناتك في مكان واحد',
//   style: TextStyle(fontSize: 16),
//   textAlign: TextAlign.right,
// ),
//                 const SizedBox(height: 40),
//                 const EsalTextField(
//                   title: 'البريد الإلكتروني',
//                   icon: Icons.mail,
//                 ),
//                 const SizedBox(height: 10),
//                 const EsalTextField(
//                   icon: Icons.lock,
//                   title: 'كلمة المرور',
//                 ),
//                 const SizedBox(height: 30),
//                 const EsalButton(text: 'تسجيل دخول'),
//                 Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       InkWell(
//                         onTap: () => Navigator.of(context).push(
//                           MaterialPageRoute(builder: (context) => const SignupPage()),
//                         ),
//                         child: const Text(
//                           'تسجيل جديد',
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                             color: Color.fromARGB(255, 80, 180, 226),
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15,
//                           ),
//                         ),
//                       ),
//                       const Text(
//                         'لا يوجد لديك حساب؟ ',
//                         textAlign: TextAlign.right,
//                         style: TextStyle(fontSize: 15),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../utils/bubble_indicator_painter.dart';
import '../components/sign_in.dart';
import '../components/sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  late PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 75.0),
                child: Image(
                    height: MediaQuery.of(context).size.height > 800 ? 141.0 : 100,
                    fit: BoxFit.fill,
                    image: const AssetImage('lib/assets/esal_logo.png')),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: _buildMenuBar(context),
              ),
              Expanded(
                flex: 2,
                child: PageView(
                  controller: _pageController,
                  physics: const ClampingScrollPhysics(),
                  onPageChanged: (int i) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (i == 0) {
                      setState(() {
                        right = Colors.white;
                        left = Colors.black;
                      });
                    } else if (i == 1) {
                      setState(() {
                        right = Colors.black;
                        left = Colors.white;
                      });
                    }
                  },
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: const SignIn(),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: const SignUp(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: const BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: BubbleIndicatorPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _onSignInButtonPress,
                child: Text(
                  'تسجيل دخول',
                  style: TextStyle(color: left, fontSize: 16.0, fontFamily: 'WorkSansSemiBold'),
                ),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _onSignUpButtonPress,
                child: Text(
                  'تسجيل جديد',
                  style: TextStyle(color: right, fontSize: 16.0, fontFamily: 'WorkSansSemiBold'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
