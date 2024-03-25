import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Picker_App/screens/stock_transfer.dart';

import '../Picker_App/src/colors.dart';
import '../Picker_App/util/appBar.dart';
import '../Picker_App/util/bottom_navigation_bar.dart';
import '../Picker_App/util/drawer.dart';


class ServiceNewOrderscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ServiceNewOrderscreenState();
}

class ServiceNewOrderscreenState extends State<ServiceNewOrderscreen> {
  int count = 0;
  int neworderradio = 0;
  int availableoffersradio = 0;
  int containerradio = 0;
  bool directStaffCheckbox = false;
  bool contactlessCheckbox = false;
  bool isTableRowSelected = false;
  Color color = pickerPrimaryColor;
  bool showContainer = false;
  String Type = 'Select';
  List<String> Category = ['Select','Washing','Press & Fold','Dry Wash'];


  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurple, size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(
            child: Text("NEW ORDER",
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 18,
                    fontWeight: FontWeight.w500))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.refresh_outlined,
              color: Colors.deepPurple,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  top: size.height * 0.01, left: size.width * 0.03),
              child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: pickerPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {},
                  child: Text("Create New",style: TextStyle(color: Colors.white),)),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Choose Category"),
                SizedBox(width: 30,),
                Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.deepPurple)),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.only(bottom: 10),
                        prefix: SizedBox(
                          width: 10,
                        ),
                        hintText: 'Select',
                        hintStyle: TextStyle(fontWeight: FontWeight.normal)
                    ),  value: Type,
                      items: Category.map((e) => DropdownMenuItem(value: e,child: Text(e),)).toList(),
                      onChanged: (v) {
                        setState(() {
                          Type = v!;
                        });
                      }
                  ),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .10,
                            width: MediaQuery.of(context).size.width * .22,
                            child: Image.asset("Assets/Images/customer_pricing_shirt.jpg",fit: BoxFit.fill)
                          ),
                        ),
                        Text("Shirts"),
                        Container(
                          margin: EdgeInsets.only(right: size.width * 0.05),
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.deepPurple)),
                          child: Center(child: TextFormField(textAlign: TextAlign.center,
                            decoration: InputDecoration(border: InputBorder.none,
                                contentPadding: EdgeInsets.only()),)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .10,
                            width: MediaQuery.of(context).size.width * .22,
                            child: Image.asset("Assets/Images/customer_pricing_trouser.jpg",fit: BoxFit.fill,)
                          ),
                        ),
                        Text("Pants"),
                        Container(
                          margin: EdgeInsets.only(right: size.width * 0.05),
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.deepPurple)),
                          child: TextFormField(decoration: InputDecoration(
                              border: InputBorder.none,contentPadding: EdgeInsets.only())),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .10,
                            width: MediaQuery.of(context).size.width * .22,
                            child: Image.asset("Assets/Images/customer_pricing_pyjama.jpeg",fit: BoxFit.fill,)
                          ),
                        ),
                        Text("Others"),
                        Container(
                          margin: EdgeInsets.only(right: size.width * 0.05),
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.deepPurple)),
                          child: TextFormField(decoration: InputDecoration(
                              border: InputBorder.none,contentPadding: EdgeInsets.only())),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: pickerPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                setState(() {
                  showContainer = !showContainer;
                });
              },
              child: Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Visibility(
              visible: showContainer,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Icon(Icons.keyboard_double_arrow_down),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    "Cart",
                    style: TextStyle(fontSize: 30, color: Colors.deepPurple),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Card(
                    elevation: 2,
                    surfaceTintColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width /
                                1.2, // Increased width
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
                                      width: MediaQuery.of(context).size.width /
                                          1.2, // Increased width
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 20,
                                            alignment: Alignment.center,
                                            child: Text(
                                              " Sl No",
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),SizedBox(width: 5,),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Category",
                                                style: TextStyle(
                                                  color: Colors.deepPurple,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex:2,
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "No of Items",
                                                style: TextStyle(
                                                  color: Colors.deepPurple,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Rate",
                                                style: TextStyle(
                                                  color: Colors.deepPurple,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.13,
                                      width: MediaQuery.of(context).size.width /
                                          1.2, // Increased width
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        physics: const ClampingScrollPhysics(),
                                        itemCount: 2,
                                        itemBuilder: (BuildContext context,
                                            int rowIndex) {
                                          return SizedBox(
                                            height: 40,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: ListView.builder(
                                              itemCount: 1,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  height: 40,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      1.2,
                                                  // Increased width
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        width: 20,
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex:2,
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(2),
                                                                margin: EdgeInsets.only(
                                                                    left: size
                                                                            .width *
                                                                        0.01),
                                                                decoration:
                                                                    new BoxDecoration(
                                                                  color:
                                                                      pickerPrimaryColor,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Icon(
                                                                  Icons.edit,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 20,
                                                                ),
                                                              ),
                                                              Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(2),
                                                                margin: EdgeInsets.only(
                                                                    left: size
                                                                            .width *
                                                                        0.01),
                                                                decoration:
                                                                    new BoxDecoration(
                                                                  color:
                                                                      pickerPrimaryColor,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Icon(
                                                                  Icons.delete,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 20,
                                                                ),
                                                              ),
                                                            ],
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Mode of Delivery"),
                      Checkbox(
                        activeColor: Colors.lightBlue,
                        value: directStaffCheckbox,
                        onChanged: (value) {
                          setState(() {
                            directStaffCheckbox = value!;
                          });
                        },
                      ),
                      Text('Normal 5'),
                      SizedBox(width: 10),
                      Checkbox(
                        activeColor: Colors.lightBlue,
                        value: contactlessCheckbox,
                        onChanged: (value) {
                          setState(() {
                            contactlessCheckbox = value!;
                          });
                        },
                      ),
                      Text('Express 10'),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("To be Delivered on"),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.3,

                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurple)),
                        // Add your desired content for the container here
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(" Time"),
                      SizedBox(
                        width: 90,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.3,

                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurple)),
                        // Add your desired content for the container here
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {

                        Navigator.push(context,
                            MaterialPageRoute(builder:
                                (context) =>  StockTransferScreen(),
                            ));
                      },
                      child: Text("Save"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
