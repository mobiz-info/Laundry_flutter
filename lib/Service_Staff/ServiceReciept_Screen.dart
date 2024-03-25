import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceReciept extends StatefulWidget {
  const ServiceReciept({Key? key}) : super(key: key);

  @override
  State<ServiceReciept> createState() => _ServiceRecieptState();
}

class _ServiceRecieptState extends State<ServiceReciept> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurple,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("RECEIPT",style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.w500,))),
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
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 30,
                    child: Text('LOGO'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('COMPANY NAME',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('No : '),
                  Text('Date : ')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Received sum of Amount (Currencey) : '),
                  Container(
                    height: 30,
                    width: 60,
                    child: Center(child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('100'),
                    )),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Text('Towards Laundry Services',style: TextStyle(fontSize: 18),),
            )
          ],
        ),
      ),
    );
  }
}
