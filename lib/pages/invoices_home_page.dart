// import 'package:flutter/material.dart';

// import '../theme.dart';

// class InvoicesHomePage extends StatelessWidget {
//   const InvoicesHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             width: 450,
//             height: 208,
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
//               color: CustomTheme.darkBlue,
//             ),
//             child: const Padding(
//               padding: EdgeInsets.only(top: 90, right: 32),
//               child: Text(
//                 'الفواتير والضمانات',
//                 style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//                 textAlign: TextAlign.right,
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               // Padding(
//               //   padding: const EdgeInsets.all(4),
//               //   child: Container(
//               //     width: 62,
//               //     height: 60,
//               //     decoration: BoxDecoration(
//               //         borderRadius: const BorderRadius.all(
//               //           Radius.circular(20),
//               //         ),
//               //         border: Border.all(
//               //           width: 1,
//               //           color: const Color(0xFF1B165C),
//               //         ),
//               //         color: Colors.white),
//               //     child: const Icon(
//               //       Icons.electrical_services,
//               //       size: 30,
//               //       color: Color(0xFF1B165C),
//               //     ),
//               //   ),
//               // ),
//               Padding(
//                 padding: const EdgeInsets.all(4),
//                 child: Container(
//                   width: 62,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.all(Radius.circular(20)),
//                     border: Border.all(width: 1, color: CustomTheme.darkBlue),
//                     color: Colors.white,
//                   ),
//                   child: const Icon(Icons.phone_iphone, size: 30, color: CustomTheme.darkBlue),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(4),
//                 child: Container(
//                   width: 62,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.all(Radius.circular(20)),
//                     border: Border.all(width: 1, color: CustomTheme.darkBlue),
//                     color: Colors.white,
//                   ),
//                   child: const Icon(Icons.tv_outlined, size: 30, color: CustomTheme.darkBlue),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(4),
//                 child: Container(
//                   width: 62,
//                   height: 60,
//                   decoration: BoxDecoration(
//                       borderRadius: const BorderRadius.all(Radius.circular(20)),
//                       border: Border.all(width: 1, color: CustomTheme.darkBlue),
//                       color: Colors.white),
//                   child: const Icon(Icons.house_siding_outlined, size: 30, color: CustomTheme.darkBlue),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: Container(
//                   width: 62,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.all(Radius.circular(20)),
//                     border: Border.all(width: 1, color: CustomTheme.darkBlue),
//                     color: Colors.white,
//                   ),
//                   child: const Icon(Icons.folder, size: 30, color: CustomTheme.darkBlue),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(4),
//                 child: Container(
//                   width: 62,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.all(Radius.circular(20)),
//                     border: Border.all(width: 1, color: CustomTheme.darkBlue),
//                     color: Colors.white,
//                   ),
//                   child: const Text(
//                     'الكل',
//                     style: TextStyle(fontSize: 20, color: CustomTheme.darkBlue),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(4),
//                 child: Container(
//                   width: 62,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.all(Radius.circular(20)),
//                     border: Border.all(width: 1, color: CustomTheme.darkBlue),
//                     color: Colors.white,
//                   ),
//                   child: const Icon(Icons.add),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(24),
//             child: Container(
//               width: 324,
//               height: 127,
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(24)),
//                 color: CustomTheme.darkBlue,
//               ),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(12),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           '٢٠-٢٠-٢٠٢٣',
//                           style: TextStyle(fontSize: 18, color: Colors.white),
//                           textAlign: TextAlign.end,
//                         ),
//                         const SizedBox(width: 10),
//                         const Text(
//                           'ضمان مكيف',
//                           style: TextStyle(fontSize: 18, color: Colors.white),
//                           textAlign: TextAlign.end,
//                         ),
//                         const SizedBox(width: 10),
//                         Image.network(
//                           'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/SACO_Hardware_Logo.svg/220px-SACO_Hardware_Logo.svg.png',
//                           width: 90,
//                           height: 50,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       Text(
//                         '٣ أيام',
//                         style: TextStyle(fontSize: 18, color: Colors.white),
//                         textAlign: TextAlign.end,
//                       ),
//                       SizedBox(width: 20),
//                       Text(
//                         '٤٠٠٠ ريال',
//                         style: TextStyle(fontSize: 18, color: Colors.white),
//                         textAlign: TextAlign.end,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:final_project/components/esal_button.dart';
import 'package:final_project/components/esal_heading.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class InvoicesHomePage extends StatelessWidget {
  const InvoicesHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: ListView(
          children: [
            const EsalHeading(text: 'الفواتير والضمانات'),
            const SizedBox(height: 20),
            const InvoicesContainer(),
            const InvoicesContainer(),
            const SizedBox(height: 10),
            EsalButton(press: () {}, text: 'حفظ'),
          ],
        ),
      ),
    );
  }
}

class InvoicesContainer extends StatelessWidget {
  const InvoicesContainer({
    Key? key,
    // required this.title,
    // required this.UrlNetwork,
    // this.icon,
    // required this.date,
    // required this.price,
    // required this.expiry,
  }) : super(key: key);

  // final String title;
  // final String UrlNetwork;
  // final IconData? icon;
  // final String date;
  // final String price;
  // final String expiry;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: CustomTheme.skyBlue,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(title),
          // Image.network(UrlNetwork),
          // Icon(icon),
          // Text(date),
          // Text(price),
          // Text(expiry),
          Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/SACO_Hardware_Logo.svg/220px-SACO_Hardware_Logo.svg.png',
            width: 100,
          ),
          Container(
            padding: const EdgeInsets.only(top: 16.0, right: 16),
            child: Row(
              children: const [
                Text('ضمان مكيف'),
                SizedBox(width: 10),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: const [
                Icon(Icons.calendar_month),
                SizedBox(width: 8),
                Text('07/03/2023'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: const [
                Icon(Icons.attach_money),
                SizedBox(width: 8),
                Text('400 SR'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: const [
                Icon(Icons.info_outline),
                SizedBox(width: 8),
                Text('تبقى ٣ أيام '),
              ],
            ),
          ),
        ],
      ),
      // child: const Text('other?'), // we can add the invoice that is about to end
    );
  }
}
