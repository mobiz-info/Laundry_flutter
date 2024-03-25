import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Orderstatus extends StatefulWidget {
  const Orderstatus({Key? key}) : super(key: key);

  @override
  _OrderstatusState createState() => _OrderstatusState();
}

class _OrderstatusState extends State<Orderstatus> {

  int _selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurple,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("ORDER STATUS",style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.w500,))),
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
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 0,
                  activeColor: Colors.deepPurple,
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
                Text('Mobile No'),
                SizedBox(width: 24.0),
                Radio(
                  value: 1,
                  activeColor: Colors.deepPurple,
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
                Text('Order No'),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height: MediaQuery.of(context).size.height / 20,
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(border: Border.all(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10,top: 5),
                  border: InputBorder.none,
                  suffixIcon: Container(decoration: BoxDecoration(color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20))),
                      child: Icon(Icons.search)),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Card(
                      surfaceTintColor: Colors.white,
                      elevation: 2,
                      color: Colors.white,
                      child: Column(children: [
                        SizedBox(
                          height: 70,
                          width: MediaQuery.of(context).size.width*2.2,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15,bottom: 10),
                                child: Row(children: [
                                  Container(
                                    width: 60,
                                      alignment: Alignment.center,
                                      child: Text("Sl.No", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                                  Expanded(child: Container(
                                      alignment: Alignment.center,
                                      child: Text("Customer Name", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))),
                                  Expanded(child: Container(
                                      alignment: Alignment.center,
                                      child: Text("Order Type", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))),
                                  Expanded(child: Container(
                                      alignment: Alignment.center,
                                      child: Text("Area", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))),
                                  Expanded(child: Container(
                                      alignment: Alignment.center,
                                      child: Text("Location", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))),
                                  Container(
                                    width: 60,
                                      alignment: Alignment.center,
                                      child: Text("Order No", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                                  Expanded(child: Container(
                                      alignment: Alignment.center,
                                      child: Text("Order Date", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))),
                                  Expanded(child: Container(
                                      alignment: Alignment.center,
                                      child: Text("Status", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))),
                                  Expanded(child: Container(
                                      alignment: Alignment.center,
                                      child: Text("", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))),
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Container(
                                    height: 0.5,
                                    width: MediaQuery.of(context).size.width*2.2,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.7,
                          width: MediaQuery.of(context).size.width*2.2,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: const ClampingScrollPhysics(),
                              itemCount: 20,
                              itemBuilder: (BuildContext context,int rowIndex){
                                return  Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width*2.2,
                                    child: Row(children: [
                                      Container(
                                        width: 60,
                                          alignment: Alignment.center,
                                          child: Text("1", style: TextStyle(color: Colors.black),)),
                                      Expanded(child: Container(
                                          alignment: Alignment.center,
                                          child: Text("Aswin", style: TextStyle(color: Colors.black),))),
                                      Expanded(child: Container(
                                          alignment: Alignment.center,
                                          child: Text("Normal", style: TextStyle(color: Colors.black),))),
                                      Expanded(child: Container(
                                          alignment: Alignment.center,
                                          child: Text("Al Nadha", style: TextStyle(color: Colors.black),))),
                                      Expanded(child: Container(
                                          alignment: Alignment.center,
                                          child: Text("Doha Street", style: TextStyle(color: Colors.black),))),
                                      Container(
                                        width: 60,
                                          alignment: Alignment.center,
                                          child: Text("103", style: TextStyle(color: Colors.black),)),
                                      Expanded(child: Container(
                                          alignment: Alignment.center,
                                          child: Text("1/3/2023", style: TextStyle(color: Colors.black),))),
                                      Expanded(child: Container(
                                          alignment: Alignment.center,
                                          child: Text("Undelivered", style: TextStyle(color: Colors.black),))),
                                      Expanded(child: Container(
                                          alignment: Alignment.center,
                                          child:Container(
                                            height: 25,
                                            width: 55,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(10),
                                                color: Colors
                                                    .deepPurple),
                                            child: const Center(
                                                child: Text(
                                                  'Deliver',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10),
                                                )),
                                          ),)),
                                    ]));


                              }),)

                      ]),
                    ),
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
