import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../src/dimen.dart';
import '../src/textString.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/custom_shape.dart';
import '../util/drawer.dart';

class PickingConfirmationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PickingConfirmationScreenState();
}

class PickingConfirmationScreenState extends State<PickingConfirmationScreen> {

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
        child:Appbar(text: 'Picking Confirmation',),
      ),
      drawer: const MenuDrawer(),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [

            Container(
              margin: EdgeInsets.only(top: size.height * 0.03),
              width: size.width * 0.85,
              height: size.height * 0.2,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder (
                      borderRadius: BorderRadius.circular(2.0),
                      side: BorderSide(
                          width: 2,
                          color: pickerPrimaryColor
                      )
                  )
              ),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin:EdgeInsets.only(left: size.width *0.03),
                        child: Text('Customer Name :'),

                      ),
                      Container(
                        margin:EdgeInsets.only(right: size.width *0.03),
                        child: Text('Type: Home/Corporate'),

                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          margin:EdgeInsets.only(left: size.width *0.03),
                          child: Text('Door No,Building Name :')),
                    ],
                  ),

                  Row(
                    children: [
                      Container(
                          margin:EdgeInsets.only(left: size.width *0.03),
                          child: Text('Locality, Area')),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: size.width * 0.04, top: size.height * 0.05),
                        child: Text('Pick Up Time'),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: size.height * 0.04,left: size.width * 0.03,right: size.width * 0.08),
                          width: size.width * 0.35,
                          height: size.height * 0.04,
                          decoration: ShapeDecoration(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                  side: BorderSide(width: 2, color: pickerPrimaryColor))),
                          child: Center(
                            child: Text('5.00PM - 7.00PM'),
                          )
                      )

                    ],
                  ),

                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.01),
                  padding: EdgeInsets.all(smallTextPadding),
                  width: size.width * 0.25,
                  child:  ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      primary: pickerPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),

                      ),
                      elevation: 15.0,
                    ),
                    child:  Text(
                      'Confirm',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: size.height * 0.03,top: size.height * 0.01),
                  padding: EdgeInsets.all(smallTextPadding),
                  width: size.width * 0.45,
                  child:  ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      primary: pickerPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),

                      ),
                      elevation: 15.0,
                    ),
                    child:  Text(
                      'Choose Pick up Time',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            )
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
