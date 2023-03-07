import 'package:final_project/components/esal_heading.dart';
import 'package:final_project/components/esal_subheading.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class InvoiceMethodPage extends StatefulWidget {
  const InvoiceMethodPage({Key? key}) : super(key: key);

  @override
  State<InvoiceMethodPage> createState() => _InvoiceMethodPageState();
}

class _InvoiceMethodPageState extends State<InvoiceMethodPage> {
  int currentStep = 0;

  List<Step> getSteps() => [
        Step(
            isActive: currentStep >= 0,
            title: const EsalHeading(text: 'ماذا تريد أن تضيف  '),
            content: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        //   padding: const EdgeInsets.all(20),
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: CustomTheme.skyBlue,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          //  border: Border.all(width: 5, color: CustomTheme.lightBlue.withOpacity(0.4)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.receipt_outlined,
                              size: 60,
                              color: CustomTheme.darkBlue,
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    const EsalSubheading(text: 'فاتورة'),
                    const SizedBox(
                      height: 32,
                    ),
                    Container(
                        //   padding: const EdgeInsets.all(20),
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: CustomTheme.skyBlue,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          //  border: Border.all(width: 5, color: CustomTheme.lightBlue.withOpacity(0.4)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.subscriptions_outlined,
                              size: 60,
                              color: CustomTheme.darkBlue,
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    const EsalSubheading(text: 'اشتراك'),
                  ],
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            )),
        Step(
          isActive: currentStep >= 1,
          title: const EsalHeading(text: 'أختر طريقة الإضافة '),
          content: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              Container(
                  //   padding: const EdgeInsets.all(20),
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: CustomTheme.skyBlue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    //  border: Border.all(width: 5, color: CustomTheme.lightBlue.withOpacity(0.4)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://pngimage.net/wp-content/uploads/2018/06/photo-gallery-icon-png-5.png',
                        color: CustomTheme.darkBlue,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 16,
              ),
              const EsalSubheading(text: 'إضافة صوره من الالبوم / الكاميرا '),
              const SizedBox(
                height: 32,
              ),
              Container(
                //   padding: const EdgeInsets.all(20),
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  color: CustomTheme.skyBlue,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  //  border: Border.all(width: 5, color: CustomTheme.lightBlue.withOpacity(0.4)),
                ),
                child: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/25/25350.png',
                  color: CustomTheme.darkBlue,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const EsalSubheading(text: 'مسح الباركود '),
              const SizedBox(
                height: 32,
              ),
              Container(
                  //   padding: const EdgeInsets.all(20),
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: CustomTheme.skyBlue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    //  border: Border.all(width: 5, color: CustomTheme.lightBlue.withOpacity(0.4)),
                  ),
                  child: Image.network(
                    'https://cdn.iconscout.com/icon/free/png-256/qr-code-1851030-1569017.png',
                    color: CustomTheme.darkBlue,
                  )),
              const SizedBox(
                height: 16,
              ),
              const EsalSubheading(text: 'مسح QR كود '),
              const SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            final navigator = Navigator.of(context);
            navigator.pop();
          },
          child: const Icon(Icons.arrow_back_ios, color: Color(0xFF1B165C)),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Theme(
                data: Theme.of(context).copyWith(
                    colorScheme: Theme.of(context)
                        .colorScheme
                        .copyWith(onSurface: Colors.blue.shade200, primary: const Color(0xFF1B165C))),
                child: Stepper(
                  controlsBuilder: (BuildContext context, ControlsDetails details) {
                    return Row(
                      children: <Widget>[
                        InkWell(
                          onTap: details.onStepCancel,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            width: 100,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(30)), color: Color(0xFF1B165C)),
                            child: const Center(
                                child:
                                    EsalSubheading(text: ' إلغاء', color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        InkWell(
                          onTap: details.onStepContinue,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            width: 100,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(30)), color: Color(0xFF1B165C)),
                            child: const Center(
                              child: EsalSubheading(text: ' التالي ', color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  type: StepperType.vertical,
                  steps: getSteps(),
                  currentStep: currentStep,
                  onStepContinue: () {
                    final isLastStep = currentStep == getSteps().length - 1;
                    if (isLastStep) {
                      print('complete');
                      //send data to server
                    } else {
                      setState(() {
                        currentStep += 1;
                      });
                    }
                  },
                  onStepCancel: () => setState(() {
                    currentStep -= 1;
                  }),
                ),
              ),

              const SizedBox(
                height: 200,
              ),
              // InkWell(
              //   onTap: () {
              //     final navigator = Navigator.of(context);
              //     navigator.push(MaterialPageRoute(builder: (context) => const AddingWayPage()));
              //   },
              //   child: SizedBox(
              //     height: 100,
              //     width: 100,
              //     child: CircleAvatar(
              //       backgroundColor: Colors.blue,
              //       child: Image.network(
              //         'https://static.vecteezy.com/system/resources/previews/000/350/512/non_2x/invoice-vector-icon.jpg',
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 16,
              // ),
              // const Text(
              //   'فاتورة ',
              //   style: TextStyle(
              //     fontSize: 18,
              //     color: Colors.black,
              //   ),
              // ),
              // const SizedBox(
              //   height: 60,
              // ),
              // SizedBox(
              //   height: 100,
              //   width: 100,
              //   child: Image.network(
              //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfGLXph98tTHrsIMdL3Y5qTzu0VgAeyA5qnX1aNQcCzD3B-FF-R6byusPEwXdywSdB8gs&usqp=CAU'
              //       // 'https://is5-ssl.mzstatic.com/image/thumb/Purple112/v4/f8/02/5a/f8025af4-92b6-2852-59ca-09d4ca2314a0/AppIcon-0-0-1x_U007emarketing-0-0-0-10-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/256x256bb.jpg',
              //       ),
              // ),
              // const SizedBox(
              //   height: 16,
              // ),
              // const Text(
              //   'اشتراك',
              //   style: TextStyle(
              //     fontSize: 18,
              //     color: Colors.black,
              //   ),
              // ),
              // SizedBox(
              //   height: 100,
              //   width: 100,
              //   child: Image.network(
              //       'https://www.clipartmax.com/png/middle/247-2472945_invoice-bill-icon-vector-illustration-bill-icon.png'
              //       // 'https://is5-ssl.mzstatic.com/image/thumb/Purple112/v4/f8/02/5a/f8025af4-92b6-2852-59ca-09d4ca2314a0/AppIcon-0-0-1x_U007emarketing-0-0-0-10-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/256x256bb.jpg',
              //       ),
              // ),
              // SizedBox(
              //     height: 100,
              //     child: Image.network(
              //         'https://demo.wpswings.com/subscriptions-for-woocommerce-pro/wp-content/themes/storefront/assets/images/Certain-Date-of-a-Month-Subscription.png')),
            ],
          ),
        ),
      ),
    );
  }
}
