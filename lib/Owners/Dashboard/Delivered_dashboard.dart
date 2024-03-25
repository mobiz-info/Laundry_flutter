import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Delivereddashboard extends StatefulWidget {
  const Delivereddashboard({Key? key}) : super(key: key);

  @override
  _DelivereddashboardState createState() => _DelivereddashboardState();
}

class _DelivereddashboardState extends State<Delivereddashboard> {
  final List<int> numbers = List.generate(100, (index) => index + 1);

  int neworderradio = 0;

  int selectedRow = -1;

  Color color = Color(0xff0d2bd4);
  String? selectedOption;
  int allradionutton = 0;

  bool isButtonVisible = false;
  int selectedRowIndex = -1;

  final ScrollController _horizontal = ScrollController();
  DateTime defaultDate =
      DateTime.now(); // Assigns the current date and time as the default date

  DateTime? fromDate;
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

  final DateFormat dateFormat = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          iconTheme: IconThemeData(color: Colors.blue,size: 30),
          elevation: 0,
          backgroundColor: CupertinoColors.white,
          title: Center(child: Text("DELIVERED DASHBOARD",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500))),
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
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(("Date"),
                          ),
                      SizedBox(width: 20),
                      Container(
                        height: MediaQuery.of(context).size.height * .05,
                        width: MediaQuery.of(context).size.width * .40,
                        child: TextField(
                          readOnly: true,
                          onTap: () => selectFromDate(context),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: fromDate != null
                                ? dateFormat.format(fromDate!)
                                : dateFormat
                                    .format(defaultDate), // Format the fromDate
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.date_range,color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    elevation: 2,
                    surfaceTintColor: Colors.white,
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
                                Container(
                                  width: 20,
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
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Sl No",
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
                                      "Express",
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
                                      "Normal",
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
                            height: MediaQuery.of(context).size.height*0.5,
                            child: ListView.builder(
                              physics: ClampingScrollPhysics(
                                  parent: FixedExtentScrollPhysics()),
                              itemCount: 15,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            width: 20,
                                            alignment: Alignment.center,
                                            child: Icon(
                                              Icons.arrow_right,
                                              color: Colors.blue[800],
                                            )),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text("2"),
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
                                            child: Text("2"),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text("2"),
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
                SizedBox(
                  height: 10,
                ),
                Text("Delivered", style: TextStyle(fontSize: 20)),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        elevation: 2,
                        surfaceTintColor: Colors.white,
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
                                                                "Order No.",
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
                                                                "Staff",
                                                                style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontWeight:
                                                                    FontWeight.bold),
                                                              ))),
                                                      Expanded(
                                                        flex: 2,
                                                          child: Container(
                                                              alignment: Alignment.center,
                                                              child: Text(
                                                                "No. of Items",
                                                                style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontWeight:
                                                                    FontWeight.bold),
                                                              ))),
                                                      Expanded(
                                                          child: Container(
                                                              alignment: Alignment.center,
                                                              child: Text(
                                                                "Inv No.",
                                                                style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontWeight:
                                                                    FontWeight.bold),
                                                              ))),
                                                      Expanded(
                                                          child: Container(
                                                              alignment: Alignment.center,
                                                              child: Text(
                                                                "Inv Amt.",
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
                                                                                "Al Nadha",
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
                                                                        flex: 2,
                                                                          child:
                                                                          Container(
                                                                              alignment:
                                                                              Alignment
                                                                                  .center,
                                                                              child:
                                                                              Text(
                                                                                "5",
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
                                                                                "123",
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
                                                                                "50",
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
                if (selectedRow != -1)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Order No :"),
                                SizedBox(
                                  width: 150,
                                ),
                                Text("Order Status :"),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Client Name :"),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text("Location :"),
                                SizedBox(
                                  width: 150,
                                ),
                                Text("Mob No :"),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Staff Delivered :"),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Delivered Time :"),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Mode : Normal"),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          onPressed: () {},
                          child: Text("Share Invoice",style: TextStyle(color: Colors.white),)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Order Status",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
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
                              Text('Order ID'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
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
                              Text('Mobile No'),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 40,
                              ),
                              Text("Search",
                                  style: TextStyle(fontSize: 15)),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                height: 40,
                                width: 150,
                                child: TextField(
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.search),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(
                                              10))),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Text("Search Results",
                    style: TextStyle(fontSize: 15)),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text("Client Name :"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Location:"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Staff Picked :"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Estimated Delivery :"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Date & Time:"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Order No :"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Delivered Time :"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Status : Ready for dispatch"),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                        Colors.blue[800]),
                                    onPressed: () {},
                                    child: Text("Share Invoice",style: TextStyle(color: Colors.white))),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Client Name :ABCD"),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[800]),
                        onPressed: () {},
                        child: Text("Share Status",style: TextStyle(color: Colors.white)))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    elevation: 2,
                    surfaceTintColor: Colors.white,
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
                                Container(
                                  width: 40,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Sl No.",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Order No",
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
                                      "Date of Pick",
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
                                      "No of items",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 60,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Status",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
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
                            height: MediaQuery.of(context).size.height*0.5,
                            child: ListView.builder(
                              physics: ClampingScrollPhysics(
                                  parent: FixedExtentScrollPhysics()),
                              itemCount: 15,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 40,
                                          alignment: Alignment.center,
                                          child: Text("1"),
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment:
                                            Alignment.center,
                                            child: Text("2"),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment:
                                            Alignment.center,
                                            child: Text("2-3-2023"),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment:
                                            Alignment.center,
                                            child: Text("5"),
                                          ),
                                        ),
                                        Container(
                                          width: 60,
                                          alignment:
                                          Alignment.center,
                                          child: Text("Delivered"),
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
                new DotsIndicator(
                  dotsCount: 6,
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 100,
                )
              ]),
        ));
  }
}
