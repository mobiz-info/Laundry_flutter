import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../model/SalesData.dart';
import '../src/colors.dart';
import '../src/dimen.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';

class OrderStatistics extends StatefulWidget {
  const OrderStatistics({Key? key}) : super(key: key);

  @override
  OrderStatisticsState createState() => OrderStatisticsState();
}

class OrderStatisticsState extends State<OrderStatistics> {
  final List<SalesData> data = [
    SalesData('Staff1', 10, 7),
    SalesData('Staff2', 5, 3),
    SalesData('Staff3', 8, 6),
    SalesData('Staff4', 15, 9),
  ];

  int amountradio = 0;

  Map<String, double> dataMap = {
    "Staff 1": 25,
    "Staff 2": 25,
    "Staff 3": 25,
    "Staff 4": 25,
  };

  List<Color> colorList = [
    Color(0xffD95AF3),
    Color(0xff3EE094),
    Color(0xff3398F6),
    Color(0xffFA4A42),
    Color(0xffFE9539)
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color color = Color(0xff0d2bd4);
  String? selectedOption;
  int allradionutton = 0;

  bool isButtonVisible = false;
  int selectedRowIndex = -1;

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
        child: Appbar(text: 'Order Statistics',),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Dry clean :15"),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Wash & Fold :25"),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Carpet cleaning :15"),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          PieChart(
                            dataMap: dataMap,
                            colorList: colorList,
                            chartRadius: MediaQuery.of(context).size.width / 2,
                            ringStrokeWidth: 24,
                            animationDuration: Duration(seconds: 3),
                            chartValuesOptions: ChartValuesOptions(
                                showChartValues: true,
                                showChartValueBackground: false),
                            legendOptions: LegendOptions(showLegends: false),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Amount",
                style: TextStyle(fontSize: 20, color: pickerPrimaryColor),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Radio<int>(
                          activeColor: pickerPrimaryColor,
                          value: 0,
                          groupValue: amountradio,
                          onChanged: (value) {
                            setState(() {
                              amountradio = value!;
                            });
                          },
                        ),
                        Text('Order ID'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<int>(
                          hoverColor: pickerPrimaryColor,
                          activeColor: pickerPrimaryColor,
                          value: 1,
                          groupValue: amountradio,
                          onChanged: (value) {
                            setState(() {
                              amountradio = value!;
                            });
                          },
                        ),
                        Text('Mobile No'),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 300,
                  padding: EdgeInsets.all(16),
                  child: charts.BarChart(
                    [
                      charts.Series<SalesData, String>(
                        id: 'sales',
                        domainFn: (SalesData sales, _) => sales.category,
                        measureFn: (SalesData sales, _) => sales.count,
                        colorFn: (_, __) =>
                            charts.MaterialPalette.indigo.shadeDefault,
                        data: data,
                      ),
                    ],
                    animate: true,
                  ),
                ),
              ),
            ]),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/Images/bg.png'), fit: BoxFit.fill),
        ),
        child: BottomDrawer(),
      ),
    );
  }
}
