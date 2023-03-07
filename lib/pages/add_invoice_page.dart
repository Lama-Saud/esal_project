import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/components/esal_text_field.dart';
import 'package:final_project/models/folder.dart';
import 'package:final_project/theme.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart' as intl;

import '../components/esal_button.dart';
import '../components/esal_heading.dart';
import '../components/esal_subheading.dart';
import '../models/invoice.dart';

class Customer {
  final String name;
  final String price;

  Customer({
    required this.name,
    required this.price,
  });
}

class AddInvoicePage extends StatefulWidget {
  const AddInvoicePage({super.key});

  @override
  State<AddInvoicePage> createState() => _AddInvoicePageState();
}

class _AddInvoicePageState extends State<AddInvoicePage> {
  TextEditingController invoicecNameController = TextEditingController();
  TextEditingController invoiceNoController = TextEditingController();
  TextEditingController invoicePriceController = TextEditingController();
  TextEditingController invoiceDurationController = TextEditingController();
  TextEditingController invoiceStoreController = TextEditingController();
  TextEditingController invoiceNotesController = TextEditingController();
  TextEditingController invoiceDateController = TextEditingController();
  String invoiceFolder = '';

  int duration = 0;
  int totalDuration = 0;
  bool weekSelected = false;
  bool monthSeleted = false;
  bool yearSelected = false;

  String? folderName;
  IconData? folderIcon;

  File? _image;
  String imageUrl = '';

  var tempDate = DateTime.now();

  @override
  void dispose() {
    invoicecNameController.clear();
    invoicecNameController.clear();
    invoiceNoController.clear();
    invoicePriceController.clear();
    invoiceDurationController.clear();
    invoiceStoreController.clear();
    invoiceNotesController.clear();
    invoiceDateController.clear();
    super.dispose();
  }

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final tempImage = File(image.path);

