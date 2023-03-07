import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/invoice.dart';
import '../theme.dart';

///// change to => for loop through invoices to get total prices per month => ex. for 5 months
class _SalesData {
  _SalesData(this.month, this.total);

  final String month;
  final int total;
}

//
class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}

class DashboaredPage extends StatefulWidget {
  const DashboaredPage({super.key});

  @override
  State<DashboaredPage> createState() => _DashboaredPageState();
}

class _DashboaredPageState extends State<DashboaredPage> {
  List<Invoice> invoices = [];

  final List<String> months = ['May', 'Jun', 'Jul', 'Aug', 'Sep'];

  final List<int> invPerMonth = [];

  List<_SalesData> data = [
    // _SalesData('May', 35),
    // _SalesData('Jun', 28),
    // _SalesData('Jul', 34),
    // _SalesData('Aug', 32),
    // _SalesData('Sep', 40),
  ];

  ///
  Future<List<Invoice>> getInvoices() async {
    final collection = await FirebaseFirestore.instance.collection('invoice').get();
    List<Invoice> newList = [];

    for (final doc in collection.docs) {
      final invoice = Invoice.fromMap(doc.data());
      newList.add(invoice);
    }
    return newList;
  }

  @override
  void initState() {
    super.initState();

    getInvoices().then((value) {
      invoices = value;
      setState(() {});
    });
    getData();
  }

  getData() async {
    await getInvoiceByMonth();
    print('method1');
    await getChartDate();
    print('updated');
  }

  getInvoiceByMonth() {
    print('start');
    for (int i = 0; i < months.length; i++) {
      var int = 0;
      for (final inv in invoices) {
        if (DateFormat('MMM').format(DateTime.parse(inv.date)) == months[0]) {
          print(DateFormat('MMM').format(DateTime.parse(inv.date)) == months[0]);
          int++;
        }
        print(int);
        invPerMonth.add(int);
      }
      print('dl;k');
    }
  }

  getChartDate() async {
    print('start2');

    if (invPerMonth.isNotEmpty) {
      print('not empty');
      for (int i = 0; i < months.length; i++) {
        List<_SalesData> data = [
          _SalesData(months[i], invPerMonth[i]),
        ];
      }
    }
  }

  ///

  final List<ChartData> chartData = [
    ChartData('David', 25),
    ChartData('Steve', 38),
    ChartData('Jack', 34),
    ChartData('Others', 52)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: const Icon(Icons.arrow_back_ios, color: CustomTheme.darkBlue),
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   // title: Padding(
      //   //   padding: const EdgeInsets.all(8.0),
      //   //   child: Image.asset('lib/assets/esal_logo.png', height: 40),
      //   // ),
      //   actions: const [
      //     Icon(
      //       Icons.search,
      //       color: CustomTheme.darkBlue,
      //     ),
      //     SizedBox(width: 10)
      //   ],
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
        child: ListView(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Image.asset('lib/assets/esal_logo.png', height: 40),
            //     const EsalHeading(text: 'إيصال'),
            //   ],
            // ),
            const SizedBox(height: 20),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: const [
            //     // EsalHeading(text: 'إحصائيات'),
            //   ],
            // ),
            // const SizedBox(height: 20),
            // Container of total number of invoices per person ------------.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 165,
                  height: 80,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: CustomTheme.skyBlue,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1,
                          color: CustomTheme.lightBlue,
                          blurStyle: BlurStyle.inner,
                        ),
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        ' فواتيرك المحفوظة',
                        style: GoogleFonts.almarai(
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Text(
                        '17  فاتورة',
                        style: GoogleFonts.almarai(
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 165,
                  height: 80,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: CustomTheme.skyBlue,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1,
                          color: CustomTheme.lightBlue,
                          blurStyle: BlurStyle.inner,
                        ),
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'تاريخ اليوم',
                        style: GoogleFonts.almarai(
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Text(
                        DateFormat('yMMMMd').format(DateTime.now()),
                        style: GoogleFonts.almarai(
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ), // good?
                ),
                const SizedBox(height: 15),
              ],
            ),
            const SizedBox(height: 15),
            Container(
              width: 400,
              height: 180,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: CustomTheme.skyBlue,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      color: CustomTheme.lightBlue,
                      blurStyle: BlurStyle.inner,
                    ),
                  ]),
              child: SfCircularChart(
                legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
                series: <CircularSeries>[
                  // Render pie chart
                  PieSeries<ChartData, String>(
                    dataSource: chartData,
                    dataLabelSettings: const DataLabelSettings(isVisible: true, textStyle: TextStyle(fontSize: 10)),
                    pointColorMapper: (ChartData data, _) => data.color,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    explode: true,
                    explodeIndex: 1,
                    // explodeAll: true,
                  ),
                ],
              ),
              // child: const Text('other?'), // we can add the invoice that is about to end
            ),
            const SizedBox(height: 20),
            Container(
              // width: 350,
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: CustomTheme.skyBlue,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      color: CustomTheme.lightBlue,
                      blurStyle: BlurStyle.inner,
                    ),
                  ]),
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // Chart title
                title: ChartTitle(text: 'عدد الضمانات خلال الأشهر', textStyle: const TextStyle(fontSize: 12)),
                // Enable legend
                // legend: Legend(isVisible: true),
                // Enable tooltip
                // tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_SalesData, String>>[
                  LineSeries<_SalesData, String>(
                    dataSource: data,
                    xValueMapper: (_SalesData sales, _) => sales.month,
                    yValueMapper: (_SalesData sales, _) => sales.total,
                    // name: 'Sales',
                    // Enable data label
                    dataLabelSettings: const DataLabelSettings(isVisible: true, textStyle: TextStyle(fontSize: 10)),
                  )
                ],
              ),
              // child: const Text('linear chart'), // months and total invoices
            ),
          ],
        ),
      ),
    );
  }
}
