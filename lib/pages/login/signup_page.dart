import 'package:flutter/material.dart';

import 'components/esal_button.dart';
import 'components/esal_text_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 80, 180, 226),
      body: Container(
        margin: const EdgeInsets.only(top: 80),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset('lib/assets/esal_logo.png', width: 80),
                const SizedBox(height: 30),
                const Text('تسجيل جديد', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                const Text(
                  'إيصال هو تطبيق يساعدك على حفظ وتنظيم فواتيرك وضماناتك في مكان واحد',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 40),
                const EsalTextField(
                  title: 'البريد الإلكتروني',
                  icon: Icons.mail,
                ),
                const SizedBox(height: 10),
                const EsalTextField(
                  icon: Icons.lock,
                  title: 'كلمة المرور',
                ),
                const SizedBox(height: 30),
                const EsalButton(text: 'تسجيل جديد'),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Text(
                          'تسجيل دخول',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromARGB(255, 80, 180, 226),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const Text(
                        'لديك حساب بالفعل؟ ',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
