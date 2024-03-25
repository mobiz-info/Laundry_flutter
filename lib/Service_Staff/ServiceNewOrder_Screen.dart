import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'ReadyForDelivery.dart';

class ServiceNewOrderScreen extends StatefulWidget {

  @override
  State<ServiceNewOrderScreen> createState() => _ServiceNewOrderScreenState();
}

class _ServiceNewOrderScreenState extends State<ServiceNewOrderScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurple,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("NEW ORDER",style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.w500,))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.refresh_outlined,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                surfaceTintColor: Colors.white,
                elevation: 2,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width + 200,
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width + 200,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        child: Center(
                                            child: Text('J.No',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold))),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: SizedBox(
                                        child: Center(
                                            child: Text('Order No',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold))),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: SizedBox(
                                        child: Center(
                                            child: Text('Customer Name',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold))),
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    Expanded(
                                      flex: 2,
                                      child: SizedBox(
                                        child: Center(
                                            child: Text('Staff Name',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold))),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: SizedBox(
                                        child: Center(
                                            child: Text('Delivery Time',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold))),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    height: 0.5,
                                    width: MediaQuery.of(context).size.width + 200,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                                // Add the ListView inside a SizedBox with a specific height
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.7,
                                  child: ListView.builder(
                                    itemCount: 20,
                                    itemBuilder: (context, index) {
                                      Color rowColor;
                                      if (index % 3 == 0) {
                                        // Set the color of every third row to orange
                                        rowColor = Colors.orange;
                                      } else if (index % 3 == 1) {
                                        // Set the color of every third row to yellow
                                        rowColor = Colors.yellow;
                                      } else {
                                        // Set the color of every third row to white
                                        rowColor = Colors.white;
                                      }

                                      return Container(
                                        color: rowColor, // Apply the color to the row container
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: SizedBox(
                                                child: Center(
                                                  child: Text("1"),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: SizedBox(
                                                child: Center(
                                                  child: Text("1678"),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: SizedBox(
                                                child: Center(
                                                  child: Text("Abu"),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 5,),
                                            Expanded(
                                              flex: 2,
                                              child: SizedBox(
                                                child: Center(
                                                  child: Text("Noor"),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: SizedBox(
                                                height: 40,
                                                child: Center(
                                                  child: Text("5:00pm"),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Center(
                                                  child: ElevatedButton(onPressed: () {

                                                  },child:Text("Engage",style: TextStyle(color: Colors.white)) ,style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),)
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
