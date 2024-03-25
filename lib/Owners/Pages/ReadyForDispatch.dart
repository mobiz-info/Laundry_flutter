import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadyForDispatch extends StatefulWidget {
  const ReadyForDispatch({Key? key}) : super(key: key);

  @override
  State<ReadyForDispatch> createState() => _ReadyForDispatchState();
}

class _ReadyForDispatchState extends State<ReadyForDispatch> {
  String character = 'All' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("READY FOR DISPATCH",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500))),
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
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('Branch'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15,bottom: 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue)),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(bottom: 10),
                        prefix: SizedBox(
                          width: 10,
                        ),
                        hintText: 'Select',
                      ), items: [
                      DropdownMenuItem(child: Text('select'))
                    ],
                      onChanged: (value) {  },
                    ),
                  ),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: '',
                  groupValue: character,
                  onChanged: (value) {
                    setState(() {
                      character = value!;
                    });
                  },
                ),
                Text('All'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Card(
                elevation: 2,
                surfaceTintColor: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            child: Text(
                              "Sl No.",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        Container(
                            width: 65,
                            height: 40,
                            alignment: Alignment.center,
                            child: Text(
                              "Order No.",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        Expanded(
                          child: Container(
                              height: 40,
                              alignment: Alignment.center,
                              child: Text(
                                "Client",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              height: 40,
                              alignment: Alignment.center,
                              child: Text(
                                "Staff",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        Container(
                            width: 70,
                            height: 40,
                            alignment: Alignment.center,
                            child: Text(
                              "Order Type",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        Container(
                            width: 30,
                            height: 40,
                            alignment: Alignment.center,
                            child: Text(
                              "Inv",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        Container(
                            width: 50,
                            height: 40,
                            alignment: Alignment.center,
                            child: Text(
                              "Inv Amt",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 0.5,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.68,
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                    height: 40,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "1",
                                    )),
                                Container(
                                    width: 65,
                                    height: 40,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "10",
                                    )),
                                Expanded(
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Text('Noor')
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Text('Abdu')
                                  ),
                                ),
                                Container(
                                    width: 70,
                                    height: 40,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Normal",
                                    )),
                                Container(
                                    width: 30,
                                    height: 40,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "10",
                                    )),
                                Container(
                                    width: 50,
                                    height: 40,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "10",
                                    )),
                              ],
                            );
                        },),
                    )
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
