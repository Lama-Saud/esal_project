import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/components/esal_heading.dart';
import 'package:final_project/components/esal_subheading.dart';
import 'package:final_project/models/invoice.dart';
import 'package:final_project/pages/invoices_home_page.dart';
import 'package:final_project/theme.dart';
import 'package:flutter/material.dart';

import '../models/folder.dart';

class FoldersPage extends StatefulWidget {
  const FoldersPage({super.key});

  @override
  State<FoldersPage> createState() => _FoldersPageState();
}

class _FoldersPageState extends State<FoldersPage> {
  List<Invoice> invoicesList = [];
  List<Folder> foldersList = [];

  List<Invoice> invoicesByFolder = [];

  // List<Meal> mealsToShow = [];
  StreamSubscription? listener;

  @override
  void initState() {
    super.initState();
    getDate();
    setState(() {});

    // getInvoiceByFolder('أجهزة');
    setState(() {});
  }

  getDate() async {
    await listenToInvoice();
    await listenToFolder();
  }

  listenToInvoice() {
    FirebaseFirestore.instance.collection('invoice').snapshots().listen((collection) {
      List<Invoice> newList = [];
      for (final doc in collection.docs) {
        final invoice = Invoice.fromMap(doc.data());
        newList.add(invoice);
      }
      invoicesList = newList;
      setState(() {});
    });
  }

  listenToFolder() {
    FirebaseFirestore.instance.collection('folder').snapshots().listen((collection) {
      List<Folder> newList = [];
      for (final doc in collection.docs) {
        final folder = Folder.fromMap(doc.data());
        newList.add(folder);
      }
      foldersList = newList;
      setState(() {});
    });
  }

  // getInvoiceByFolder(String folder) {
  //   List<Invoice> newList = [];
  //   final invoiceCollection = FirebaseFirestore.instance.collection('invoice');
  //   final onlyFolderInvoice = invoiceCollection.where('folder', isEqualTo: folder);

  //   listener ??= onlyFolderInvoice.snapshots().listen((collection) {
  //     final docs = collection.docs;
  //     print(docs.length);
  //     for (final doc in docs) {
  //       final invFromDoc = Invoice.fromMap(doc.data());
  //       newList.add(invFromDoc);
  //     }
  //     invoicesByFolder = newList;
  //     // print(invoicesByFolder.first.folder);

  //     setState(() {});
  //   });

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.white,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const EsalHeading(text: 'الملفات '),
            // const SizedBox(height: 60),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: CustomTheme.white,
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      //  border: Border.all(width: 5, color: CustomTheme.lightBlue.withOpacity(0.4)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.add, size: 40, color: Colors.red),
                        SizedBox(
                          height: 12,
                        ),
                        EsalSubheading(text: 'إضافة ملف  ')
                      ],
                    ),
                  ),
                  for (final folder in foldersList)
                    InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => InvoicesHomePage(folder: folder)),
                      ),
                      child: FolderCard(folder: folder),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FolderCard extends StatelessWidget {
  const FolderCard({
    required this.folder,
    Key? key,
  }) : super(key: key);

  final Folder folder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        color: CustomTheme.skyBlue,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        //  border: Border.all(width: 5, color: CustomTheme.lightBlue.withOpacity(0.4)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            IconData(folder.folderIcon, fontFamily: 'MaterialIcons'),
          ),
          const SizedBox(height: 12),
          EsalSubheading(
            text: folder.folderName,
          )
        ],
      ),
    );
  }
}
