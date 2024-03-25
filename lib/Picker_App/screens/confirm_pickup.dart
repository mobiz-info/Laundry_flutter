import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../src/dimen.dart';
import '../src/textString.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/custom_shape.dart';
import '../util/drawer.dart';
import 'create_pickup.dart';

class ConfirmPickupScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ConfirmPickupScreenState();
}

class ConfirmPickupScreenState extends State<ConfirmPickupScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
        child:Appbar(text: 'Confirm Pick Up',),
      ),
      drawer: const MenuDrawer(),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [

            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: size.height * 0.05,
              margin: EdgeInsets.only(top: size.height * 0.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: pickerPrimaryColor,
              ),
              child:
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder:
                          (context) =>  CreatePickupScreen(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  primary: pickerPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 15.0,
                ),
                child:  Text(
                  'New Pick up list',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    if (count <= 2) {
                      count = count + 1;
                    }

                    return Container(
                      margin: EdgeInsets.only(bottom: size.width * 0.05),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: size.width * 0.05,
                                top: size.height * 0.05),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              count.toString() + ".",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: size.height * 0.01),
                            width: size.width * 0.8,
                            height: size.height * 0.25,
                            decoration: ShapeDecoration(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(
                                        width: 2, color: pickerPrimaryColor))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: size.width * 0.03),
                                      child: Text('Customer Name :'),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          right: size.width * 0.03),
                                      width: size.width * 0.23,
                                      height: size.height * 0.05,
                                      padding: EdgeInsets.all(5),
                                      /* decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: pickerPrimaryColor,
                                      ),*/
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          primary: pickerPrimaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          elevation: 15.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.call,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              'Call',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: size.width * 0.03,
                                            top: size.height * 0.02),
                                        child: Text('Area,Locality :')),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: size.width * 0.03,
                                            top: size.height * 0.02),
                                        child: Text('Mobile Number :')),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: size.width * 0.03,
                                            top: size.height * 0.02),
                                        child: Text('Pick Up Time :')),
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: size.width * 0.03,
                                            top: size.height * 0.02),
                                        child: Text('7.00am - 9.00am')),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: size.height * 0.02),
                                      width: size.width * 0.394,
                                      height: size.height * 0.05,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          primary: pickerPrimaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(1),
                                          ),
                                          elevation: 15.0,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'Confirm',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: size.height * 0.02),
                                      width: size.width * 0.394,
                                      height: size.height * 0.05,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(color: pickerPrimaryColor),
                                          ),
                                        ),
                                        child: TextButton(
                                          onPressed: () { },
                                          child: Text('Change Time',style: TextStyle(fontSize: 12,color: pickerPrimaryColor),),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.png'), fit: BoxFit.fill),
        ),
        child: BottomDrawer(),
      ),
    );
  }
}
