import 'package:flutter/material.dart';

class ServiceProviders extends StatelessWidget {
  const ServiceProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Color(0xFF1B165C),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 290),
            child: Text(
              'مزودي الخدمة',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B165C),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            width: 300,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(24),
              ),
              border: Border.all(width: 2, color: const Color(0xFF1B165C)),
            ),
            child: const Icon(
              Icons.search_outlined,
              color: Color(0xFF1B165C),
              size: 35,
            ),
          ),
          const SizedBox(
            height: 34,
          ),
          Container(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'ساكو',
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
                const Text(
                  '٩٢٠٠٠١٥٣٠',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 34,
          ),
          Container(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'جرير',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.end,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia/ar/thumb/3/3b/Jarir_Bookstore_Logo.svg/2560px-Jarir_Bookstore_Logo.svg.png',
                      width: 90,
                      height: 50,
                    ),
                  ],
                ),
                const Text(
                  '٩٢٠٠٠١٥٣٠',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 230,
          ),
          GestureDetector(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const SubscriptionPage()));
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 19,
              ),
              child: Container(
                width: 390,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFF1B165C),
                ),
                child: const Center(
                  child: Text(
                    ' حفظ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
