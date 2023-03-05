import 'package:flutter/material.dart';

class ContaSubscPage extends StatelessWidget {
  const ContaSubscPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFF1B165C),
      // ),
      body: Column(
        children: [
          Container(
            width: 450,
            height: 208,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                color: Color(0xff1B165C)),
            child: const Padding(
              padding: EdgeInsets.only(top: 90, right: 32),
              child: Text(
                'الإشتركات',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(4),
              //   child: Container(
              //     width: 62,
              //     height: 60,
              //     decoration: BoxDecoration(
              //         borderRadius: const BorderRadius.all(
              //           Radius.circular(20),
              //         ),
              //         border: Border.all(
              //           width: 1,
              //           color: const Color(0xFF1B165C),
              //         ),
              //         color: Colors.white),
              //     child: const Icon(
              //       Icons.electrical_services,
              //       size: 30,
              //       color: Color(0xFF1B165C),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  width: 62,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xFF1B165C),
                      ),
                      color: Colors.white),
                  child: const Icon(
                    Icons.phone_iphone,
                    size: 30,
                    color: Color(0xFF1B165C),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Container(
                  width: 62,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xFF1B165C),
                      ),
                      color: Colors.white),
                  child: const Icon(
                    Icons.tv_outlined,
                    size: 30,
                    color: Color(0xFF1B165C),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Container(
                  width: 62,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xFF1B165C),
                      ),
                      color: Colors.white),
                  child: const Icon(
                    Icons.house_siding_outlined,
                    size: 30,
                    color: Color(0xFF1B165C),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Container(
                  width: 62,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1, color: const Color(0xFF1B165C)),
                      color: Colors.white),
                  child: const Icon(
                    Icons.folder,
                    size: 30,
                    color: Color(0xFF1B165C),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Container(
                  width: 62,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1, color: const Color(0xFF1B165C)),
                      color: Colors.white),
                  child: const Text(
                    'الكل',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF1B165C),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Container(
                  width: 62,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1, color: const Color(0xFF1B165C)),
                      color: Colors.white),
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Container(
              width: 324,
              height: 127,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
                color: Color(0xFF1B165C),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '٢٠-٢٠-٢٠٢٣',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          textAlign: TextAlign.end,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'ضمان مكيف',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          textAlign: TextAlign.end,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/SACO_Hardware_Logo.svg/220px-SACO_Hardware_Logo.svg.png',
                          width: 90,
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '٣ أيام',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.end,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '٤٠٠٠ ريال',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
