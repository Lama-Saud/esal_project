import 'package:final_project/components/esal_button.dart';
import 'package:final_project/components/esal_heading.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class ProvidersPage extends StatelessWidget {
  const ProvidersPage({super.key});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                EsalHeading(text: 'مزودي الخدمة'),
              ],
            ),
            // const Text(
            //   'مزودي الخدمة',
            //   style: TextStyle(
            //     fontSize: 25,
            //     fontWeight: FontWeight.bold,
            //     color: Color(0xFF1B165C),
            //   ),
            // ),

            const SizedBox(height: 20),
            const ProviderContainer(),
            const ProviderContainer(),
            const ProviderContainer(),

            // const SizedBox(height: 34),
            // Container(
            //   width: 324,
            //   height: 127,
            //   decoration: const BoxDecoration(
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(24),
            //     ),
            //     color: Color(0xFF1B165C),
            //   ),
            //   child: Column(
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           const Text(
            //             'ساكو',
            //             style: TextStyle(fontSize: 18, color: Colors.white),
            //             textAlign: TextAlign.end,
            //           ),
            //           const SizedBox(
            //             width: 10,
            //           ),
            //           Image.network(
            //             'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/SACO_Hardware_Logo.svg/220px-SACO_Hardware_Logo.svg.png',
            //             width: 90,
            //             height: 50,
            //           ),
            //         ],
            //       ),
            //       const Text(
            //         '٩٢٠٠٠١٥٣٠',
            //         style: TextStyle(
            //           fontSize: 18,
            //           color: Colors.white,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 34),
            // Container(
            //   width: 324,
            //   height: 127,
            //   decoration: const BoxDecoration(
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(24),
            //     ),
            //     color: Color(0xFF1B165C),
            //   ),
            //   child: Column(
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           const Text(
            //             'جرير',
            //             style: TextStyle(fontSize: 18, color: Colors.white),
            //             textAlign: TextAlign.end,
            //           ),
            //           const SizedBox(
            //             width: 20,
            //           ),
            //           Image.network(
            //             'https://upload.wikimedia.org/wikipedia/ar/thumb/3/3b/Jarir_Bookstore_Logo.svg/2560px-Jarir_Bookstore_Logo.svg.png',
            //             width: 90,
            //             height: 50,
            //           ),
            //         ],
            //       ),
            //       const Text(
            //         '٩٢٠٠٠١٥٣٠',
            //         style: TextStyle(
            //           fontSize: 18,
            //           color: Colors.white,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 10),
            EsalButton(press: () {}, text: 'حفظ'),
            // GestureDetector(
            //   onTap: () {
            //     // Navigator.push(context, MaterialPageRoute(builder: (context) => const SubscriptionPage()));
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.only(
            //       left: 19,
            //     ),
            //     child: Container(
            //       width: 390,
            //       height: 60,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(30),
            //         color: const Color(0xFF1B165C),
            //       ),
            //       child: const Center(
            //         child: Text(
            //           ' حفظ',
            //           style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 25,
            //             fontWeight: FontWeight.w500,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class ProviderContainer extends StatelessWidget {
  const ProviderContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      height: 150,
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/SACO_Hardware_Logo.svg/220px-SACO_Hardware_Logo.svg.png',
            width: 100,
          ),
          Container(
            padding: const EdgeInsets.only(top: 16.0, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text('92000153'),
                SizedBox(width: 10),
                Icon(Icons.phone_enabled_rounded),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text('https://www.jarir.com/sa-en'),
                SizedBox(width: 10),
                Icon(Icons.explore_sharp),
              ],
            ),
          ),
        ],
      ),
      // child: const Text('other?'), // we can add the invoice that is about to end
    );
  }
}
