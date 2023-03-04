import 'package:final_project/pages/login/components/esal_button.dart';
import 'package:final_project/pages/login/components/esal_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddInvPage extends StatelessWidget {
  const AddInvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Color(0xFF1B165C),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: ListView(
          children: [
            const EsalHeadingWidget(text: 'إضافة فاتورة'),
            const EsalSubheadingWidget(text: 'تفاصيل الفاتورة'),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Placeholder(
                  fallbackHeight: 110,
                  fallbackWidth: 90,
                ),
                const SizedBox(width: 15),
                Column(
                  children: const [
                    SizedBox(
                      width: 250,
                      child: EsalTextField(title: 'اسم الفاتورة'),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 250,
                      child: EsalTextField(title: 'رقم الفاتورة'),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            const EsalTextField(title: 'قيمة الفاتورة الإجمالية'),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: const [
            //     EsalSubheadingWidget(text: 'ريال سعودي'),
            //     SizedBox(width: 10),
            //     SizedBox(
            //       width: 260,
            //       child: EsalTextField(title: 'قيمة الفاتورة الإجمالية'),
            //     ),
            //   ],
            // )
            const SizedBox(height: 10),
            const EsalTextField(title: 'تاريخ الفاتورة'),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 260,
                  child: EsalTextField(title: 'مثال: 9'),
                ),
                SizedBox(width: 20),
                EsalSubheadingWidget(text: 'مدة الفاتورة'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                SizedBox(width: 100, child: EsalButton(text: 'اسبوع')),
                SizedBox(width: 100, child: EsalButton(text: 'شهر')),
                SizedBox(width: 100, child: EsalButton(text: 'سنة')),
              ],
            ),
            const SizedBox(height: 20),
            const EsalButton(text: 'حفظ'),
          ],
        ),
      ),
    );
  }
}

class EsalSubheadingWidget extends StatelessWidget {
  const EsalSubheadingWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text, //El Messiri
      style: GoogleFonts.almarai(
        textStyle: const TextStyle(fontSize: 18),
      ),
      textAlign: TextAlign.right,
    );
  }
}

class EsalHeadingWidget extends StatelessWidget {
  const EsalHeadingWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF1B165C)),
        textAlign: TextAlign.right);
  }
}
