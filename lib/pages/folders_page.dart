import 'package:final_project/components/esal_heading.dart';
import 'package:final_project/components/esal_subheading.dart';
import 'package:final_project/theme.dart';
import 'package:flutter/material.dart';

class FoldersPage extends StatelessWidget {
  const FoldersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.skyBlue,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios, color: CustomTheme.darkBlue),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('lib/assets/esal_logo.png', height: 50),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const EsalHeading(text: 'الملفات '),
            // const SizedBox(height: 60),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: CustomTheme.white,
                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                        //  border: Border.all(width: 5, color: CustomTheme.lightBlue.withOpacity(0.4)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.work_outline, size: 40, color: CustomTheme.darkBlue),
                          SizedBox(
                            height: 12,
                          ),
                          EsalSubheading(text: 'العمل ')
                        ],
                      )),
                  Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: CustomTheme.white,
                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                        //  border: Border.all(width: 5, color: CustomTheme.lightBlue.withOpacity(0.4)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.add, size: 40, color: Colors.red),
                          SizedBox(
                            height: 12,
                          ),
                          EsalSubheading(text: 'إضافة ملف  ')
                        ],
                      )),
                  Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: CustomTheme.white,
                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                        //  border: Border.all(width: 5, color: CustomTheme.lightBlue.withOpacity(0.4)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.devices, size: 40, color: CustomTheme.darkBlue),
                          SizedBox(
                            height: 12,
                          ),
                          EsalSubheading(text: 'أجهزة ')
                        ],
                      )),
                  Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: CustomTheme.white,
                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                        //  border: Border.all(width: 5, color: CustomTheme.lightBlue.withOpacity(0.4)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.chair_outlined, size: 40, color: CustomTheme.darkBlue),
                          SizedBox(
                            height: 12,
                          ),
                          EsalSubheading(text: 'أثاث ')
                        ],
                      )),
                  Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: CustomTheme.white,
                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                        //  border: Border.all(width: 5, color: CustomTheme.lightBlue.withOpacity(0.4)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.drive_eta_outlined, size: 40, color: CustomTheme.darkBlue),
                          SizedBox(
                            height: 12,
                          ),
                          EsalSubheading(text: ' المواصلات')
                        ],
                      )),
                  Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: CustomTheme.white,
                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                        //  border: Border.all(width: 5, color: CustomTheme.lightBlue.withOpacity(0.4)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.phone_enabled_outlined, size: 40, color: CustomTheme.darkBlue),
                          SizedBox(
                            height: 12,
                          ),
                          EsalSubheading(text: 'خدمات الهاتف  ')
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
