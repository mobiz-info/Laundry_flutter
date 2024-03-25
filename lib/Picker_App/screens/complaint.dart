import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import 'new_complaint.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({Key? key}) : super(key: key);

  @override
  State<ComplaintScreen> createState() => ComplaintScreenState();
}

class ComplaintScreenState extends State<ComplaintScreen> {
  int selectedRowIndex = -1;

  void selectRow(int index) {
    setState(() {
      selectedRowIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
        child:Appbar(text:  'Complaint',),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 10),
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.indigo[900])),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder:
                          (context) =>  NewComplaintScreen(),
                      ));
                },
                child: Text('NEW',style: TextStyle(color: Colors.white),),
              ),
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
                                      "Com.No",
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
                                      "Status",
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
            Align(
                alignment: Alignment.center,
                child: Icon(Icons.keyboard_double_arrow_down,color: pickerPrimaryColor,size: 25,)),
            SizedBox(
              height: size.height * 0.01,
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
                              child: Text('Complaint No: '),
                            ),

                            Container(
                              margin: EdgeInsets.only(
                                  right: size.width * 0.03),
                              child: Text('Status : Resolved/Pending'),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(
                              left: size.width * 0.03),
                          child: Text('Complaint Date: '),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(
                              left: size.width * 0.03),
                          child: Text('Order No: '),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(
                              left: size.width * 0.03),
                          child: Text('Complaint Type: '),
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
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: size.width * 0.05 ,bottom: size.height * 0.05),
                  child: Text('Reply from Company',style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border.all(color: pickerPrimaryColor),
                borderRadius: BorderRadius.circular(0)),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'My Remark',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      color: pickerPrimaryColor),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: size.height* 0.05),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: size.height * 0.01,right: size.width * 0.03),
                    child:  SizedBox(
                      width: size.width * 0.3,
                      height: size.height * 0.04,
                      child: ElevatedButton(
                        onPressed: () {

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
                            'Reply',
                            style: TextStyle(fontSize: 11,color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: size.height * 0.01,right: size.width * 0.03),
                    child:  SizedBox(
                      width: size.width * 0.3,
                      height: size.height * 0.04,
                      child: ElevatedButton(
                        onPressed: () {

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
                            'Back',
                            style: TextStyle(fontSize: 11,color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
