import 'package:final_project/components/esal_heading.dart';
import 'package:final_project/theme.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;

  final controller = LiquidController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: [
              Container(
                padding: const EdgeInsets.all(32),
                color: CustomTheme.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network(
                      'https://cdn-icons-png.flaticon.com/512/552/552791.png',
                      height: size.height * 0.4,
                    ),
                    Column(
                      children: const [
                        EsalHeading(text: 'تطبيق ايصال '),
                        Text(
                          'hi',
                          textAlign: TextAlign.center,
                        ),
                        Text('1/3')
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: CustomTheme.skyBlue,
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      'https://cdn-icons-png.flaticon.com/512/552/552791.png',
                      height: size.height * 0.5,
                    ),
                    Column(
                      children: const [
                        Text('hknnnnnnni'),
                        Text(
                          'hd444i',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                    const Text('1/3')
                  ],
                ),
              ),
              Container(
                color: CustomTheme.lightBlue,
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      'https://cdn-icons-png.flaticon.com/512/552/552791.png',
                      height: size.height * 0.5,
                    ),
                    Column(
                      children: const [
                        Text('knknknknk'),
                        Text(
                          'hkjnknknknki',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const Text('hi')
                  ],
                ),
              ),
            ],
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
            liquidController: controller,
            onPageChangeCallback: onPageChangeCallback,
          ),
          Positioned(
              bottom: 40,
              child: OutlinedButton(
                onPressed: () {
                  int nextPage = controller.currentPage + 1;
                  controller.animateToPage(page: nextPage);
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(
                      color: Colors.black,
                    ),
                    padding: const EdgeInsets.all(20.0),
                    shape: const CircleBorder()),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: CustomTheme.darkBlue),
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              )),
          Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                  onPressed: () {
                    controller.jumpToPage(page: 2);
                  },
                  child: const Text(
                    'skip',
                    style: TextStyle(color: Colors.grey),
                  ))),
          Positioned(
              bottom: 20,
              child: AnimatedSmoothIndicator(
                activeIndex: controller.currentPage,
                count: 3,
                effect: const WormEffect(activeDotColor: CustomTheme.darkBlue, dotHeight: 5),
              ))
        ],
      ),
    );
  }

  void onPageChangeCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }
}
