import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Owners/Dashboard/pickupdashboarduiclass.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'chartdataclass.dart';

class Pickupdashboard extends StatefulWidget {
  const Pickupdashboard({Key? key}) : super(key: key);

  @override
  _PickupdashboardState createState() => _PickupdashboardState();
}

class _PickupdashboardState extends State<Pickupdashboard> {
  Color color = const Color(0xff0d2bd4);
  String? selectedOption;
  int allradionutton = 0;
  final ScrollController _horizontal = ScrollController();
  int todayradio = 0;
  int monthlyradio = 0;

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Map<String, double> dataMap = {
    "Carpet": 18.47,
    "Dry clean": 17.70,
    "Fold": 4.25,
    "Wash": 3.51,
    "Hang": 2.83,
  };

  List<Color> colorList = [
    Color(0xffD95AF3),
    Color(0xff3EE094),
    Color(0xff3398F6),
    Color(0xffFA4A42),
    Color(0xffFE9539)
  ];

  final List<SalesData> data = [
    SalesData('Carpet', 10, 7),
    SalesData('Dry Clean', 5, 3),
    SalesData('Fold', 8, 6),
    SalesData('Wash', 15, 9),
    SalesData('Hang', 12, 4),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        iconTheme: IconThemeData(color: Colors.blue,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("PICKUP DASHBOARD",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500))),
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
        child: Center(
            child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text('Branch'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue)),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(bottom: 10),
                      prefix: SizedBox(
                        width: 10,
                      ),
                      hintText: 'Select',
                    ),
                    items: [DropdownMenuItem(child: Text('select'))],
                    onChanged: (value) {},
                  ),
                ),
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
                    allradionutton = value ?? 0;
                  });
                },
              ),
              SizedBox(width: 30),
              Text("All"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 200,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ArrowCard(
                    title: 'To Pick',
                    value: '',
                    icon: Icons.shopping_basket,
                    color: Colors.teal,
                  ),
                  ReminderCard(
                    title: 'Reminder',
                    value: '',
                    icon: Icons.alarm,
                    color: Colors.deepOrange,
                  ),
                  ArrowCard(
                    title: 'Confirm',
                    value: '',
                    icon: Icons.check_circle,
                    color: Colors.indigo,
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF48a3c2), Color(0xFF1A344F)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: EdgeInsets.all(16.0),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 60,
                            width: 50,
                            child: Icon(Icons.phone,color: Colors.blue),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Via call"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("10/10")
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 60,
                            width: 50,
                            child: Icon(Icons.apps,color: Colors.blue),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Via App"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("10/10")
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 60,
                            width: 50,
                            child: Icon(Icons.people,color: Colors.blue,),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Via Staff"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("10/10")
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Select"),
              SizedBox(width: 30),
              SizedBox(
                height: 60,
                child: DropdownButton<String>(
                  value: selectedOption,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedOption = newValue;
                    });
                  },
                  items: <String>[
                    'All',
                    'Staff 1',
                    'Staff 2',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Icon(Icons.search)
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Express Orders${"      "}:"),
                SizedBox(
                  height: 10,
                ),
                Text("Normal Orders${"       "}:"),
                SizedBox(
                  height: 10,
                ),
                Text("Total Orders${"            "}:"),
                SizedBox(
                  height: 10,
                ),
                Text("Picking Confirmed ${""}:")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [Text("Delayed Ones")],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              surfaceTintColor: Colors.white,
              elevation: 2,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height*0.5,
                              width: MediaQuery.of(context).size.width+130,
                              child: ListView.builder(
                                  itemCount: 1,
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  physics: ClampingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Column(children: [
                                      SizedBox(
                                          height: 40,
                                          width: MediaQuery.of(context).size.width+130,
                                          child: Row(children: [
                                            Expanded(
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Sl N.o",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ))),
                                            Expanded(
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Order No",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ))),
                                            Expanded(
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Staff",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ))),
                                            Expanded(
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Client",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ))),
                                            Expanded(
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Location",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ))),
                                            Expanded(
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Delayed for hrs",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ))),
                                            Expanded(
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Status",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ))),
                                          ])),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height*0.4,
                                        width: MediaQuery.of(context).size.width+130,
                                        child: ListView.separated(
                                            separatorBuilder: (context, index) {
                                              return Divider(
                                                color: Colors.grey,
                                                thickness: .3,
                                                indent: 10,
                                                endIndent: 10,
                                              );
                                            },
                                            padding: EdgeInsets.zero,
                                            physics: ClampingScrollPhysics(),
                                            itemCount: 15,
                                            itemBuilder: (BuildContext context,
                                                int rowIndex) {
                                              return SizedBox(
                                                height: 40,
                                                width: MediaQuery.of(context).size.width+130,
                                                child: ListView.builder(
                                                    itemCount: 1,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return SizedBox(
                                                          height: 40,
                                                          width: MediaQuery.of(context).size.width+130,
                                                          child: Row(children: [
                                                            Expanded(
                                                                child:
                                                                    Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        child:
                                                                            Text(
                                                                          "1",
                                                                          style:
                                                                              TextStyle(color: Colors.black),
                                                                        ))),
                                                            Expanded(
                                                                child:
                                                                    Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        child:
                                                                            Text(
                                                                          "1003",
                                                                          style:
                                                                              TextStyle(color: Colors.black),
                                                                        ))),
                                                            Expanded(
                                                                child:
                                                                    Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        child:
                                                                            Text(
                                                                          "Noor",
                                                                          style:
                                                                              TextStyle(color: Colors.black),
                                                                        ))),
                                                            Expanded(
                                                                child:
                                                                    Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        child:
                                                                            Text(
                                                                          "Sha",
                                                                          style:
                                                                              TextStyle(color: Colors.black),
                                                                        ))),
                                                            Expanded(
                                                                child:
                                                                    Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        child:
                                                                            Text(
                                                                          "Jasu",
                                                                          style:
                                                                              TextStyle(color: Colors.black),
                                                                        ))),
                                                            Expanded(
                                                                child:
                                                                    Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        child:
                                                                            Text(
                                                                          "09:00am",
                                                                          style:
                                                                              TextStyle(color: Colors.black),
                                                                        ))),
                                                            Expanded(
                                                                child:
                                                                    Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        child:
                                                                            Text(
                                                                          "Completed",
                                                                          style:
                                                                              TextStyle(color: Colors.black),
                                                                        ))),
                                                          ]));
                                                    }),
                                              );
                                            }),
                                      )
                                    ]);
                                  })),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30, left: 15, right: 15),
                    child: Scrollbar(
                      trackVisibility: true,
                      controller: _horizontal,
                      child: SizedBox(
                        height: 5,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.lightBlue,
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text("To be picked in next 4hrs")],
            ),
          ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  surfaceTintColor: Colors.white,
                  elevation: 2,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height*0.5,
                                  width: MediaQuery.of(context).size.width+130,
                                  child: ListView.builder(
                                      itemCount: 1,
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.horizontal,
                                      physics: ClampingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Column(children: [
                                          SizedBox(
                                              height: 40,
                                              width: MediaQuery.of(context).size.width+130,
                                              child: Row(children: [
                                                Expanded(
                                                    child: Container(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Sl N.o",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ))),
                                                Expanded(
                                                    child: Container(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Order No",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ))),
                                                Expanded(
                                                    child: Container(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Staff",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ))),
                                                Expanded(
                                                    child: Container(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Client",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ))),
                                                Expanded(
                                                    child: Container(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Location",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ))),
                                                Expanded(
                                                    child: Container(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Pick Time",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ))),
                                                Expanded(
                                                    child: Container(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Status",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ))),
                                              ])),
                                          Container(
                                            height: MediaQuery.of(context).size.height*0.4,
                                            width: MediaQuery.of(context).size.width+130,
                                            child: ListView.separated(
                                                separatorBuilder: (context, index) {
                                                  return Divider(
                                                    color: Colors.grey,
                                                    thickness: .3,
                                                    indent: 10,
                                                    endIndent: 10,
                                                  );
                                                },
                                                padding: EdgeInsets.zero,
                                                physics: ClampingScrollPhysics(),
                                                itemCount: 6,
                                                itemBuilder: (BuildContext context,
                                                    int rowIndex) {
                                                  return SizedBox(
                                                    height: 40,
                                                    width: MediaQuery.of(context).size.width+130,
                                                    child: ListView.builder(
                                                        itemCount: 1,
                                                        scrollDirection:
                                                        Axis.horizontal,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return SizedBox(
                                                              height: 40,
                                                              width: MediaQuery.of(context).size.width+130,
                                                              child: Row(children: [
                                                                Expanded(
                                                                    child:
                                                                    Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .center,
                                                                        child:
                                                                        Text(
                                                                          "1",
                                                                          style:
                                                                          TextStyle(color: Colors.black),
                                                                        ))),
                                                                Expanded(
                                                                    child:
                                                                    Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .center,
                                                                        child:
                                                                        Text(
                                                                          "1003",
                                                                          style:
                                                                          TextStyle(color: Colors.black),
                                                                        ))),
                                                                Expanded(
                                                                    child:
                                                                    Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .center,
                                                                        child:
                                                                        Text(
                                                                          "Noor",
                                                                          style:
                                                                          TextStyle(color: Colors.black),
                                                                        ))),
                                                                Expanded(
                                                                    child:
                                                                    Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .center,
                                                                        child:
                                                                        Text(
                                                                          "Sha",
                                                                          style:
                                                                          TextStyle(color: Colors.black),
                                                                        ))),
                                                                Expanded(
                                                                    child:
                                                                    Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .center,
                                                                        child:
                                                                        Text(
                                                                          "Jasu",
                                                                          style:
                                                                          TextStyle(color: Colors.black),
                                                                        ))),
                                                                Expanded(
                                                                    child:
                                                                    Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .center,
                                                                        child:
                                                                        Text(
                                                                          "09:00am",
                                                                          style:
                                                                          TextStyle(color: Colors.black),
                                                                        ))),
                                                                Expanded(
                                                                    child:
                                                                    Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .center,
                                                                        child:
                                                                        Text(
                                                                          "Completed",
                                                                          style:
                                                                          TextStyle(color: Colors.black),
                                                                        ))),
                                                              ]));
                                                        }),
                                                  );
                                                }),
                                          )
                                        ]);
                                      })),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30, left: 15, right: 15),
                        child: Scrollbar(
                          trackVisibility: true,
                          controller: _horizontal,
                          child: SizedBox(
                            height: 5,
                            width: MediaQuery.of(context).size.width,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlue,
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text("To be picked in next 8hrs")],
            ),
          ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  surfaceTintColor: CupertinoColors.white,
                  elevation: 2,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height*0.5,
                                  width: MediaQuery.of(context).size.width+130,
                                  child: ListView.builder(
                                      itemCount: 1,
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.horizontal,
                                      physics: ClampingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Column(children: [
                                          SizedBox(
                                              height: 40,
                                              width: MediaQuery.of(context).size.width+130,
                                              child: Row(children: [
                                                Expanded(
                                                    child: Container(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Sl N.o",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ))),
                                                Expanded(
                                                    child: Container(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Order No",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ))),
                                                Expanded(
                                                    child: Container(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Staff",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ))),
                                                Expanded(
                                                    child: Container(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Client",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ))),
                                                Expanded(
                                                    child: Container(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Location",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ))),
                                                Expanded(
                                                    child: Container(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Pick Time",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ))),
                                                Expanded(
                                                    child: Container(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Status",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ))),
                                              ])),
                                          Container(
                                            height: MediaQuery.of(context).size.height*0.4,
                                            width: MediaQuery.of(context).size.width+130,
                                            child: ListView.separated(
                                                separatorBuilder: (context, index) {
                                                  return Divider(
                                                    color: Colors.grey,
                                                    thickness: .3,
                                                    indent: 10,
                                                    endIndent: 10,
                                                  );
                                                },
                                                padding: EdgeInsets.zero,
                                                physics: ClampingScrollPhysics(),
                                                itemCount: 6,
                                                itemBuilder: (BuildContext context,
                                                    int rowIndex) {
                                                  return SizedBox(
                                                    height: 40,
                                                    width: MediaQuery.of(context).size.width+130,
                                                    child: ListView.builder(
                                                        itemCount: 1,
                                                        scrollDirection:
                                                        Axis.horizontal,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return SizedBox(
                                                              height: 40,
                                                              width: MediaQuery.of(context).size.width+130,
                                                              child: Row(children: [
                                                                Expanded(
                                                                    child:
                                                                    Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .center,
                                                                        child:
                                                                        Text(
                                                                          "1",
                                                                          style:
                                                                          TextStyle(color: Colors.black),
                                                                        ))),
                                                                Expanded(
                                                                    child:
                                                                    Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .center,
                                                                        child:
                                                                        Text(
                                                                          "1003",
                                                                          style:
                                                                          TextStyle(color: Colors.black),
                                                                        ))),
                                                                Expanded(
                                                                    child:
                                                                    Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .center,
                                                                        child:
                                                                        Text(
                                                                          "Noor",
                                                                          style:
                                                                          TextStyle(color: Colors.black),
                                                                        ))),
                                                                Expanded(
                                                                    child:
                                                                    Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .center,
                                                                        child:
                                                                        Text(
                                                                          "Sha",
                                                                          style:
                                                                          TextStyle(color: Colors.black),
                                                                        ))),
                                                                Expanded(
                                                                    child:
                                                                    Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .center,
                                                                        child:
                                                                        Text(
                                                                          "Jasu",
                                                                          style:
                                                                          TextStyle(color: Colors.black),
                                                                        ))),
                                                                Expanded(
                                                                    child:
                                                                    Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .center,
                                                                        child:
                                                                        Text(
                                                                          "09:00am",
                                                                          style:
                                                                          TextStyle(color: Colors.black),
                                                                        ))),
                                                                Expanded(
                                                                    child:
                                                                    Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .center,
                                                                        child:
                                                                        Text(
                                                                          "Completed",
                                                                          style:
                                                                          TextStyle(color: Colors.black),
                                                                        ))),
                                                              ]));
                                                        }),
                                                  );
                                                }),
                                          )
                                        ]);
                                      })),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30, left: 15, right: 15),
                        child: Scrollbar(
                          trackVisibility: true,
                          controller: _horizontal,
                          child: SizedBox(
                            height: 5,
                            width: MediaQuery.of(context).size.width,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlue,
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text("To be picked in next 24hrs")],
            ),
          ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  surfaceTintColor: CupertinoColors.white,
                  elevation: 2,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height*0.5,
                                  width: MediaQuery.of(context).size.width+130,
                                  child: ListView.builder(
                                      itemCount: 1,
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.horizontal,
                                      physics: ClampingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Column(children: [
                                          SizedBox(
                                              height: 40,
                                              width: MediaQuery.of(context).size.width+130,
                                              child: Row(children: [
                                                Expanded(
                                                    child: Container(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Sl N.o",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ))),
                                                Expanded(
                                                    child: Container(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Order No",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ))),
                                                Expanded(
                                                    child: Container(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Staff",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ))),
                                                Expanded(
                                                    child: Container(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Client",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ))),
                                                Expanded(
                                                    child: Container(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Location",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ))),
                                                Expanded(
                                                    child: Container(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Pick Time",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ))),
                                                Expanded(
                                                    child: Container(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Status",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ))),
                                              ])),
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height*0.4,
                                            width: MediaQuery.of(context).size.width+130,
                                            child: ListView.separated(
                                                separatorBuilder: (context, index) {
                                                  return Divider(
                                                    color: Colors.grey,
                                                    thickness: .3,
                                                    indent: 10,
                                                    endIndent: 10,
                                                  );
                                                },
                                                padding: EdgeInsets.zero,
                                                physics: ClampingScrollPhysics(),
                                                itemCount: 6,
                                                itemBuilder: (BuildContext context,
                                                    int rowIndex) {
                                                  return SizedBox(
                                                    height: 40,
                                                    width: MediaQuery.of(context).size.width+130,
                                                    child: ListView.builder(
                                                        itemCount: 1,
                                                        scrollDirection:
                                                        Axis.horizontal,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return SizedBox(
                                                              height: 40,
                                                              width: MediaQuery.of(context).size.width+130,
                                                              child: Row(children: [
                                                                Expanded(
                                                                    child:
                                                                    Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .center,
                                                                        child:
                                                                        Text(
                                                                          "1",
                                                                          style:
                                                                          TextStyle(color: Colors.black),
                                                                        ))),
                                                                Expanded(
                                                                    child:
                                                                    Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .center,
                                                                        child:
                                                                        Text(
                                                                          "1003",
                                                                          style:
                                                                          TextStyle(color: Colors.black),
                                                                        ))),
                                                                Expanded(
                                                                    child:
                                                                    Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .center,
                                                                        child:
                                                                        Text(
                                                                          "Noor",
                                                                          style:
                                                                          TextStyle(color: Colors.black),
                                                                        ))),
                                                                Expanded(
                                                                    child:
                                                                    Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .center,
                                                                        child:
                                                                        Text(
                                                                          "Sha",
                                                                          style:
                                                                          TextStyle(color: Colors.black),
                                                                        ))),
                                                                Expanded(
                                                                    child:
                                                                    Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .center,
                                                                        child:
                                                                        Text(
                                                                          "Jasu",
                                                                          style:
                                                                          TextStyle(color: Colors.black),
                                                                        ))),
                                                                Expanded(
                                                                    child:
                                                                    Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .center,
                                                                        child:
                                                                        Text(
                                                                          "09:00am",
                                                                          style:
                                                                          TextStyle(color: Colors.black),
                                                                        ))),
                                                                Expanded(
                                                                    child:
                                                                    Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .center,
                                                                        child:
                                                                        Text(
                                                                          "Completed",
                                                                          style:
                                                                          TextStyle(color: Colors.black),
                                                                        ))),
                                                              ]));
                                                        }),
                                                  );
                                                }),
                                          )
                                        ]);
                                      })),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30, left: 15, right: 15),
                        child: Scrollbar(
                          trackVisibility: true,
                          controller: _horizontal,
                          child: SizedBox(
                            height: 5,
                            width: MediaQuery.of(context).size.width,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlue,
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          SizedBox(
            height: 50,
          ),
          Card(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Category Wise Allocation"),
          )),
              SizedBox(
                height: 20,
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Radio<int>(
                activeColor: Colors.lightBlue,
                value: 0,
                groupValue: todayradio,
                onChanged: (value) {
                  setState(() {
                    todayradio = value ?? 0;
                  });
                },
              ),
              Text('Today'),
              Radio<int>(
                hoverColor: Colors.lightBlue,
                activeColor: Colors.lightBlue,
                value: 1,
                groupValue: monthlyradio,
                onChanged: (value) {
                  setState(() {
                    monthlyradio = value ?? 0;
                  });
                },
              ),
              Text('Monthly'),
            ],
          ),
          PieChart(
            dataMap: dataMap,
            colorList: colorList,
            chartRadius: MediaQuery.of(context).size.width / 2,
            ringStrokeWidth: 24,
            animationDuration: Duration(seconds: 3),
            chartValuesOptions: ChartValuesOptions(
                showChartValues: false, showChartValueBackground: false),
            legendOptions: LegendOptions(showLegends: false),
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
                        charts.MaterialPalette.blue.shadeDefault,
                    data: data,
                  ),
                ],
                animate: true,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Order v/s Processing"),
              ),
            ),
          ),
          Text("Last 7 days "),
          SizedBox(
            height: 10,
          ),
          Text("Last One Month "),
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
                        charts.MaterialPalette.blue.shadeDefault,
                    data: data,
                  ),
                  charts.Series<SalesData, String>(
                    id: 'another_sales',
                    domainFn: (SalesData sales, _) => sales.category,
                    measureFn: (SalesData sales, _) => sales.anotherCount,
                    colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
                    data: data,
                  ),
                ],
                animate: true,
              ),
            ),
          ),
        ])),
      ),

    );
  }
}
