import 'package:flutter/material.dart';
import 'package:golden_falcon/Picker_App/screens/picking_confirmation.dart';

import '../src/colors.dart';
import '../src/dimen.dart';
import '../src/textString.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/custom_shape.dart';
import '../util/drawer.dart';

class CreatePickupScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreatePickupScreenState();
}

class CreatePickupScreenState extends State<CreatePickupScreen> {

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
        child:Appbar(text: 'Create New Pick Up Result',),
      ),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: size.width * 0.04, top: size.height * 0.05),
                    child: Text('Mobile No'),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: size.height * 0.04,left: size.width * 0.03),
                      width: size.width * 0.4,
                      height: size.height * 0.05,
                      decoration: ShapeDecoration(
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                              side: BorderSide(width: 2, color: pickerPrimaryColor))),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: '',
                            hintText: ''
                        ),
                      )

                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.04,left: size.width * 0.03),
                    padding: EdgeInsets.all(smallTextPadding),
                    width: size.width * 0.3,
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
                        'Search',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.04),
                child: Text(
                  'Search Result',
                  style: TextStyle(
                    color: pickerPrimaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    //  decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Divider(
                color: pickerPrimaryColor,
                endIndent: size.width * 0.38,
                indent: size.width * 0.38,
                thickness: 1,
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.03),
                width: size.width * 0.85,
                height: size.height * 0.15,
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
                          child: Text('Home/Corporate'),

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

                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: size.width * 0.04, top: size.height * 0.05),
                    child: Text('Pick Up Time'),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: size.height * 0.04,left: size.width * 0.03,right: size.width * 0.08),
                      width: size.width * 0.35,
                      height: size.height * 0.05,
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: size.width * 0.04, top: size.height * 0.05),
                    child: Text('Express'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.04,right: size.width * 0.08),
                    /* decoration: ShapeDecoration(
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                            side: BorderSide(width: 2, color: pickerPrimaryColor))),
                   */ child: Checkbox(
                    value: this.valuefirst,
                    onChanged: (bool? value) {
                      setState(() {
                        this.valuefirst = value!;
                      });
                    },
                  ),
                  ),

                ],
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.01,bottom: size.height * 0.03),
                padding: EdgeInsets.all(smallTextPadding),
                width: size.width * 0.3,
                child:  ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder:
                            (context) =>  PickingConfirmationScreen(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: pickerPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),

                    ),
                    elevation: 15.0,
                  ),
                  child:  Text(
                    'Save',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
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
