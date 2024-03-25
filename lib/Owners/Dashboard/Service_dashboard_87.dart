import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Servicedashboard extends StatefulWidget {
  const Servicedashboard({Key? key}) : super(key: key);

  @override
  _ServicedashboardState createState() => _ServicedashboardState();
}

class _ServicedashboardState extends State<Servicedashboard> {
  Color color = Color(0xff0d2bd4);
  String? selectedOption;
  int allradionutton=0;

   final Date =  DateFormat('dd-MM-yyyy').format(DateTime.now());
  final DateFormat dateFormat = DateFormat('dd-MM-yyyy');
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

  bool isButtonVisible = false;
  int selectedRowIndex = -1;


  final ScrollController _horizontal = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          iconTheme: IconThemeData(color: Colors.blue,size: 30),
          elevation: 0,
          backgroundColor: CupertinoColors.white,
          title: Center(child: Text("SERVICE DASHBOARD",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500))),
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
        body:
        SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Branch"),
                SizedBox(width: 30),
                DropdownButton<String>(
                  hint: Text("Select",style: TextStyle(fontSize: 10,color: Colors.grey),),
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
            Row(mainAxisAlignment: MainAxisAlignment.center,
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
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(right:30),
                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Date",),
                     SizedBox(width: 20,),
                      Container(
                        height: MediaQuery.of(context).size.height * .04,
                        width: MediaQuery.of(context).size.width * .40,
                        child: TextField(
                          readOnly: true,
                          onTap: () => selectFromDate(context),
                          decoration: InputDecoration(contentPadding: EdgeInsets.only(left: 10),
                            hintText: fromDate != null ? dateFormat.format(fromDate!) : Date , // Format the fromDate
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.date_range,color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5,)
                ,  Padding(
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    surfaceTintColor: Colors.white,
                    elevation: 2,
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.5,
                      width: MediaQuery.of(context).size.width,
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
                                      "Category",
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
                                      "Completed",
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
                                      "Pending",
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
                            height: MediaQuery.of(context).size.height*0.4,
                            child: ListView.builder(
                              physics: ClampingScrollPhysics(parent: FixedExtentScrollPhysics()),
                              itemCount: 15,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text("Dry Cleaning"),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text("20"),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text("50"),
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

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    surfaceTintColor: Colors.white,
                    elevation: 2,
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
                                  height: MediaQuery.of(context).size.height*0.40,
                                  width: MediaQuery.of(context).size.width*2,
                                  child: ListView.builder(
                                    itemCount: 1,
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    physics: const ClampingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height*0.06,
                                            width: MediaQuery.of(context).size.width*2,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Order No",
                                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "New",
                                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Processed",
                                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Pending",
                                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Invoiced",
                                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ),Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Dispatched",
                                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Delivered",
                                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: MediaQuery.of(context).size.height*0.30,
                                            width: MediaQuery.of(context).size.width*2,
                                            child: ListView.separated(
                                              separatorBuilder: (context, index) {
                                                return  Divider(
                                                  color: Colors.grey,
                                                  thickness: .3,
                                                  indent: 10,
                                                  endIndent: 10,
                                                );
                                              },
                                              padding: EdgeInsets.zero,
                                              physics: const ClampingScrollPhysics(),
                                              itemCount: 6,
                                              itemBuilder: (BuildContext context, int rowIndex) {

                                                return SizedBox(
                                                  height: 40,
                                                  width: MediaQuery.of(context).size.width*2,
                                                  child: ListView.builder(
                                                    itemCount: 1,
                                                    scrollDirection: Axis.horizontal,
                                                    itemBuilder: (context, index) {
                                                      return Container(
                                                        height: 40,
                                                        width: MediaQuery.of(context).size.width*2,
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                alignment: Alignment.center,
                                                                child: Text(
                                                                  "1002",
                                                                  style: TextStyle(color: Colors.black),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                alignment: Alignment.center,
                                                                child: Text(
                                                                  "200",
                                                                  style: TextStyle(color: Colors.black),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                alignment: Alignment.center,
                                                                child: Text(
                                                                  "23",
                                                                  style: TextStyle(color: Colors.black),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                alignment: Alignment.center,
                                                                child: Text(
                                                                  "34",
                                                                  style: TextStyle(color: Colors.black),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                alignment: Alignment.center,
                                                                child: Text(
                                                                  "45",
                                                                  style: TextStyle(color: Colors.black),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                alignment: Alignment.center,
                                                                child: Text(
                                                                  "56",
                                                                  style: TextStyle(color: Colors.black),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                alignment: Alignment.center,
                                                                child: Text(
                                                                  "62",
                                                                  style: TextStyle(color: Colors.black),
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
                        ), Text("Orders In process"),Padding(
                          padding:  EdgeInsets.only( top:5,left: 15, right: 15),
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
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(elevation: 2,
                    surfaceTintColor: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(height: 20,),
                        SingleChildScrollView(
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
                                  physics: const ClampingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        SizedBox(
                                          height: 40,
                                          width: MediaQuery.of(context).size.width+130,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,

                                                  child: Text(
                                                    "Order N.o",
                                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,

                                                  child: Text(
                                                    "Staff ",
                                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,

                                                  child: Text(
                                                    "Client",
                                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,

                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "No of",
                                                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                      ), Text(
                                                        "Items",
                                                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,

                                                  child: Text(
                                                    "Category",
                                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex:2,
                                                child: Container(
                                                  alignment: Alignment.center,

                                                  child: Text(
                                                    "Delivery Commetion",
                                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: MediaQuery.of(context).size.height*0.4,
                                          width: MediaQuery.of(context).size.width+130,
                                          child: ListView.builder(
                                            padding: EdgeInsets.zero,
                                            physics: const ClampingScrollPhysics(),
                                            itemCount: 15,
                                            itemBuilder: (BuildContext context, int rowIndex) {
                                              final isEvenRow = rowIndex % 2 == 0;
                                              final backgroundColor = isEvenRow ? Colors.yellow : Colors.redAccent;

                                              return SizedBox(
                                                height: 40,
                                                width: MediaQuery.of(context).size.width+130,
                                                child: ListView.builder(
                                                  itemCount: 1,
                                                  scrollDirection: Axis.horizontal,
                                                  itemBuilder: (context, index) {
                                                    return Container(
                                                      height: 40,
                                                      width: MediaQuery.of(context).size.width+130,
                                                      color: backgroundColor,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              alignment: Alignment.center,

                                                              child: Text(
                                                                "3209",
                                                                style: TextStyle(color: Colors.black),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              alignment: Alignment.center,

                                                              child: Text(
                                                                "Noor",
                                                                style: TextStyle(color: Colors.black),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              alignment: Alignment.center,

                                                              child: Text(
                                                                "sha",
                                                                style: TextStyle(color: Colors.black),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              alignment: Alignment.center,

                                                              child: Text(
                                                                "320",
                                                                style: TextStyle(color: Colors.black),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              alignment: Alignment.center,

                                                              child: Text(
                                                                "Dry Clean",
                                                                style: TextStyle(color: Colors.black),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex:2,
                                                            child: Container(
                                                              alignment: Alignment.center,

                                                              child: Text(
                                                                "320",
                                                                style: TextStyle(color: Colors.black),
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
                      ],
                    ),
                  ),
                ),
Text("Express Order in Yellow Background"),
                Text("Normal Order in Red Background"),

                SizedBox(
                  height: 100,
                )
              ]),
        ));
  }
}
