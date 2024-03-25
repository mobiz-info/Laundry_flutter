import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus({Key? key}) : super(key: key);

  @override
  _OrderStatusState createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {




  Color color = Color(0xff0d2bd4);
  String? selectedOption;
  int allradionutton = 0;

  bool isButtonVisible = false;
  int selectedRowIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("ORDER STATUS",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.refresh_outlined,
              color: Colors.blue,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue)),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'Mobile No/Order No',
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),SizedBox(
                height: 20,
              ),
              ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),onPressed: () {

              }, child: Text("View Items",style: TextStyle(color: Colors.white),)),
SizedBox(
  height: 20,
),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(elevation: 2,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row (
                          children: [
                            SizedBox(height: 20,),
                            Text("Order Date :"),SizedBox(width: 100,),Text("Order No :"),
                          ],
                        ),SizedBox(height: 20,),
                        Text("Invoice No :"),
                        SizedBox(height: 20,),
                        Row (
                          children: [
                            Text("Amount :"),SizedBox(width: 120,),Text("No of Items :"),
                          ],
                        ),SizedBox(height: 20,),
                        Row (
                          children: [
                            Text("Paid :"),SizedBox(width: 144,),Text("Balance :"),
                          ],
                        ),SizedBox(
                          height: 20,
                        ),
                        Text("Status : Delivered"),SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
              ),SizedBox(
                height: 30,
              ),

            ]),
      ),
    );
  }
}
