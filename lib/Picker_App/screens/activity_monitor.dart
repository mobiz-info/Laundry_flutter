import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../src/dimen.dart';
import '../util/appBar.dart';

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  String Bank = 'Select Your Bank';
  List<String> elements = ['Select Your Bank','State Bank of India','Federal Bank','Canara Bank','Punjab National Bank',];
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
        child: Appbar(text: 'Activity Monitor'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Date : ', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Default(Today)'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 15),
              child: Container(
                height: 1,
                width: 150,
                decoration: BoxDecoration(color: pickerPrimaryColor),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                itemCount: 9,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text('6.40 Pm :'),
                    title: Text('Order No : 74 Completed Ready for despatch'),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    width: size.width * 0.45,
                    height: size.height * 0.08,
                    decoration: BoxDecoration(
                        color: pickerPrimaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text('15 New',
                            style:
                                TextStyle(fontSize: 15, color: Colors.white))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    width: size.width * 0.45,
                    height: size.height * 0.08,
                    decoration: BoxDecoration(
                      color: pickerPrimaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: Text('8 Pending',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white))),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin:  EdgeInsets.only(top: size.height * 0.05),
                  child: Container(
                    width: size.width * 0.45,
                    height: size.height * 0.08,
                    decoration: BoxDecoration(
                        color: pickerPrimaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('20',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                        Text('Ready for Delivery',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ],
                    )),
                  ),
                ),
                Container(
                  margin:  EdgeInsets.only(top: size.height * 0.05),
                  child: Container(
                    width: size.width * 0.45,
                    height: size.height * 0.08,
                    decoration: BoxDecoration(
                      color: pickerPrimaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: Text('25 Delivered',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white))),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Container(
                alignment: Alignment.center,
                width: size.width * 0.45,
                height: size.height * 0.08,
                decoration: BoxDecoration(
                  color: pickerPrimaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text('2000',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 18, color: Colors.white))),
                    Center(
                        child: Text('Total Collection',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
