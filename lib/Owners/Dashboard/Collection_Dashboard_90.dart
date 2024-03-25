import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:intl/intl.dart';

class CollectionDashboard extends StatefulWidget {
  const CollectionDashboard({Key? key}) : super(key: key);

  @override
  _CollectionDashboardState createState() => _CollectionDashboardState();
}

class _CollectionDashboardState extends State<CollectionDashboard> {
  final List<String> items = [
    'Opening Balance',
    'Today\'s Collection',
    'Today\'s Deposit',
    'Closing Balance'
  ];
  final List<String> staffnamebalance = [
    '100',
    '200',
    '300',
    '300'
  ];
  final List<String> ordertype = [
    'Online',
    'COD'
  ];
  final List<String> _items = ["Online", "COD"];
  final Date =  DateFormat('dd-MM-yyyy').format(DateTime.now());
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

  DateTime? fromDate;

  final DateFormat dateFormat = DateFormat('dd-MM-yyyy');

  Future<void> selectFromDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: fromDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        fromDate = selectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        iconTheme: IconThemeData(color: Colors.blue,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("COLLECTION DASHBOARD",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500))),
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
              SizedBox(
                height: 20,
              ),
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.45,
                          height: 200,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff2cbaf2),
                                    Color(0xff1c64d9),
                                    Color(0xff0d2bd4),
                                  ])),
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.90,
                              height: 150,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Total",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blue[900],
                                    ),
                                  ),
                                  Text(
                                    "Collection",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blue[900],
                                    ),
                                  ),
                                  Text(
                                    "1000",
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.lightBlueAccent,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SizedBox(
                              width: 100,
                              height: 30,
                              child: Card(
                                  color: Colors.teal,
                                  child: Center(
                                      child: Text(
                                    "Staff 1 -250",
                                    style: TextStyle(color: CupertinoColors.white),
                                  )))),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                              width: 100,
                              height: 30,
                              child: Card(
                                  color: Colors.teal,
                                  child: Center(
                                      child: Text("Staff 2 -250",
                                          style: TextStyle(
                                              color: CupertinoColors.white))))),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                              width: 100,
                              height: 30,
                              child: Card(
                                  color: Colors.teal,
                                  child: Center(
                                      child: Text("Staff 3 -250",
                                          style: TextStyle(
                                              color: CupertinoColors.white))))),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                              width: 100,
                              height: 30,
                              child: Card(
                                  color: Colors.teal,
                                  child: Center(
                                      child: Text("Staff 4 -250",
                                          style: TextStyle(
                                              color: CupertinoColors.white)))))
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Date",
                      ),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:30),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .04,
                      width: MediaQuery.of(context).size.width * .40,
                      child: TextField(
                        readOnly: true,
                        onTap: () => selectFromDate(context),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: fromDate != null
                              ? dateFormat.format(fromDate!)
                              : Date, // Format the fromDate
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.date_range,color: Colors.blue,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  surfaceTintColor: CupertinoColors.white,
                  elevation: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 40,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Staff Name",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Collection",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Outstanding",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: .3,
                          indent: 10,
                          endIndent: 10,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.45,
                          child: ListView.builder(
                            physics: ClampingScrollPhysics(
                                parent: FixedExtentScrollPhysics()),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Icon(
                                              Icons.arrow_right,
                                              color: Colors.blue,
                                            )),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 40,
                                          alignment: Alignment.center,
                                          child: Text("Noor"),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text("200"),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text("100"),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                    thickness: .3,
                                    indent: 10,
                                    endIndent: 10,
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Total"),
                  SizedBox(width: 50),
                  Text("Total"),
                  SizedBox(
                    width: 30,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            height: 260,
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: ListView.builder(
                                itemCount: 1,
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Column(children: [
                                    SizedBox(
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width / 2.5,
                                        child: Row(children: [
                                          Expanded(
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Staff Name",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))),
                                          Expanded(
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Noor",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))),
                                        ])),
                                    Container(
                                      height: 220,
                                      width:
                                          MediaQuery.of(context).size.width / 2.5,
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
                                          physics: const ClampingScrollPhysics(),
                                          itemCount: 4,
                                          itemBuilder:
                                              (BuildContext context, int rowIndex) {
                                            return SizedBox(
                                              height: 40,
                                              width:
                                                  MediaQuery.of(context).size.width,
                                              child: ListView.builder(
                                                  itemCount: 1,
                                                  scrollDirection: Axis.horizontal,
                                                  itemBuilder: (context, index) {
                                                    return Container(
                                                        height: 40,
                                                        width:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .width /
                                                                2.5,
                                                        child: Row(children: [
                                                          Expanded(
                                                              child: Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Text(items[rowIndex],
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  ))),
                                                          Expanded(
                                                              child: Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Text(
                                                                    staffnamebalance[rowIndex],
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  ))),
                                                        ]));
                                                  }),
                                            );
                                          }),
                                    )
                                  ]);
                                })),
                      ),
                    ),SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width*0.4,
                          child: PieChart(
                            dataMap: dataMap,
                            colorList: colorList,
                            chartRadius: MediaQuery.of(context).size.width / 2,
                            ringStrokeWidth: 24,
                            animationDuration: Duration(seconds: 3),
                            chartValuesOptions: ChartValuesOptions(
                                showChartValues: true,
                                showChartValueBackground: false),
                            legendOptions: LegendOptions(showLegends: false),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Filter By Staff"),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: SizedBox(
                      height: 40,
                     width: MediaQuery.of(context).size.width*0.50,
                      child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                              hintText: "Select",
                              border: OutlineInputBorder())),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.45,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Card(
                              color: Colors.grey[200],
                              child: Padding(
                                padding: const EdgeInsets.all( 10,),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      decoration:
                                          BoxDecoration(border: Border.all()),
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      height: MediaQuery.of(context).size.height *
                                          0.05,
                                      child: Center(child: Text("10:05pm")),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Staff Name :"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Client Name :"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Cl ID :"),
                                        SizedBox(
                                          width: 70,
                                        ),

                                      ],
                                    ),SizedBox(
                                      height: 10,
                                    ),
                                   Row(
                                     children: [
                                       Text("Location:"),
                                       SizedBox(
                                         width: 100,
                                       ),
                                       Text("GPS"),
                                       Padding(
                                         padding: const EdgeInsets.only(
                                             left: 10, right: 10),
                                         child: ElevatedButton(
                                             style: ElevatedButton.styleFrom(
                                                 backgroundColor: Colors.blue),
                                             onPressed: () {},
                                             child: Text("Not Updated")),
                                       ),
                                     ],
                                   ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text("Total Outstanding :"),
                                        SizedBox(
                                          width: 90,
                                        ),
                                        Text("Upload Invoice:"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(" Amt Collected :"),
                                        SizedBox(
                                          width: 110,
                                        ),
                                        Text("Balance:"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue),
                                            onPressed: () {},
                                            child: Text("Edit Client")),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue),
                                            onPressed: () {},
                                            child: Text("See History")),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(height: 30),
              Text(
                "Bags",
                style: TextStyle(fontSize: 20, color: Colors.blue[800]),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  surfaceTintColor: CupertinoColors.white,
                  elevation: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Order Type",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Qty",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Amount",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ), Divider(
                          color: Colors.grey,
                          thickness: .3,
                          indent: 10,
                          endIndent: 10,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.5,
                          child: ListView.builder(
                            physics: ClampingScrollPhysics(parent: FixedExtentScrollPhysics()),
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(ordertype[index]),
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text("2"),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text("100"),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                    thickness: .3,
                                    indent: 10,
                                    endIndent: 10,
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
              ),
            ]),
      ),
    );
  }
}
