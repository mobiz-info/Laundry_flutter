import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../src/colors.dart';
import '../src/dimen.dart';
import '../src/textString.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/custom_shape.dart';
import '../util/drawer.dart';

class OrderHistoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OrderHistoryScreenState();
}

class OrderHistoryScreenState extends State<OrderHistoryScreen> {
  bool valuefirst = false;
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
        child:Appbar(text: 'Order History',),
      ),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.05),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: Text(
                      'From Date : 10/06/2023',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    )),
                    Container(
                        child: Text(
                      'To Date : 15/06/2023',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    )),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.03),
                    child: Text(
                      'No of Orders :',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: size.height * 0.03,
                          left: size.width * 0.03,
                          right: size.width * 0.08),
                      width: size.width * 0.1,
                      height: size.height * 0.05,
                      decoration: ShapeDecoration(
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                              side: BorderSide(
                                  width: 2, color: pickerPrimaryColor))),
                      child: Center(
                        child: Text('15'),
                      )),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(
                    top: size.height * 0.03,
                    bottom: size.height * 0.01,
                  ),
                  width: size.width,
                  height: size.height * 0.15,
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: size.width * 0.15,
                            height: size.height * 0.1,
                            decoration: new BoxDecoration(
                              color: pickerPrimaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '5',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: size.width * 0.01),
                            child: Text(
                              'VIA APP',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: size.width * 0.15,
                            height: size.height * 0.1,
                            decoration: new BoxDecoration(
                              color: pickerPrimaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '5',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: size.width * 0.01),
                            child: Text(
                              'VIA CALL',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: size.width * 0.15,
                            height: size.height * 0.1,
                            decoration: new BoxDecoration(
                              color: pickerPrimaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '5',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: size.width * 0.01),
                            child: Text(
                              'VIA STAFF',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: size.width * 0.15,
                            height: size.height * 0.1,
                            decoration: new BoxDecoration(
                              color: pickerPrimaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '5',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: size.width * 0.01),
                            child: Text(
                              'NEW CLIENTS',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
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
                                        "Customer Name",
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
                                        "Location/building Name",
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
                                        "Picked Time",
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
              Icon(
                Icons.keyboard_double_arrow_down_outlined,
                color: pickerPrimaryColor,
              ),
              Icon(
                Icons.keyboard_double_arrow_down_outlined,
                color: pickerPrimaryColor,
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
                                        "Category",
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
                                        "Item Name",
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
                                        "Qty",
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
