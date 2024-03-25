import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Staffdashboard extends StatefulWidget {
  const Staffdashboard({Key? key}) : super(key: key);

  @override
  _StaffdashboardState createState() => _StaffdashboardState();
}

class _StaffdashboardState extends State<Staffdashboard> {
  TextEditingController Date = TextEditingController(text: DateFormat('dd-MM-yyyy').format(DateTime.now()));
  final List<String> orderStages = [
    'Express',
    'Normal',
    'Confirmed',
    'Picked',
    'In process',
    'Finished',
    'Ready for dispatch',
    'Invoice generated',
    'Invoice value',
    'Dispatched',
    'Delivered',
    'Amount collected',
    'Deposited',
  ];

  final List<String> orderStagessecond = [
    'Via App',
    'Via self',
    'Via Call',
    'Total',
  ];

  Map<String, double> dataMap = {
    "Wash & Clean": 32.47,
    "Dry clean": 30.70,
    " Wash &Fold": 32.25,
  };

  List<Color> colorList = [
    Color(0xffD95AF3),
    Color(0xffFA4A42),
    Color(0xffFE9539)
  ];

  int neworderradio = 0;

  Color color = Color(0xff0d2bd4);
  String? selectedOption;
  int allradionutton = 0;

  bool isButtonVisible = false;
  int selectedRowIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        iconTheme: IconThemeData(color: Colors.blue,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("STAFF DASHBOARD",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.refresh_outlined,
              color: Colors.blue,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Branch"),
                  SizedBox(width: 30),
                  DropdownButton<String>(
                    hint: Text(
                      "Select",
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    value: selectedOption,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOption = newValue;
                      });
                    },
                    items: <String>[
                      'Option 1',
                      'Option 2',
                      'Option 3',
                      'Option 4'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<int>(
                    activeColor: Colors.lightBlue,
                    value: 0,
                    groupValue: allradionutton,
                    onChanged: (value) {
                      setState(() {
                        allradionutton = value!;
                      });
                    },
                  ),
                  SizedBox(width: 30),
                  Text("All"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        child: Row(
                          children: [
                            Icon(Icons.arrow_right_outlined,size: 35,color: Colors.blue,),
                            SizedBox(
                              width: 100,
                              height: 40,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: Date,
                                style: TextStyle(fontSize: 14),
                                onTap: () async {
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  var pickedDate = await showDatePicker(
                                      builder: (context, child) {
                                        return Theme(
                                            data: ThemeData().copyWith(
                                              colorScheme: ColorScheme.light(
                                                primary: Colors.blue,
                                                onPrimary: Colors.white,
                                                surface: Colors.blue,
                                                onSurface: Colors.black,
                                              ),
                                              dialogBackgroundColor:Colors.blueGrey.shade50,
                                            ), child: child!);

                                      },
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000,01,01),
                                      lastDate: DateTime(2050,12,31));
                                  Date.text = DateFormat('dd-MM-yyyy').format(pickedDate!);
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  contentPadding: EdgeInsets.only(),
                                ),
                              ),
                            ),
                            Icon(Icons.arrow_left_outlined,size: 35,color: Colors.blue,),
                          ],
                        )
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2,
                  surfaceTintColor: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                  itemCount: 1,
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  physics: const ClampingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height * 0.06,
                                          width: MediaQuery.of(context).size.width*2,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Staff Name",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Colection",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Closing Balance",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Orders",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Picked",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Delivered",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height * 0.44,
                                          width:
                                              MediaQuery.of(context).size.width*2,
                                          child: ListView.builder(
                                            padding: EdgeInsets.zero,
                                            physics:
                                                const ClampingScrollPhysics(),
                                            itemCount: 9,
                                            itemBuilder: (BuildContext context,
                                                int rowIndex) {
                                              final isEvenRow =
                                                  rowIndex % 2 == 0;
                                              final backgroundColor = isEvenRow
                                                  ? Colors.yellow
                                                  : Colors.white;

                                              return SizedBox(
                                                height: 40,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width*2,
                                                child: ListView.builder(
                                                  itemCount: 1,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                      height: 40,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width*2,
                                                      color: backgroundColor,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "Deepesh",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "100",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "900",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "10",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "30",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "15",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("*Background Yellow for on field staff"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Order v/s Staff",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<int>(
                    activeColor: Colors.lightBlue,
                    value: 0,
                    groupValue: neworderradio,
                    onChanged: (value) {
                      setState(() {
                        neworderradio = value!;
                      });
                    },
                  ),
                  Text('Today'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left:35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio<int>(
                      hoverColor: Colors.lightBlue,
                      activeColor: Colors.lightBlue,
                      value: 1,
                      groupValue: neworderradio,
                      onChanged: (value) {
                        setState(() {
                          neworderradio = value!;
                        });
                      },
                    ),
                    Text('Last 7 Days'),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right:20),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 250,
                      width: 250,
                      child: PieChart(
                          PieChartData(
                              centerSpaceRadius: 1,
                              borderData: FlBorderData(show: false),
                              sections: [
                                PieChartSectionData(value: 30, color: Colors.green, radius: 100,title: 'Staff 1 20'),
                                PieChartSectionData(value: 70, color: Colors.orange[900], radius: 100,title: 'Staff 2 40')
                                ,PieChartSectionData(value: 70, color: Colors.blue[900], radius: 100,title: 'Staff 3 20')
                                ,PieChartSectionData(value: 70, color: Colors.yellow, radius: 100,title: 'Staff 4 20')
                              ])),
                    ),
                  ],
                ),
              )
              ,
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width ,
                  height: 300, // Adjust the height as needed
                  child:LineChart(
                    LineChartData(
                        gridData: FlGridData(show: false),
                        titlesData: FlTitlesData(
                            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false))
                        ),
                        borderData: FlBorderData(
                            show: true, border: Border(left: BorderSide(color: Colors.black),
                            bottom: BorderSide(color: Colors.black))), lineBarsData: [
                      LineChartBarData(
                          isCurved: false,
                          spots: [
                            FlSpot(0, 10),
                            const FlSpot(1, 8),
                            const FlSpot(2, 10),
                            const FlSpot(3, 7),
                            const FlSpot(4, 12),
                            const FlSpot(5, 13),
                            const FlSpot(6, 17),
                            const FlSpot(7, 15),
                          ],
                          dotData: FlDotData(show: false))
                    ]),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
