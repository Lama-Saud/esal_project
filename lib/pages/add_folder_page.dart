import 'package:final_project/components/esal_heading.dart';
import 'package:final_project/components/esal_subheading.dart';
import 'package:final_project/pages/folders_page.dart';
import 'package:final_project/theme.dart';
import 'package:flutter/material.dart';

class AddFolderPage extends StatelessWidget {
  const AddFolderPage({super.key});

//light blue  #73C6EB
// Dark blue  #1B165C

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 60,
            ),
            const EsalHeading(text: 'إضافة مجلد '),
            const SizedBox(
              height: 32,
            ),
            const EsalSubheading(text: 'اسم المجلد ', color: Colors.black),
            const SizedBox(
              height: 12,
            ),
            Container(
              decoration: const BoxDecoration(
                color: CustomTheme.skyBlue,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: const TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(right: 16),
                  hintText: 'ادخل اسم المجلد ',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const EsalSubheading(text: 'اختر ايقونة ', color: Colors.black),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(Icons.business, size: 35, color: CustomTheme.darkBlue),
                Icon(Icons.call, size: 35, color: CustomTheme.darkBlue),
                Icon(Icons.laptop, size: 35, color: CustomTheme.darkBlue),
                Icon(Icons.work, size: 35, color: CustomTheme.darkBlue),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(Icons.family_restroom, size: 35, color: CustomTheme.darkBlue),
                Icon(Icons.home, size: 35, color: CustomTheme.darkBlue),
                Icon(Icons.chair, size: 35, color: CustomTheme.darkBlue),
                Icon(Icons.directions_car_filled, size: 35, color: CustomTheme.darkBlue),
              ],
            ),
            const SizedBox(
              height: 140,
            ),
            InkWell(
              onTap: () {
                final navigator = Navigator.of(context);
                navigator.push(MaterialPageRoute(builder: (context) => const FoldersPage()));
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)), color: CustomTheme.darkBlue),
                child: const Center(
                  child: EsalSubheading(text: ' إضافة', color: Colors.white, fontWeight: FontWeight.bold),
                  // Text(
                  //   ' إضافة',
                  //   style: GoogleFonts.almarai(
                  //     textStyle: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
