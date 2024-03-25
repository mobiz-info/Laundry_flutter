import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../src/dimen.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';

class NewComplaintScreen extends StatefulWidget {
  const NewComplaintScreen({Key? key}) : super(key: key);

  @override
  State<NewComplaintScreen> createState() => NewComplaintScreenState();
}

class NewComplaintScreenState extends State<NewComplaintScreen> {
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.red;
    }
    return pickerPrimaryColor;
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
        child:Appbar(text: 'New Complaint',),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

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
                                      "Sl.No",
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
                                      border:
                                      Border.all(color: Colors.deepPurple),
                                    ),
                                    child: Text(
                                      "Order",
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
                                      "Date",
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
                                      "Select",
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
                                                      alignment:
                                                      Alignment.center,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors
                                                                .deepPurple),),
                                                      child: Checkbox(
                                                        checkColor: Colors.white,
                                                        fillColor: MaterialStateProperty.resolveWith(getColor),
                                                        value: isChecked,
                                                        onChanged: (bool? value) {
                                                          setState(() {
                                                            isChecked = value!;
                                                          });
                                                        },
                                                      ))),

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
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text('Complaint Type'),
                  ),
                  Container(
                    width: 90,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(color: pickerPrimaryColor)),
                    child: Center(child: Text('Select')),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 60,child: Text('Remark')),
                  Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(border: Border.all(color: pickerPrimaryColor),
                              borderRadius: BorderRadius.circular(0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.indigo[900])),
                onPressed: () {},
                child: Text('SAVE',style: TextStyle(color: Colors.white),),
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
