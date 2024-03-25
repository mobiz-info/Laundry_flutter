import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Pricing.dart';

class Itemdetails extends StatefulWidget {
  const Itemdetails({Key? key}) : super(key: key);

  @override
  _ItemdetailsState createState() => _ItemdetailsState();
}

class _ItemdetailsState extends State<Itemdetails> {
  Color color = Color(0xff0d2bd4);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CupertinoColors.white,
          leading: Icon(
            Icons.menu,
            color: Colors.blue[800],
            size: 30,
          ),
          actions: [
            Row(
              children: [
                Icon(
                  Icons.circle_outlined,
                  color: Colors.blue[800],
                ),
                SizedBox(width: 10,)
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Center(
              child: Text(
                "ITEM DETAILS",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800]),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                elevation: 10,
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text("Order No"),
                            SizedBox(width: 26),
                            Text(":"),
                            SizedBox(width: 15),
                            Text("12xx")
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text("Date"),
                            SizedBox(width: 53),
                            Text(":"),
                            SizedBox(width: 15),
                            Text("20-04-2023")

                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text("Status"),
                            SizedBox(width: 42),
                            Text(":"),
                            SizedBox(width: 15),
                            Text("Completed")
                          ],
                        ),SizedBox(height: 10),
                        Row(
                          children: [
                            Text("Order Type"),
                            SizedBox(width: 15),
                            Text(":"),
                            SizedBox(width: 15),
                            Text("Express")
                          ],
                        ),

                        SizedBox(
                          height: 40,
                        ),Text("PRESS & FOLD"),
                        SizedBox(height: 30,),
                        Center(child: Text("Shirts - 2")),
                        Center(child: Text("Pant - 1"))
                        ,SizedBox(
                          height: 30,
                        ),Text("PRESS & HANG"),
                        SizedBox(height: 10,),
                        Center(child: Text("Shirts - 2")),
                        Center(child: Text("Pant - 4")),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          ]),
        ));
  }
}
