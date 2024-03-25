import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Invoice extends StatefulWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  int selectedRowIndex = -1;

  List<int> selectedRows = [];

  void toggleRowSelection(int index) {
    setState(() {
      if (selectedRows.contains(index)) {
        selectedRows.remove(index);
      } else {
        selectedRows.add(index);
      }
    });
  }


  void selectRow(int index) {
    setState(() {
      selectedRowIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("OUTSTANDING",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500))),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Current Outstanding',style: TextStyle(fontSize: 16),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20),
                        child: Container(
                          width: 50,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: Colors.blue)),
                          child: Center(child: Text('20')),
                        ),
                      ),
                      Stack(
                        children: [
                          Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Icon(CupertinoIcons.chevron_down,color: Colors.blue[900],),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Icon(CupertinoIcons.chevron_down,color: Colors.blue),
                      )
    ]
    ),
                    ],
                  ),
                ),
               /* ElevatedButton(onPressed: () {
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => Wallet(),));
                },
                    child: Text('Pay Now',style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent[700])),
                ),*/
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.64,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  final isSelected = selectedRows.contains(index);
                  return
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.blue,
                        ),
                      ),
                      InkWell(onTap: () {
                        toggleRowSelection(index);
                      },
                        child: Container(
                          color: isSelected ? Colors.grey : null,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text('Order No : '),
                                          Text('100'),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text('Order Date : '),
                                          Text('16/06/2023'),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text('Amount : '),
                                          Text('100'),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text('Balance : '),
                                          Text('20'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8, bottom: 8, top: 12),
                                      child: Row(
                                        children: [
                                          Text('Inv No : '),
                                          Text('123'),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text('Inv Date : '),
                                          Text('16/06/2023'),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text('Unpaid'),
                                        ],
                                      ),
                                    ),
                                    /*ElevatedButton(onPressed: () {
                                     // Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(),));
                                    },
                                      child: Text('Pay Now',
                                        style: TextStyle(color: Colors.white),),
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(
                                              Colors.redAccent[700])),
                                    ),*/
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
