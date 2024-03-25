import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/drawer.dart';

class UnDeliveredScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UnDeliveredScreenState();
}

class UnDeliveredScreenState extends State<UnDeliveredScreen> {
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
        child:Appbar(text:  'Un Delivered',),
      ),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [

              ListView.builder(
                primary: false,
                shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {

                    return GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(bottom: size.width * 0.05),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: size.height * 0.04),
                                      width: size.width * 0.75,
                                      height: size.height * 0.2,
                                      decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5.0),
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
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: size.width * 0.5),
                                      width: size.width * 0.22,
                                      height: size.height * 0.03,
                                      child: ElevatedButton(
                                        onPressed: () {

                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: pickerPrimaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          elevation: 15.0,
                                        ),
                                        child: Text(
                                          'Deliver',
                                          style: TextStyle(fontSize: 11,color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: size.width * 0.01),
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: new BoxDecoration(
                                    color: pickerPrimaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  )
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: (){

                      },
                    );
                  },

              ),
              Container(
                margin: EdgeInsets.only(left: size.width * 0.5),
                width: size.width * 0.33,
                height: size.height * 0.04,
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    primary: pickerPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    elevation: 15.0,
                  ),
                  child: Text(
                    'Back To shop',
                    style: TextStyle(fontSize: 11,color: Colors.white),
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
