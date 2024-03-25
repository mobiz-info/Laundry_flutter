import 'package:flutter/material.dart';
import 'package:golden_falcon/Picker_App/screens/recharge_wallet.dart';

import '../src/colors.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/drawer.dart';
import 'Complaint.dart';
import 'edit_client.dart';
import 'new_order.dart';
import 'order_details.dart';
import 'order_history.dart';

class CustomerHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CustomerHomeScreenState();
}

class CustomerHomeScreenState extends State<CustomerHomeScreen> {

  int count = 0;

  Future<bool> showExitPopup() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(actionsAlignment: MainAxisAlignment.center,
        title: Center(child: Text('Exit App !',style: TextStyle(color: Colors.pinkAccent[400]),)),
        content: SizedBox(
            height: 50,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    const Text('Do you Really Want to'),
                    const Text('Close the App ?')
                  ],
                ),
              ),

            )),
        actions:[
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No',style: TextStyle(color: Colors.green[700]),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Yes',style: TextStyle(color: Colors.pinkAccent[400]),),
            ),
          ),
        ],
      ),
    )??false;
  }


  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize:
          Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
          child:Appbar(text: 'Customer Home',),
        ),
        drawer: const MenuDrawer(),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(
                      top: size.height * 0.05, left: size.width * 0.03),
                  child: Text('Name :'),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: size.width * 0.03),
                        child: Text('Address :'),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: size.width * 0.03),
                        child: Text('Birthday : 12/06/2002'),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.02),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: size.width * 0.03),
                        child: Text('Mobile No :'),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: size.width * 0.03),
                        child: Text('Email ID :'),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.03),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: size.width * 0.03),
                            child: Text(
                              'Current outstanding :',
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  left: size.width * 0.03,
                                  right: size.width * 0.08),
                              width: size.width * 0.08,
                              height: size.height * 0.04,
                              decoration: ShapeDecoration(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.0),
                                      side: BorderSide(
                                          width: 2, color: pickerPrimaryColor))),
                              child: Center(
                                child: Text(
                                  '15',
                                  style: TextStyle(fontSize: 13),
                                ),
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Wallet balance :',
                            style: TextStyle(fontSize: 13),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  left: size.width * 0.03,
                                  right: size.width * 0.08),
                              width: size.width * 0.08,
                              height: size.height * 0.04,
                              decoration: ShapeDecoration(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.0),
                                      side: BorderSide(
                                          width: 2, color: pickerPrimaryColor))),
                              child: Center(
                                child: Text(
                                  '15',
                                  style: TextStyle(fontSize: 13),
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: size.width * 0.4,
                        height: size.height * 0.04,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder:
                                    (context) =>  EditClientScreen(),
                                ));

                          },
                          style: ElevatedButton.styleFrom(
                            primary: pickerPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1),
                            ),
                            elevation: 15.0,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Edit client',
                              style: TextStyle(fontSize: 11),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.4,
                        height: size.height * 0.04,
                        child: ElevatedButton(
                          onPressed: () {

                            Navigator.push(context,
                                MaterialPageRoute(builder:
                                    (context) =>  NewOrderScreen(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: pickerPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1),
                            ),
                            elevation: 15.0,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'New Order',
                              style: TextStyle(fontSize: 11),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: size.width * 0.4,
                        height: size.height * 0.04,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder:
                                    (context) =>  OrderHistoryScreen(),
                                ));

                          },
                          style: ElevatedButton.styleFrom(
                            primary: pickerPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1),
                            ),
                            elevation: 15.0,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Order History',
                              style: TextStyle(fontSize: 11),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.4,
                        height: size.height * 0.04,
                        child: ElevatedButton(
                          onPressed: () {

                            Navigator.push(context,
                                MaterialPageRoute(builder:
                                    (context) =>  WalletScreen(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: pickerPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1),
                            ),
                            elevation: 15.0,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Add to wallet',
                              style: TextStyle(fontSize: 11),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: size.width * 0.4,
                        height: size.height * 0.04,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder:
                                    (context) =>  ComplaintScreen(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: pickerPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1),
                            ),
                            elevation: 15.0,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'complaint',
                              style: TextStyle(fontSize: 11),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.4,
                        height: size.height * 0.04,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: pickerPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1),
                            ),
                            elevation: 15.0,
                          ),
                          child: Text(
                            'New bag orders',
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.02),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: size.width * 0.4,
                    height: size.height * 0.04,
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                        primary: pickerPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1),
                        ),
                        elevation: 15.0,
                      ),
                      child: Text(
                        'Door Lock',
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.05),
                  child: Text(
                    "Today's Delivery",
                    style: TextStyle(
                      color: pickerPrimaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      //  decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                Divider(
                  color: pickerPrimaryColor,
                  endIndent: size.width * 0.33,
                  indent: size.width * 0.33,
                  thickness: 1,
                ),
                ListView.builder(
                    itemCount: 2,
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
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
                              decoration: ShapeDecoration(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.0),
                                      side: BorderSide(
                                          width: 2, color: pickerPrimaryColor))),
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
                                        child: Text('Order No : '),
                                      ),
                                      Container(
                                        child: Text('Inv no :'),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: size.width * 0.03),
                                        child: Text('No of Items :'),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: size.width * 0.03),
                                        child: Text('Order Date :'),
                                      ),
                                      Container(
                                        child: Text('Inv Date :'),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: size.width * 0.03),
                                        child: Text('Type : Laundry'),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: size.width * 0.03),
                                        child: Text('Amount :'),
                                      ),
                                      Container(
                                        child: Text('Paid :'),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: size.width * 0.03),
                                        child: Text('Balance :'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.only(top: size.height * 0.03,right:size.width * 0.05),
                                width: size.width * 0.4,
                                height: size.height * 0.03,
                                decoration: ShapeDecoration(
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2.0),
                                        side: BorderSide(
                                            width: 2,
                                            color: pickerPrimaryColor))),
                                child: Center(child: Text('Update Delivery'))),
                          ],
                        ),
                      );
                    }),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.05),
                  child: Text(
                    "Pending Orders",
                    style: TextStyle(
                      color: pickerPrimaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      //  decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                Divider(
                  color: pickerPrimaryColor,
                  endIndent: size.width * 0.33,
                  indent: size.width * 0.33,
                  thickness: 1,
                ),
                ListView.builder(
                    itemCount: 2,
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder:
                                  (context) =>  OrderDetailsScreen(),
                              ));
                        },
                        child: Container(
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
                                decoration: ShapeDecoration(
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2.0),
                                        side: BorderSide(
                                            width: 2, color: pickerPrimaryColor))),
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
                                          child: Text('Order No : '),
                                        ),

                                        Container(
                                          margin: EdgeInsets.only(
                                              right: size.width * 0.03),
                                          child: Text('No of Items :'),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: size.width * 0.03),
                                          child: Text('Order Date :'),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: size.width * 0.03),
                                          child: Text('Delivery Date :'),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: size.width * 0.03),
                                          child: Text('Current Status : Pending'),
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
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
      ),
    );
  }
}
