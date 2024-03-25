import 'package:flutter/material.dart';
import 'package:golden_falcon/Picker_App/screens/recharge_wallet.dart';

import '../src/colors.dart';
import '../src/dimen.dart';
import '../src/textString.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/custom_shape.dart';
import '../util/drawer.dart';

class IndividualOutStandinDueScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndividualOutStandinDueScreenState();
}

enum Mode { cash, cheque, wallet }

class IndividualOutStandinDueScreenState extends State<IndividualOutStandinDueScreen> {
  bool valuefirst = false;

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
        child: Appbar(text: 'Ind OutStanding',),
      ),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [

              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Container(
                      margin: EdgeInsets.only(top: size.height * 0.03,left: size.width *0.01),
                      width: size.width * 0.58,
                      height: size.height * 0.045,
                      decoration: ShapeDecoration(
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder (
                              borderRadius: BorderRadius.circular(2.0),
                              side: BorderSide(
                                  width: 2,
                                  color: pickerPrimaryColor
                              )
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin:EdgeInsets.only(left: size.width * 0.02),
                            child: Text('Current OutStanding',),
                          ),


                          Container(
                              height: size.height * 0.05,
                              width: size.width * 0.1,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: pickerPrimaryColor,
                              ),
                              child: Text('20',style: TextStyle(color: Colors.white),)
                          ),
                        ],
                      )
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(top:size.height * 0.03,left: size.width * 0.03,right: size.width * 0.08),
                    width: size.width * 0.19,
                    height: size.height * 0.045,
                    decoration:  ShapeDecoration(
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder (
                            borderRadius: BorderRadius.circular(2.0),
                            side: BorderSide(
                                width: 2,
                                color: pickerPrimaryColor
                            )
                        )
                    ),
                    child:
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder:
                                (context) =>  WalletScreen(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        elevation: 15.0,
                      ),
                      child:  Text(
                        'Collect',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                  ),

                ],
              ),

              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                margin:
                EdgeInsets.symmetric(vertical: size.height * 0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.01,right:size.width * 0.05),
                      width: size.width * 0.9,
                      height: size.height * 0.23,
                      decoration: ShapeDecoration(
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                              side: BorderSide(
                                  width: 2, color: pickerPrimaryColor))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: size.width * 0.03),
                                child: Text('Client Name: '),
                              ),

                              Container(
                                margin: EdgeInsets.only(
                                    right: size.width * 0.03),
                                child: Text('Type :'),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                                left: size.width * 0.03),
                            child: Text('Door No/Building Name: '),
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: size.width * 0.03),
                                child: Text('Locality/Area: '),
                              ),

                              Container(
                                margin: EdgeInsets.only(
                                    right: size.width * 0.03),
                                child: Text('Staff Incharge :'),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: size.width * 0.03),
                                child: Text('Mobile No: '),
                              ),

                              Container(
                                margin: EdgeInsets.only(
                                    right: size.width * 0.03),
                                child: Text('Email Id :'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
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
                                        " Date",
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
                                        "Particular",
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
                                        "No",
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
                                        "Type",
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
                                        "Amt",
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
                                        "Remark",
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
                                        return GestureDetector(
                                          onTap: (){
                                            
                                          },
                                          child: Container(
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
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Balance '),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height:  size.height * 0.08,
                    margin: EdgeInsets.only(top: size.height * 0.02),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: pickerPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          elevation: 15.0,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            '200',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                ],
              )
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
