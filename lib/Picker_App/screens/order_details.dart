import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../src/dimen.dart';
import '../src/textString.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/custom_shape.dart';
import '../util/drawer.dart';

class OrderDetailsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OrderDetailsScreenState();
}

enum Mode { cash, cheque, wallet }

class OrderDetailsScreenState extends State<OrderDetailsScreen> {
  bool valuefirst = false;
  Mode _mode = Mode.cash;

  int value = 0;

  Widget CustomRadioButton(String text, int index) {
    return Container(
      child: Row(
        children: [
          Text(text),
          Radio(value: Mode.cash, groupValue: _mode, onChanged: (Mode? value){
            setState(() {
                  _mode = value!;
            });
          })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
        child: Appbar(text:  'Order Details',),
      ),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    height: size.height * 0.24,
                    width: MediaQuery.of(context).size.width *
                        0.9, // Increased width
                    child: ListView.builder(
                      itemCount: 1,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05),
                              height: size.height * 0.08,
                              width: MediaQuery.of(context).size.width /
                                  0.8, // Increased width
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.deepPurple),
                                      ),
                                      child: Text(
                                        " Sl No",
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
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.deepPurple),
                                      ),
                                      child: Text(
                                        "Inv No",
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
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.deepPurple),
                                      ),
                                      child: Text(
                                        "Inv Date",
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
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.deepPurple),
                                      ),
                                      child: Text(
                                        "Bal amt",
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
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.deepPurple),
                                      ),
                                      child: Text(
                                        "Received amt",
                                        style: TextStyle(
                                          color: Colors.deepPurple,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 1.35,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                physics: const ClampingScrollPhysics(),
                                itemCount: 2,
                                itemBuilder:
                                    (BuildContext context, int rowIndex) {
                                  return SizedBox(
                                    height: size.height * 0.05,
                                    width:
                                        MediaQuery.of(context).size.width * 1.5,
                                    child: ListView.builder(
                                      itemCount: 1,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.05),
                                          height: size.height * 0.05,
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  1.5,
                                          // Increased width
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  width: size.width * 0.15,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.deepPurple),
                                                  ),
                                                  child: Text(
                                                    "",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: size.width * 0.15,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.deepPurple),
                                                  ),
                                                  child: Text(
                                                    "",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: size.width * 0.15,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.deepPurple),
                                                  ),
                                                  child: Text(
                                                    "",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: size.width * 0.15,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.deepPurple),
                                                  ),
                                                  child: Text(
                                                    "",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: size.width * 0.15,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.deepPurple),
                                                  ),
                                                  child: Text(
                                                    "",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
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
                            Container(
                              height: size.height * 0.05,
                              width: MediaQuery.of(context).size.width /
                                  0.8, // Increased width
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.deepPurple),
                                      ),
                                      child: Text(
                                        " Total",
                                        style: TextStyle(
                                          color: Colors.deepPurple,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.deepPurple),
                                      ),
                                      child: Text(
                                        "100",
                                        style: TextStyle(
                                          color: Colors.deepPurple,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    top: size.height * 0.01,
                    left: size.width * 0.05,
                    right: size.width * 0.02),
                child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: size.width * 0.2,
                        child: Text(
                          'Mode of Payment :',
                          style: TextStyle(fontSize: 13),
                        )),
                    Container(
                      padding: EdgeInsets.zero,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          Radio(value: Mode.cash, groupValue: _mode, onChanged: (Mode? value){
                            setState(() {
                              _mode = value!;
                            });
                          }),
                          Text('Cash'),
                        ],
                      )
                    ),
                    Container(
                        padding: EdgeInsets.zero,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            Radio(value: Mode.cheque, groupValue: _mode, onChanged: (Mode? value){
                              setState(() {
                                _mode = value!;
                              });
                            }),
                            Text('Cheque'),
                          ],
                        )
                    ),
                    Container(
                        padding: EdgeInsets.zero,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            Radio(value: Mode.wallet, groupValue: _mode, onChanged: (Mode? value){
                              setState(() {
                                _mode = value!;
                              });
                            }),
                            Text('Wallet'),
                          ],
                        )
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              _mode == Mode.cash ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        width: size.width * 0.35,
                        height: size.height * 0.04,
                        child:  Text('Previous Balance'),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.08),
                          width: size.width * 0.35,
                          height: size.height * 0.04,
                          decoration: ShapeDecoration(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                  side: BorderSide(width: 1, color: pickerPrimaryColor))),
                          child: Center(
                            child: Text(''),
                          )
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        width: size.width * 0.35,
                        height: size.height * 0.04,
                        child:  Text("Today's Amount"),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.08),
                          width: size.width * 0.35,
                          height: size.height * 0.04,
                          decoration: ShapeDecoration(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                  side: BorderSide(width: 1, color: pickerPrimaryColor))),
                          child: Center(
                            child: Text(''),
                          )
                      )
                    ],
                  ),

                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        width: size.width * 0.35,
                        height: size.height * 0.04,
                        child:  Text('Total Amount'),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.08),
                          width: size.width * 0.35,
                          height: size.height * 0.04,
                          decoration: ShapeDecoration(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                  side: BorderSide(width: 1, color: pickerPrimaryColor))),
                          child: Center(
                            child: Text(''),
                          )
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        width: size.width * 0.35,
                        height: size.height * 0.04,
                        child:  Text('Amount Received'),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.08),
                          width: size.width * 0.35,
                          height: size.height * 0.04,
                          decoration: ShapeDecoration(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                  side: BorderSide(width: 1, color: pickerPrimaryColor))),
                          child: Center(
                            child: Text(''),
                          )
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height:  size.height * 0.08,
                    margin: EdgeInsets.only(top: size.height * 0.02),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: pickerPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 15.0,
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(fontSize: 14,color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],

              ) : _mode == Mode.cheque ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        width: size.width * 0.35,
                        height: size.height * 0.04,
                        child:  Text('Amount'),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.08),
                          width: size.width * 0.35,
                          height: size.height * 0.04,
                          decoration: ShapeDecoration(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                  side: BorderSide(width: 1, color: pickerPrimaryColor))),
                          child: Center(
                            child: Text(''),
                          )
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        width: size.width * 0.35,
                        height: size.height * 0.04,
                        child:  Text("Cheque No"),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.08),
                          width: size.width * 0.35,
                          height: size.height * 0.04,
                          decoration: ShapeDecoration(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                  side: BorderSide(width: 1, color: pickerPrimaryColor))),
                          child: Center(
                            child: Text(''),
                          )
                      )
                    ],
                  ),

                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        width: size.width * 0.35,
                        height: size.height * 0.04,
                        child:  Text('Bank'),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.08),
                          width: size.width * 0.35,
                          height: size.height * 0.04,
                          decoration: ShapeDecoration(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                  side: BorderSide(width: 1, color: pickerPrimaryColor))),
                          child: Center(
                            child: Text(''),
                          )
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        width: size.width * 0.35,
                        height: size.height * 0.04,
                        child:  Text('Pak'),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.08),
                          width: size.width * 0.35,
                          height: size.height * 0.04,
                          decoration: ShapeDecoration(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                  side: BorderSide(width: 1, color: pickerPrimaryColor))),
                          child: Center(
                            child: Text(''),
                          )
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height:  size.height * 0.08,
                    margin: EdgeInsets.only(top: size.height * 0.02),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: pickerPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 15.0,
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(fontSize: 14,color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],

              ) : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        width: size.width * 0.35,
                        height: size.height * 0.04,
                        child:  Text('Previous Balance'),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.08),
                          width: size.width * 0.35,
                          height: size.height * 0.04,
                          decoration: ShapeDecoration(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                  side: BorderSide(width: 1, color: pickerPrimaryColor))),
                          child: Center(
                            child: Text(''),
                          )
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        width: size.width * 0.35,
                        height: size.height * 0.04,
                        child:  Text("Today's Amount"),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.08),
                          width: size.width * 0.35,
                          height: size.height * 0.04,
                          decoration: ShapeDecoration(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                  side: BorderSide(width: 1, color: pickerPrimaryColor))),
                          child: Center(
                            child: Text(''),
                          )
                      )
                    ],
                  ),

                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        width: size.width * 0.35,
                        height: size.height * 0.04,
                        child:  Text('Total Amount'),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.08),
                          width: size.width * 0.35,
                          height: size.height * 0.04,
                          decoration: ShapeDecoration(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                  side: BorderSide(width: 1, color: pickerPrimaryColor))),
                          child: Center(
                            child: Text(''),
                          )
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height:  size.height * 0.08,
                    margin: EdgeInsets.only(top: size.height * 0.02),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: pickerPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 15.0,
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(fontSize: 14,color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              )
              /*Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(
                    top: size.height * 0.01, right: size.width * 0.03),
                child: SizedBox(
                  width: size.width * 0.3,
                  height: size.height * 0.04,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1),
                          side: BorderSide(color: pickerPrimaryColor)),
                      elevation: 15.0,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'In Transit',
                        style: TextStyle(fontSize: 11, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),*/
            ],
          ),
        ),
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
