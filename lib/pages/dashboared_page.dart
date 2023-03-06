import 'package:final_project/components/esal_heading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../theme.dart';

///// change to => for loop through invoices to get total prices per month => ex. for 5 months
class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
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
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

  final List<ChartData> chartData = [
    ChartData('David', 25),
    ChartData('Steve', 38),
    ChartData('Jack', 34),
    ChartData('Others', 52)
  ];
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                EsalHeading(text: 'إحصائيات'),
              ],
            ),
            const SizedBox(height: 20),
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
              height: 160,
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
                      xValueMapper: (_SalesData sales, _) => sales.year,
                      yValueMapper: (_SalesData sales, _) => sales.sales,
                      name: 'Sales',
                      // Enable data label
                      dataLabelSettings: const DataLabelSettings(isVisible: true, textStyle: TextStyle(fontSize: 10)),
                    )
                  ]),
              // child: const Text('linear chart'), // months and total invoices
            ),
          ],
        ),
      ),
    );
  }
}
