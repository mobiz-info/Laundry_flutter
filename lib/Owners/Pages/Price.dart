import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Price extends StatefulWidget {
  const Price({Key? key}) : super(key: key);

  @override
  State<Price> createState() => _PriceState();
}

class _PriceState extends State<Price> {
  bool isExpanded = false;
  String selectedOption='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("PRICE GROUP",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500))),
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
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue[700])),
                onPressed: () {

                },
                child: Text('Create New',style: TextStyle(color: Colors.white),),
              ),
            ),
            SizedBox(height: 15,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text('New Group Name'),
                ),
                Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(),
                        border: OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<String>(
                  value: 'Personal',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
                Text('Personal'),
                Radio<String>(
                  value: 'Corporate',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
                Text('Corporate'),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<String>(
                  value: 'Normal',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text('Normal'),
                ),
                Radio<String>(
                  value: 'Express',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text('Express'),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20,top: 30),
                  child: Text('Select'),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blue)),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(),
                            border: OutlineInputBorder(borderSide: BorderSide.none),
                            prefix: SizedBox(
                              width: 10,
                            ),
                            hintText: 'Category',
                          ), items: [
                          DropdownMenuItem(child: Text('Category'))
                        ],
                          onChanged: (value) {  },
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue)),
                      child: Center(child: Text('Press & Fold')),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue)),
                      child: Center(child: Text('Press & Hang')),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Card( elevation: 2,
                surfaceTintColor: Colors.white,
                child: SizedBox(
                  child: Column(
                    children: [
                      SizedBox(
                          height: 40,
                          child: Row(children: [
                            Container(
                              width: 60,
                                alignment: Alignment.center,
                                child: Text(
                                  "Sl. No",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                            Container(
                              width: 120,
                                alignment: Alignment.center,
                                child: Text(
                                  "Item Type",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                            Expanded(
                                child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Direct",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))),
                            Container(
                              width: 110,
                                alignment: Alignment.center,
                                child: Text(
                                  "Contactless",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                          ])),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 0.5,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                          height: MediaQuery.of(context).size.height*0.5,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Row(children: [
                                  SizedBox(
                                    height: 40,
                                    width: 60,
                                      child: Center(
                                        child: Center(
                                          child: Text(
                                            "1",
                                            style: TextStyle(
                                                color: Colors
                                                    .black),
                                          ),
                                        ),
                                      )),
                                  SizedBox(
                                    height: 40,
                                    width: 120,
                                      child: Center(
                                        child: Text(
                                          "Pants",
                                          style: TextStyle(
                                              color: Colors
                                                  .black),
                                        ),
                                      )),
                                  Expanded(
                                      child: SizedBox(
                                        height: 40,
                                        child: Center(child: Text('400')),
                                          )),
                                  SizedBox(
                                    height: 40,
                                    width: 110,
                                      child: Center(child: Text('500')),
                                      ),
                                ]);
                              })),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40,bottom: 15),
                child: Text('For Credit Party',
                  style: TextStyle(
                      fontSize: 18,
                  ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue)),
                    child: Center(child: Text('No. of Days')),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue)),
                    child: Center(child: Text('')),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue)),
                    child: Center(child: Text('Credit Limit')),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue)),
                    child: Center(child: Text('')),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue)),
                    child: Center(child: Text('No. of Unpaid Invoice')),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue)),
                    child: Center(child: Text('')),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue[700])),
                  onPressed: () {

                  },
                  child: Text('SAVE',style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
