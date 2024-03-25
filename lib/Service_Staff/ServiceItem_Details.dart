import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceItemdetails extends StatefulWidget {
  const ServiceItemdetails({Key? key}) : super(key: key);

  @override
  _ServiceItemdetailsState createState() => _ServiceItemdetailsState();
}

class _ServiceItemdetailsState extends State<ServiceItemdetails> {
  Color color = Color(0xff0d2bd4);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                elevation: 5,
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
        );
  }
}
