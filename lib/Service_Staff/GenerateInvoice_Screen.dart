import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Service_Staff/ServiceReciept_Screen.dart';

class GenarateInvoice extends StatefulWidget {
  const GenarateInvoice({Key? key}) : super(key: key);

  @override
  State<GenarateInvoice> createState() => _GenarateInvoiceState();
}

class _GenarateInvoiceState extends State<GenarateInvoice> {
  String selectedOption='cash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurple,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("PAYMENT",style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.w500,))),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                surfaceTintColor: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text('CUSTOMER DETAILS',
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name'),
                              Text('Address'),
                              Text('Location'),
                              Text('Area'),
                              Text('Phone No.'),
                            ],
                          ),
                          SizedBox(width: 30,),
                          Column(
                            children: [
                              Text(':'),
                              Text(':'),
                              Text(':'),
                              Text(':'),
                              Text(':'),
                            ],
                          ),
                          SizedBox(width: 30,),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Aswin'),
                              Text('xxxxx'),
                              Text('Al Nadha'),
                              Text('Doha Street'),
                              Text('xxxxxxxxxx'),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                surfaceTintColor: Colors.white,
                child: Column(children: [
                  Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('ORDER DETAILS', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Serial No.'),
                            Text('Item Name'),
                            Text('Mode'),
                            Text('Quantity'),
                            Text('Rate'),
                            Text('Total'),
                            Text('Discount'),
                            Text('Taxable Amount'),
                            Text('V A T'),
                            Text('Grand Total'),
                          ],
                        ),
                        SizedBox(width: 30,),
                        Column(
                          children: [
                            Text(':'),
                            Text(':'),
                            Text(':'),
                            Text(':'),
                            Text(':'),
                            Text(':'),
                            Text(':'),
                            Text(':'),
                            Text(':'),
                            Text(':'),
                          ],
                        ),
                        SizedBox(width: 30,),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('123'),
                            Text('Pants'),
                            Text('Normal'),
                            Text('5'),
                            Text('10'),
                            Text('50'),
                            Text('xx'),
                            Text('xx'),
                            Text('xx'),
                            Text('50'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceReciept(),));
                  },
                    child: Text('Genarate Invoice',style: TextStyle(color: Colors.white),),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],),
              ),
            )
          ],
        ),
      ),
    );
  }
}
