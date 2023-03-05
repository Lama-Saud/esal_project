import 'package:final_project/components/esal_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'snackbar.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:the_gorgeous_login/theme.dart';
// import 'package:the_gorgeous_login/widgets/snackbar.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();

  bool _obscureTextPassword = true;

  @override
  void dispose() {
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Card(
                elevation: 2.0, //white60
                color: const Color.fromARGB(255, 248, 248, 248),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SizedBox(
                  width: 300.0,
                  height: 190.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            focusNode: focusNodeEmail,
                            controller: loginEmailController,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(color: Colors.black, fontFamily: 'WorkSansSemiBold', fontSize: 16.0),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                FontAwesomeIcons.envelope,
                                size: 22.0,
                                color: Colors.grey,
                              ),
                              hintText: 'البريد الإلكتروني',
                              hintStyle: TextStyle(fontFamily: 'WorkSansSemiBold', fontSize: 16.0),
                            ),
                            onSubmitted: (_) {
                              focusNodePassword.requestFocus();
                            },
                          ),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            focusNode: focusNodePassword,
                            controller: loginPasswordController,
                            obscureText: _obscureTextPassword,
                            style: const TextStyle(fontFamily: 'WorkSansSemiBold', fontSize: 16.0, color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: const Icon(
                                FontAwesomeIcons.lock,
                                size: 22.0,
                                color: Colors.grey,
                              ),
                              hintText: 'كلمة المرور',
                              hintStyle: const TextStyle(fontFamily: 'WorkSansSemiBold', fontSize: 16.0),
                              suffixIcon: GestureDetector(
                                onTap: _toggleLogin,
                                child: Icon(!_obscureTextPassword ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
                                    size: 15.0, color: Colors.grey),
                              ),
                            ),
                            onSubmitted: (_) {
                              _toggleSignInButton();
                            },
                            textInputAction: TextInputAction.go,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 64.0),
                margin: const EdgeInsets.only(top: 170.0),
                child: MaterialButton(
                  highlightColor: Colors.white,
                  splashColor: Colors.white,
                  onPressed: () => CustomSnackBar(
                    context,
                    const Text('Login button pressed'),
                  ),
                  child: const EsalButton(text: 'تسجيل دخول'),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'هل نسيت كلمة المرور؟ ',
                  style: TextStyle(
                      // decoration: TextDecoration.underline,
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: 'WorkSansMedium'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'اضغط هنا',
                    style: TextStyle(
                        // decoration: TextDecoration.underline,
                        color: Color.fromARGB(255, 80, 180, 226),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'WorkSansMedium'),
                  ),
                ),
              ],
            ),
          ),
          /////
          // Padding(
          //   padding: const EdgeInsets.only(top: 10.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       Container(
          //         decoration: const BoxDecoration(
          //           gradient: LinearGradient(
          //               colors: <Color>[
          //                 Colors.white10,
          //                 Color(0xFF1B165C),
          //               ],
          //               begin: FractionalOffset(0.0, 0.0),
          //               end: FractionalOffset(1.0, 1.0),
          //               stops: <double>[0.0, 1.0],
          //               tileMode: TileMode.clamp),
          //         ),
          //         width: 100.0,
          //         height: 1.0,
          //       ),
          //       const Padding(
          //         padding: EdgeInsets.only(left: 15.0, right: 15.0),
          //         child: Text(
          //           'Or',
          //           style: TextStyle(color: Colors.black, fontSize: 16.0, fontFamily: 'WorkSansMedium'),
          //         ),
          //       ),
          //       Container(
          //         decoration: const BoxDecoration(
          //           gradient: LinearGradient(
          //               colors: <Color>[
          //                 Color(0xFF1B165C),
          //                 Colors.white10,
          //               ],
          //               begin: FractionalOffset(0.0, 0.0),
          //               end: FractionalOffset(1.0, 1.0),
          //               stops: <double>[0.0, 1.0],
          //               tileMode: TileMode.clamp),
          //         ),
          //         width: 100.0,
          //         height: 1.0,
          //       ),
          //     ],
          //   ),
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Padding(
          //       padding: const EdgeInsets.only(top: 10.0, right: 40.0),
          //       child: GestureDetector(
          //         onTap: () => CustomSnackBar(context, const Text('Facebook button pressed')),
          //         child: Container(
          //           padding: const EdgeInsets.all(15.0),
          //           decoration: const BoxDecoration(
          //             shape: BoxShape.circle,
          //             color: Color(0xFF0084ff),
          //           ),
          //           child: const Icon(
          //             FontAwesomeIcons.facebookF,
          //             color: Colors.white,
          //           ),
          //         ),
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(top: 10.0),
          //       child: GestureDetector(
          //         onTap: () => CustomSnackBar(context, const Text('Google button pressed')),
          //         child: Container(
          //           padding: const EdgeInsets.all(15.0),
          //           decoration: const BoxDecoration(
          //             shape: BoxShape.circle,
          //             color: Color(0xFF0084ff),
          //           ),
          //           child: const Icon(
          //             FontAwesomeIcons.google,
          //             color: Colors.white,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  void _toggleSignInButton() {
    CustomSnackBar(context, const Text('Login button pressed'));
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }
}
