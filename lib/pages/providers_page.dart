import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/store.dart';
import '../theme.dart';

class ProvidersPage extends StatefulWidget {
  const ProvidersPage({super.key});

  @override
  State<ProvidersPage> createState() => _ProvidersPageState();
}

class _ProvidersPageState extends State<ProvidersPage> {
  List<Store> providersList = [];

  @override
  void initState() {
    super.initState();

    listenToProvider();
    setState(() {});
  }

  listenToProvider() {
    FirebaseFirestore.instance.collection('provider').snapshots().listen((collection) {
      List<Store> newList = [];
      for (final doc in collection.docs) {
        final invoice = Store.fromMap(doc.data());
        newList.add(invoice);
      }
      providersList = newList;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: const Icon(Icons.arrow_back_ios, color: CustomTheme.darkBlue),
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   title: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Image.asset('lib/assets/esal_logo.png', height: 50),
      //   ),
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
        child: ListView(
          children: [
            const EsalHeading(text: 'مزودي الخدمة'),
            const SizedBox(height: 20),

            for (final store in providersList) ProviderContainer(store: store),
          ],
        ),
      ),
    );
  }
}

class ProviderContainer extends StatelessWidget {
  const ProviderContainer({
    required this.store,
    Key? key,
  }) : super(key: key);

  final Store store;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            store.imageUrl,
            width: 100,
          ),
          Container(
            padding: const EdgeInsets.only(top: 16.0, right: 16),
            child: Row(
              children: const [
                Icon(Icons.phone_enabled_rounded),
                SizedBox(width: 10),
                Text('92000153'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: const [
                Icon(Icons.explore_sharp),
                SizedBox(width: 10),
                Text('https://www.jarir.com/sa-en'),
              ],
            ),
          ),
        ],
      ),
      // child: const Text('other?'), // we can add the invoice that is about to end
    );
  }
}
