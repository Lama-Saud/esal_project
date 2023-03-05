// TODO Implement this library.import 'package:final_project/components/esal_button.dart';
import 'package:final_project/components/esal_text_field.dart';
import 'package:final_project/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/esal_button.dart';

class AddInvPage extends StatelessWidget {
  const AddInvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
          child: ListView(
            children: [
              const EsalHeadingWidget(text: 'إضافة فاتورة'),
              const SizedBox(height: 20),
              const EsalSubheadingWidget(text: 'تفاصيل الفاتورة'),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 150,
                    width: 90,
                    child: Image.asset(
                      'lib/assets/invoice.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    children: const [
                      SizedBox(
                        width: 230,
                        child: EsalTextField(title: 'اسم الفاتورة'),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: 230,
                        child: EsalTextField(title: 'رقم الفاتورة'),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const EsalTextField(title: 'قيمة الفاتورة الإجمالية'),
              const SizedBox(height: 20),
              const EsalTextField(title: 'تاريخ الفاتورة'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 260,
                    child: EsalTextField(title: 'بالأيام، أو الأشهر، أو السنوات'),
                  ),
                  SizedBox(width: 20),
                  EsalSubheadingWidget(text: 'مدة\n الفاتورة'),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  DurationContainer(text: 'اسبوع'),
                  DurationContainer(text: 'شهر'),
                  DurationContainer(text: 'سنة', buttonColor: CustomTheme.darkBlue),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(Icons.arrow_drop_down_sharp),
                        SizedBox(width: 50),
                        Text('أجهزة كهربائية'),
                        SizedBox(width: 10),
                        Icon(Icons.electrical_services_rounded),
                      ],
                    ),
                  ),
                  // const SizedBox(
                  //   width: 260,
                  //   // child: EsalTextField(title: 'أجهزة كهربائية'),
                  // ),
                  const SizedBox(width: 20),
                  const EsalSubheadingWidget(text: 'أضف إلى'),
                ],
              ),
              const SizedBox(height: 20),
              const SizedBox(
                height: 100,
                child: EsalTextField(title: 'ملاحظات'),
              ),
              const SizedBox(height: 20),
              const EsalButton(text: 'حفظ'),
            ],
          ),
        ),
      ),
    );
  }
}

class DurationContainer extends StatelessWidget {
  const DurationContainer({
    this.buttonColor,
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)), color: buttonColor ?? CustomTheme.lightBlue),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 18),
          // textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class EsalSubheadingWidget extends StatelessWidget {
  const EsalSubheadingWidget({
    this.color,
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text, //El Messiri
      style: GoogleFonts.almarai(textStyle: const TextStyle(fontSize: 18)),
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
    return Text(
      text,
      textAlign: TextAlign.right,
      style: GoogleFonts.almarai(
        textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        //style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF1B165C)),
      ),
    );
  }
}