    setState(() {
      _image = tempImage;
    });
  }

  saveInvoice() async {
    try {
      final ref = FirebaseStorage.instance.ref().child('invoices/${invoiceNoController.text}');
      // await ref.putFile(File(_image!.path));
      await ref.putFile(_image!);

      final url = await ref.getDownloadURL();

      setState(() {
        imageUrl = url;
      });

      var t =
          DateTime(tempDate.year, tempDate.month, tempDate.day + int.parse(invoiceDurationController.text) * duration);
      print(t);
      Duration diff = t.difference(DateTime.now());
      print(diff.inDays);

      final invoice = Invoice(
        invoice_no: invoiceNoController.text,
        price: double.parse(invoicePriceController.text),
        date: invoiceDateController.text,
        durationInDays: int.parse(invoiceDurationController.text) * duration,
        name: invoicecNameController.text,
        notes: invoiceNotesController.text,
        store: invoiceStoreController.text,
        imageURL: url,
        folder: invoiceFolder,
        daysLeft: diff.inDays,
      );

      final productCollection = FirebaseFirestore.instance.collection('invoice');
      final productDoc = productCollection.doc(invoice.invoice_no);
      productDoc.set(invoice.toMap());
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   leading: const Icon(Icons.arrow_back_ios, color: CustomTheme.darkBlue),
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   title: Image.asset('lib/assets/esal_logo.png', height: 50),
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
        child: ListView(
          children: [
            const EsalHeading(text: 'إضافة فاتورة'),
            const SizedBox(height: 20),
            // const EsalSubheading(text: 'تفاصيل الفاتورة'),
            // const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /////////////////////////////////////////////////////////////////////
                InkWell(
                  onTap: () async {
                    await getImage();
                    setState(() {});
                  },
                  child: Container(
                    height: 140,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomTheme.darkBlue),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: _image != null
                        ? Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          )
                        : const Center(
                            child: Text(
                              'اضغط لإضافة الفاتورة',
                              style: TextStyle(color: CustomTheme.darkBlue, fontSize: 15),
                              textAlign: TextAlign.center,
                              // textDirection: TextDirection.rtl,
                            ),
                          ),
                  ),
                ),
                //////////////////////////////////////////////////////////////
                const SizedBox(width: 15),
                Column(
                  children: [
                    SizedBox(
                      width: 230,
                      child: EsalTextField(title: 'اسم الفاتورة', controller: invoicecNameController),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 230,
                      child: EsalTextField(title: 'رقم الفاتورة', controller: invoiceNoController),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            EsalTextField(title: 'قيمة الفاتورة الإجمالية', controller: invoicePriceController),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 300,
                  child: EsalTextField(
                    title: 'تاريخ الفاتورة',
                    controller: invoiceDateController,
                    readOnly: true,
                  ),
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      tempDate = pickedDate;
                      String formattedDate = intl.DateFormat('yyyy-MM-dd').format(pickedDate);
                      setState(() {
                        invoiceDateController.text = formattedDate; //set output date to TextField value.
                      });
                    }
                  },
                  child: const Icon(Icons.calendar_month),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 260,
                  child: EsalTextField(title: 'بالأيام، أو الأشهر، أو السنوات', controller: invoiceDurationController),
                ),
                const SizedBox(width: 20),
                const EsalSubheading(text: 'مدة\n الفاتورة'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      weekSelected = !weekSelected;
                      monthSeleted = false;
                      yearSelected = false;

                      duration = 7;
                    });
                  },
                  child: DurationContainer(text: 'اسبوع', isSelected: weekSelected),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      weekSelected = false;
                      monthSeleted = !monthSeleted;
                      yearSelected = false;

                      duration = 30;
                    });
                  },
                  child: DurationContainer(text: 'شهر', isSelected: monthSeleted),
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        weekSelected = false;
                        monthSeleted = false;
                        yearSelected = !yearSelected;

                        duration = 360;
                      });
                    },
                    child: DurationContainer(text: 'سنة', isSelected: yearSelected)),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const EsalSubheading(text: ' اختر المجلد الذي تريد إضافة الضمان إليه'),
                        content: SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: ListView.builder(
                              itemCount: Folder.folders.length,
                              itemBuilder: (context, index) {
                                var item = Folder.folders[index];
                                return Card(
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: ListTile(
                                      onTap: () async {
                                        setState(() {
                                          invoiceFolder = item.folderName;
                                          folderName = item.folderName;
                                          folderIcon = item.folderIcon;
                                        });
                                        Navigator.pop(context);
                                      },
                                      leading: Icon(item.folderIcon),
                                      title: Text(
                                        item.folderName,
                                        style: GoogleFonts.almarai(textStyle: const TextStyle(fontSize: 15)),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 250,
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                    decoration: const BoxDecoration(
                      color: CustomTheme.skyBlue,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: folderName == null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.arrow_drop_down_sharp),
                              const SizedBox(width: 50),
                              Row(
                                children: const [
                                  Text('أجهزة'),
                                  SizedBox(width: 10),
                                  Icon(Icons.devices),
                                ],
                              ),
                            ],
                          )
                        : Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(Icons.arrow_drop_down_sharp),
                                const SizedBox(width: 50),
                                Row(
                                  children: [
                                    Text(folderName!),
                                    const SizedBox(width: 10),
                                    Icon(folderIcon!),
                                  ],
                                ),
                              ],
                            ),
                          ),
                  ),
                ),

                // child: Container(
                //   width: 250,
                //   padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                //   decoration: const BoxDecoration(
                //     color: CustomTheme.skyBlue,
                //     borderRadius: BorderRadius.all(Radius.circular(30)),
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: const [
                //       Icon(Icons.arrow_drop_down_sharp),
                //       SizedBox(width: 50),
                //       Text('أجهزة كهربائية'),
                //       SizedBox(width: 10),
                //       Icon(Icons.electrical_services_rounded),
                //     ],
                //   ),
                // ),
                // ),
                const SizedBox(width: 20),
                const EsalSubheading(text: 'أضف إلى'),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 100,
              child: EsalTextField(title: 'ملاحظات', controller: invoiceNotesController),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () async {
                print('clicked');
                await saveInvoice();
                print('finish upload');
                setState(() {
                  // Navigator.pop(context);
                });
              },
              child: EsalButton(text: 'حفظ', press: () {}),
            ),
          ],
        ),
      ),
    );
  }
}

class DurationContainer extends StatelessWidget {
  const DurationContainer({
    this.buttonColor,
    required this.text,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  final String text;
  final Color? buttonColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          color: isSelected ? CustomTheme.darkBlue : CustomTheme.lightBlue),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 18),
          // textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
