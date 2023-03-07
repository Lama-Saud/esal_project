import 'package:final_project/components/esal_button.dart';
import 'package:final_project/components/esal_heading.dart';

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/pages/invoice_detail_page.dart';
import 'package:flutter/material.dart';

import '../models/folder.dart';
import '../models/invoice.dart';
import '../theme.dart';

class InvoicesHomePage extends StatefulWidget {
  const InvoicesHomePage({super.key, required this.folder});

  final Folder folder;

  @override
  State<InvoicesHomePage> createState() => _InvoicesHomePageState();
}

class _InvoicesHomePageState extends State<InvoicesHomePage> {
  // List<Invoice> invoicesList = [];

  List<Invoice> invoicesByFolder = [];
  StreamSubscription? listener;

  @override
  void initState() {
    super.initState();

    final invoiceCollection = FirebaseFirestore.instance.collection('invoice');
    final onlyFolderInvoice = invoiceCollection.where('folder', isEqualTo: widget.folder.folderName);

    listener ??= onlyFolderInvoice.snapshots().listen((collection) {
      final docs = collection.docs;
      List<Invoice> newList = [];
      print(docs.length);
      for (final doc in docs) {
        final invFromDoc = Invoice.fromMap(doc.data());
        newList.add(invFromDoc);
      }
      invoicesByFolder = newList;
      // print(invoicesByFolder.first.folder);

      setState(() {});
    });
  }

  getInvoiceByFolder(String folder) {
    List<Invoice> newList = [];
  }

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

          for (final inv in invoicesByFolder)
            InkWell(
              onTap: () =>
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => InvoiceDetailPage(invoice: inv))),
              child: InvoicesContainer(invoice: inv),
            ),
        ],
      ),
    );
  }
}

class InvoicesContainer extends StatelessWidget {
  const InvoicesContainer({
    Key? key,
    required this.invoice,
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

  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      height: 300,
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
            invoice.imageURL,
            width: 100,
          ),
          Container(
            padding: const EdgeInsets.only(top: 16.0, right: 16),
            child: Row(
              children: [
                Text(invoice.name),
                const SizedBox(width: 10),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(

              children: [
                const Icon(Icons.calendar_month),
                const SizedBox(width: 8),
                Text(invoice.date),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                const Icon(Icons.attach_money),
                const SizedBox(width: 8),
                Text(invoice.price.toString()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                const Icon(Icons.info_outline),
                const SizedBox(width: 8),
                Text(invoice.daysLeft.toString()),

              ],
            ),
          ),
        ],
      ),
      // child: const Text('other?'), // we can add the invoice that is about to end
    );
  }
}
