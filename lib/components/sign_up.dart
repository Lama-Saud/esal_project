import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/add_invoice_page.dart';
import 'esal_button.dart';
import 'snackbar.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FocusNode focusNodePassword = FocusNode();
  final FocusNode focusNodeConfirmPassword = FocusNode();
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodeName = FocusNode();

  bool _obscureTextPassword = true;
  final bool _obscureTextConfirmPassword = true;

  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupConfirmPasswordController = TextEditingController();

  @override
  void dispose() {
    focusNodePassword.dispose();
    focusNodeConfirmPassword.dispose();
    focusNodeEmail.dispose();
    focusNodeName.dispose();
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
                elevation: 2.0,
                color: const Color.fromARGB(255, 248, 248, 248),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SizedBox(
                  width: 300.0,
                  height: 280.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            focusNode: focusNodeName,
                            controller: signupNameController,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            autocorrect: false,
                            style: const TextStyle(fontFamily: 'WorkSansSemiBold', fontSize: 16.0, color: Colors.black),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                FontAwesomeIcons.user,
                                color: Colors.grey,
                              ),
                              hintText: '??????????',
                              hintStyle: TextStyle(fontFamily: 'WorkSansSemiBold', fontSize: 16.0),
                            ),
                            onSubmitted: (_) {
                              focusNodeEmail.requestFocus();
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
                            focusNode: focusNodeEmail,
                            controller: signupEmailController,
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            style: const TextStyle(fontFamily: 'WorkSansSemiBold', fontSize: 16.0, color: Colors.black),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                FontAwesomeIcons.envelope,
                                color: Colors.grey,
                              ),
                              hintText: '???????????? ????????????????????',
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
                            controller: signupPasswordController,
                            obscureText: _obscureTextPassword,
                            autocorrect: false,
                            style: const TextStyle(fontFamily: 'WorkSansSemiBold', fontSize: 16.0, color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: const Icon(
                                FontAwesomeIcons.lock,
                                color: Colors.grey,
                              ),
                              hintText: '???????? ????????????',
                              hintStyle: const TextStyle(fontFamily: 'WorkSansSemiBold', fontSize: 16.0),
                              suffixIcon: GestureDetector(
                                onTap: _toggleSignup,
                                child: Icon(
                                  !_obscureTextPassword ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
                                  size: 15.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            onSubmitted: (_) {
                              focusNodeConfirmPassword.requestFocus();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 260.0),
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 64.0),
                child: MaterialButton(
                  highlightColor: Colors.white,
                  splashColor: Colors.white,
                  onPressed: () async {
                    final email = signupEmailController.text;
                    final password = signupPasswordController.text;
                    setState(() {});

                    try {
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddInvoicePage()));
                    } on FirebaseAuthException catch (error) {
                      if (error.code == 'email-already-in-use') {
                        final snackbar = SnackBar(
                          content: const Text('???????????? ?????????? ?????????????? ???? ???????????? ????????????'),
                          backgroundColor: Colors.red[300],
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);

                        // message = 'Email Already Exists';
                        setState(() {});
                        print('Email Already Exists');
                      } else {
                        if (error.code == 'weak-password') {
                          final snackbar = SnackBar(
                            content: const Text('???????? ???????????? ??????????'),
                            backgroundColor: Colors.red[300],
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);

                          // message = 'Weak Password';
                          setState(() {});
                          print('Weak Password');
                        }
                      }
                      print(error);
                    }
                  },
                  // onPressed: () => _toggleSignUpButton(),
                  child: EsalButton(text: '?????????? ????????', press: () {}),
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(top: 260.0),
              //   decoration: const BoxDecoration(
              //     borderRadius: BorderRadius.all(Radius.circular(5.0)),
              //     boxShadow: <BoxShadow>[
              //       BoxShadow(
              //         color: CustomTheme.loginGradientStart,
              //         offset: Offset(1.0, 6.0),
              //         blurRadius: 20.0,
              //       ),
              //       BoxShadow(
              //         color: CustomTheme.loginGradientEnd,
              //         offset: Offset(1.0, 6.0),
              //         blurRadius: 20.0,
              //       ),
              //     ],
              //     gradient: LinearGradient(
              //         colors: <Color>[CustomTheme.loginGradientEnd, CustomTheme.loginGradientStart],
              //         begin: FractionalOffset(0.2, 0.2),
              //         end: FractionalOffset(1.0, 1.0),
              //         stops: <double>[0.0, 1.0],
              //         tileMode: TileMode.clamp),
              //   ),
              //   child: MaterialButton(
              //     highlightColor: Colors.transparent,
              //     splashColor: CustomTheme.loginGradientEnd,
              //     child: const Padding(
              //       padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
              //       child: Text(
              //         'SIGN UP',
              //         style: TextStyle(color: Colors.white, fontSize: 25.0, fontFamily: 'WorkSansBold'),
              //       ),
              //     ),
              //     /////////////////////////////////////////////////
              //     onPressed: () => _toggleSignUpButton(),
              //   ),
              // )
            ],
          ),
        ],
      ),
    );
  }

  void _toggleSignUpButton() {
    CustomSnackBar(context, const Text('SignUp button pressed'));
  }

  void _toggleSignup() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }

  // void _toggleSignupConfirm() {
  //   setState(() {
  //     _obscureTextConfirmPassword = !_obscureTextConfirmPassword;
  //   });
  // }
}
