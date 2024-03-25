import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../src/dimen.dart';
import '../src/textString.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/custom_shape.dart';
import '../util/drawer.dart';
import 'dispatch_home.dart';

class DispatchReadyScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DispatchReadyScreenState();
}

class DispatchReadyScreenState extends State<DispatchReadyScreen> {
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
        child:Appbar(text: 'Ready for dispatch',),
      ),
      drawer: const MenuDrawer(),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(left: size.width * 0.05,top: size.height * 0.03),
                    child: Text(
                      'Add Orders',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    )),
                Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(
                        top: size.height * 0.03, right: size.width * 0.06),
                    width: size.width * 0.45,
                    height: size.height * 0.045,
                    decoration: ShapeDecoration(
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                            side: BorderSide(
                                width: 2, color: pickerPrimaryColor))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: size.width * 0.02),
                          child: Text(
                            'Search....',
                          ),
                        ),
                        Container(
                            decoration:
                            BoxDecoration(color: pickerLightGreyColor),
                            child: IconButton(
                              icon: Icon(
                                Icons.search,
                                color: pickerPrimaryColor,
                                size: 22,
                              ),
                              onPressed: () {},
                            )),
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  height: size.height * 0.22,
                  width: MediaQuery.of(context).size.width* 0.9, // Increased width
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
                            width: MediaQuery.of(context)
                                .size
                                .width/0.8, // Increased width
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.deepPurple),
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
                                      border: Border.all(
                                          color: Colors.deepPurple),
                                    ),
                                    child: Text(
                                      "Order No",
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
                                      border: Border.all(
                                          color: Colors.deepPurple),
                                    ),
                                    child: Text(
                                      "Client Name",
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
                                      border: Border.all(
                                          color: Colors.deepPurple),
                                    ),
                                    child: Text(
                                      "Item No",
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
                                      border: Border.all(
                                          color: Colors.deepPurple),
                                    ),
                                    child: Text(
                                      "Amount",
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
                                      border: Border.all(
                                          color: Colors.deepPurple),
                                    ),
                                    child: Text(
                                      "Status",
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
                            height: size.height * 0.13,
                            width: MediaQuery.of(context)
                                .size
                                .width * 1.35,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              physics: const ClampingScrollPhysics(),
                              itemCount: 2,
                              itemBuilder:
                                  (BuildContext context, int rowIndex) {
                                return SizedBox(
                                  height: size.height * 0.05,
                                  width: MediaQuery.of(context).size.width *1.5,
                                  child: ListView.builder(
                                    itemCount: 1,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.05),
                                        height: size.height * 0.05,
                                        width:
                                        MediaQuery.of(context).size.width * 1.5,
                                        // Increased width
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: size.width * 0.15,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                      Colors.deepPurple),
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
                                                      color:
                                                      Colors.deepPurple),
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
                                                      color:
                                                      Colors.deepPurple),
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
                                                      color:
                                                      Colors.deepPurple),
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
                                                      color:
                                                      Colors.deepPurple),
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
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.deepPurple),
                                                ),
                                                child:  Padding(
                                                    padding: const EdgeInsets.all(2.0),
                                                    child: Checkbox(value: true, onChanged: (x){

                                                    })),
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

            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(top: size.height * 0.01,right: size.width * 0.03),
              child:  SizedBox(
                width: size.width * 0.3,
                height: size.height * 0.04,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder:
                            (context) =>  DispatchHomeScreen(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1),
                      side: BorderSide(
                        color: pickerPrimaryColor
                      )
                    ),
                    elevation: 15.0,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'In Transit',
                      style: TextStyle(fontSize: 11,color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ],
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
