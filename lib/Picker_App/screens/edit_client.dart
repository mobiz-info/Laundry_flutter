import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../src/dimen.dart';
import '../src/textString.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/custom_shape.dart';
import '../util/drawer.dart';

class EditClientScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EditClientScreenState();
}

class EditClientScreenState extends State<EditClientScreen> {
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
        child:Appbar(text: 'Edit Client',),
      ),
      drawer: const MenuDrawer(),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(value: 'test', groupValue: 'test', onChanged:(x){

                }),
                Text('New')
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                   top: size.height * 0.02, left: size.width * 0.05),
              child: Text('Name : Muhammed'),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  top: size.height * 0.02, left: size.width * 0.05),
              child: Text('Door No, Building Name : 25,Emirates Stars'),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.02, left: size.width * 0.05),
              child: Row(
                children: [
                  Text('Customer Type :'),
                  Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(value: 'test', groupValue: 'test', onChanged:(x){

                          }),
                          Text('Home')
                        ],
                      )
                  ),
                  Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(value: 'test', groupValue: 'test', onChanged:(x){

                          }),
                          Text('Corporate')
                        ],
                      )
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  top: size.height * 0.02, left: size.width * 0.05),
              child: Text('Locality : Al Nahda'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(
                      top: size.height * 0.02, left: size.width * 0.05),
                  child: Text('Mobile : 345257876'),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(
                      top: size.height * 0.02, right: size.width * 0.05),
                  child: Text('Birthday : 12-Feb'),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  top: size.height * 0.02, left: size.width * 0.05),
              child: Text('Email ID : muhammed@gmail.com'),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: size.height * 0.04,
                    margin: EdgeInsets.only(top: size.height * 0.05),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: pickerPrimaryColor,
                    ),
                    child:
                    ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                        primary: pickerPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 15.0,
                      ),
                      child:  Text(
                        'GPS',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: size.height * 0.04,
                    margin: EdgeInsets.only(top: size.height * 0.05,left: size.width * 0.05,right: size.width * 0.05),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: pickerPrimaryColor,
                    ),
                    child:
                    ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                        primary: pickerPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 15.0,
                      ),
                      child:  Text(
                        'Save',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
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
