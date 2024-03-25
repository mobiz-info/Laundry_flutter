import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../src/dimen.dart';
import '../src/textString.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/custom_shape.dart';
import '../util/drawer.dart';

class CatogoryWiseReportScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CatogoryWiseReportScreenState();
}

class CatogoryWiseReportScreenState extends State<CatogoryWiseReportScreen> {
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
        child: Appbar(text: 'Category wise Order Report',),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.03),
                        width: size.width * 0.2,
                        height: size.height * 0.04,
                        decoration: ShapeDecoration(
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                                side: BorderSide(width: 1, color: pickerPrimaryColor))),
                        child: Container(
                          margin: EdgeInsets.only(top: size.height * 0.015),
                          alignment: Alignment.center,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: 'From Date'
                            ),
                          ),
                        )
                    ),
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.03),
                        width: size.width * 0.2,
                        height: size.height * 0.04,
                        decoration: ShapeDecoration(
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                                side: BorderSide(width: 1, color: pickerPrimaryColor))),
                        child: Container(
                          margin: EdgeInsets.only(top: size.height * 0.015),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: 'To Date'
                            ),
                          ),
                        )
                    ),
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.01,left: size.width * 0.03),
                      padding: EdgeInsets.all(smallTextPadding),
                      width: size.width * 0.27,
                      child:  ElevatedButton(
                        onPressed: () {

                        },
                        style: ElevatedButton.styleFrom(
                          primary: pickerPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),

                          ),
                          elevation: 15.0,
                        ),
                        child:  Text(
                          'Load',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    height: size.height * 0.18,
                    width: MediaQuery.of(context).size.width *
                        0.85, // Increased width
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
                              height: size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.75, // Increased width
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
                                        "Category Name",
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
                                        "Orders",
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
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                physics: const ClampingScrollPhysics(),
                                itemCount: 2,
                                itemBuilder:
                                    (BuildContext context, int rowIndex) {
                                  return GestureDetector(
                                    onTap: (){

                                    },
                                    child: SizedBox(
                                      height: size.height * 0.05,
                                      width:
                                      MediaQuery.of(context).size.width * 0.85,
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
                                                0.85,
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

                                              ],
                                            ),
                                          );
                                        },
                                      ),
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
                height: size.height * 0.02,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Icon(Icons.keyboard_double_arrow_down,color: pickerPrimaryColor,size: 25,)),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    height: size.height * 0.18,
                    width: MediaQuery.of(context).size.width *
                        0.85, // Increased width
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
                              height: size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.75, // Increased width
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
                                        border:
                                        Border.all(color: Colors.deepPurple),
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
                                        border:
                                        Border.all(color: Colors.deepPurple),
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
                              height: size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                physics: const ClampingScrollPhysics(),
                                itemCount: 2,
                                itemBuilder:
                                    (BuildContext context, int rowIndex) {
                                  return GestureDetector(
                                    onTap: (){

                                    },
                                    child: SizedBox(
                                      height: size.height * 0.05,
                                      width:
                                      MediaQuery.of(context).size.width * 0.85,
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
                                                0.85,
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

                                              ],
                                            ),
                                          );
                                        },
                                      ),
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
