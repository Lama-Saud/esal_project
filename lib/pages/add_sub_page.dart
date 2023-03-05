import 'package:final_project/components/esal_button.dart';
import 'package:final_project/components/esal_text_field.dart';
import 'package:flutter/material.dart';

import '../theme.dart';
import 'add_inv_page.dart';

class AddSubPage extends StatelessWidget {
  const AddSubPage({super.key});

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
              const EsalHeadingWidget(text: 'إضافة اشتراك'),
              const SizedBox(height: 20),
              const EsalSubheadingWidget(text: 'تفاصيل الاشتراك'),
              const SizedBox(height: 20),
              const EsalTextField(title: 'اسم خطة الاشتراك'),
              const SizedBox(height: 20),
              const EsalTextField(title: 'القيمة الإجمالية'),
              const SizedBox(height: 20),
              const EsalTextField(title: 'تاريخ الاشتراك'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 340,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.arrow_drop_down_sharp),
                        // SizedBox(width: 50),
                        Text('مزود الخدمة'),
                      ],
                    ),
                  ),
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
                        SizedBox(width: 90),
                        Text('جوالات'),
                        SizedBox(width: 10),
                        Icon(Icons.phone_iphone),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  const EsalSubheadingWidget(text: 'أضف إلى'),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  EsalSubheadingWidget(text: 'جدد كل'),
                  SizedBox(width: 40),
                  DurationContainer(text: 'شهر'),
                  DurationContainer(text: 'سنة', buttonColor: CustomTheme.darkBlue),
                ],
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
