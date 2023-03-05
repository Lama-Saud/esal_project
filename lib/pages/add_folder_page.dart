import 'package:final_project/components/esal_heading.dart';
import 'package:final_project/components/esal_subheading.dart';
import 'package:final_project/pages/invoice_method_page.dart';
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
            // Text(
            //   'إضافة مجلد ',
            //   style: GoogleFonts.almarai(
            //     textStyle: const TextStyle(
            //       fontSize: 25,
            //       color: Color(0xFF1B165C),
            //     ),
            //   ),
            //   textDirection: TextDirection.rtl,
            // ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                EsalSubheading(text: 'اسم المجلد ', color: Colors.black),
                // Text(
                //   'اسم المجلد ',
                //   style: GoogleFonts.almarai(
                //     textStyle: const TextStyle(
                //       fontSize: 18,
                //       color: Colors.black,
                //     ),
                //   ),
                // ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 223, 221, 221),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                EsalSubheading(text: 'اختر لون ', color: Colors.black),
                // Text(
                //   'اختر لون ',
                //   style: GoogleFonts.almarai(
                //     textStyle: const TextStyle(
                //       fontSize: 18,
                //       color: Colors.black,
                //     ),
                //   ),
                // ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CircleAvatar(backgroundColor: Color(0xFFff69eb)),
                CircleAvatar(backgroundColor: Color(0xFF74d3ae)),
                CircleAvatar(backgroundColor: Color(0xFF3a86ff)),
                CircleAvatar(backgroundColor: Color(0xFFfb5607)),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CircleAvatar(backgroundColor: Color(0xFFffbe0b)),
                CircleAvatar(backgroundColor: Color(0xFF8338ec)),
                CircleAvatar(backgroundColor: Color(0xFFe8ec67)),
                CircleAvatar(backgroundColor: Color(0xFFff006e)),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                EsalSubheading(text: 'اختر ايقونة ', color: Colors.black),
                // Text(
                //   'اختر ايقونة ',
                //   style: GoogleFonts.almarai(
                //     textStyle: const TextStyle(
                //       fontSize: 18,
                //       color: Colors.black,
                //     ),
                //   ),
                // ),
              ],
            ),
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
                navigator.push(MaterialPageRoute(builder: (context) => const InvoiceMethodPage()));
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
