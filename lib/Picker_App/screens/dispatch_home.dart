import 'package:flutter/material.dart';

import '../../Customers/Customer_Home.dart';
import '../src/colors.dart';
import '../src/dimen.dart';
import '../src/textString.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/custom_shape.dart';
import '../util/drawer.dart';

class DispatchHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DispatchHomeScreenState();
}

class DispatchHomeScreenState extends State<DispatchHomeScreen> {
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
        child:Appbar(text: 'In Transit',),
      ),
      drawer: const MenuDrawer(),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.03,left: size.width * 0.06),
                    padding: EdgeInsets.all(smallTextPadding),
                    width: size.width * 0.3,
                    child:  ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                        primary: pickerPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),

                        ),
                        elevation: 15.0,
                      ),
                      child:  Text(
                        'Add',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.03,right: size.width *0.06),
                    width: size.width * 0.45,
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
                          child: Text('Search....',),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: pickerLightGreyColor
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: pickerPrimaryColor,
                              size: 22,
                            ),
                            onPressed: () {},
                          )
                        ),
                      ],
                    )
                  )
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {

                    return GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(bottom: size.width * 0.05),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: size.height * 0.05),
                              width: size.width * 0.9,
                              height: size.height * 0.25,
                              decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(
                                          width: 2, color: pickerPrimaryColor))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                      Container(
                                      margin:EdgeInsets.only(left: size.width *0.03),
                                      child: Text('Client Name :'),

                                    ),
                                      Container(
                                        margin:EdgeInsets.only(right: size.width *0.03),
                                        child: Text('Order Type: '),

                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          margin:EdgeInsets.only(left: size.width *0.03),
                                          child: Text('Estimated Delivery time :')),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin:EdgeInsets.only(left: size.width *0.03),
                                          child: Text('Order No :')),
                                      Container(
                                          margin:EdgeInsets.only(right: size.width *0.03),
                                          child: Text('Inv no: ')),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          margin:EdgeInsets.only(left: size.width *0.03),
                                          child: Text('Payment Status: ')),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                          margin:EdgeInsets.only(left: size.width *0.03),
                                          child: CircleAvatar(
                                            radius: 15,
                                            backgroundColor: pickerPrimaryColor, //<-- SEE HERE
                                            child: Center(
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.call,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          )),
                                      Container(
                                          margin:EdgeInsets.only(left: size.width *0.03),
                                          child: CircleAvatar(
                                            radius: 15,
                                            backgroundColor: pickerPrimaryColor, //<-- SEE HERE
                                            child: Center(
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.remove_red_eye_outlined,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          )),
                                      Container(
                                          margin:EdgeInsets.only(left: size.width *0.03),
                                          child: CircleAvatar(
                                            radius: 15,
                                            backgroundColor: pickerPrimaryColor, //<-- SEE HERE
                                            child: Center(
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.location_on,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          )),
                                      Container(
                                          margin:EdgeInsets.only(left: size.width *0.03,right: size.width *0.03),
                                          child: CircleAvatar(
                                            radius: 15,
                                            backgroundColor: pickerPrimaryColor, //<-- SEE HERE
                                            child: Center(
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.mode_edit_outline_outlined,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder:
                        (context) =>  CustomerHomeScreen(),
                        ),
                        );
                      },
                    );
                  },

              ),
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
