import 'package:final_project/components/esal_heading.dart';
import 'package:final_project/components/esal_subheading.dart';
import 'package:final_project/theme.dart';
import 'package:flutter/material.dart';

class InvoiceDetailPage extends StatelessWidget {
  const InvoiceDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: CustomTheme.darkBlue,
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                ClipPath(
                  clipper: ZigZagClipper(),
                  child: Container(
                    height: 800,
                    width: 350,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 50,
                              width: 250,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 222, 245, 255),
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                              ),
                              child: const Center(
                                child: EsalSubheading(
                                  text: 'رقم الفاتوزه :34884849',
                                  // color: CustomTheme.white,
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          const EsalSubheading(text: 'تفاصيل الفاتورة'),
                          const SizedBox(
                            height: 32,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const EsalHeading(text: 'جرير '),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Image.network(
                                    'https://play-lh.googleusercontent.com/sGJ92rD1dBl0Z-ybhp3GAUp8Pj-R3G44WCz4at5Z7kCoS0bPdPQmrbffYCbeBN9tDTM',
                                    height: 60,
                                    width: 60,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                            height: 160,
                            width: 100,
                            child: Image.asset(
                              'lib/assets/invoice.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              EsalSubheading(text: 'ضمان الابتوب '),
                              EsalSubheading(text: 'اسم الفاتورة'),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              EsalSubheading(text: '2 / 5 / 2023  '),
                              EsalSubheading(text: 'تاريخ الفاتورة '),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              EsalSubheading(text: '٢٤ شهر  '),
                              EsalSubheading(text: 'مدة الفاتوره '),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              EsalSubheading(text: 'أجهزه  '),
                              EsalSubheading(text: 'الفئه'),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Container(
                              height: 70,
                              width: 300,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: CustomTheme.darkBlue),
                                //  color: const Color.fromARGB(255, 222, 245, 255),
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      EsalSubheading(
                                        text: ' جهاز ماك بوك للدراسه',
                                        // color: CustomTheme.white,
                                      ),
                                      EsalSubheading(text: 'ملاحظات : '),
                                    ],
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 32,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              EsalHeading(text: '3600 ر.س'),
                              EsalSubheading(text: 'القيمة الاجماليه '),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ZigZagClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    double x = 0;
    double y = size.height;
    double increment = size.width / 20;

    while (x < size.width) {
      x += increment;
      y = (y == size.height) ? size.height * .95 : size.height;
      path.lineTo(x, y);
    }
    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) {
    return old != this;
  }
}
