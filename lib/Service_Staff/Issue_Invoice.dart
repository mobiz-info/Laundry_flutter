import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IssueInvoice extends StatefulWidget {
  const IssueInvoice({Key? key}) : super(key: key);

  @override
  State<IssueInvoice> createState() => _IssueInvoiceState();
}

class _IssueInvoiceState extends State<IssueInvoice> {

  bool isButtonVisible = false;
  int selectedRowIndex = -1;

  void selectRow(int index) {
    setState(() {
      selectedRowIndex = index;
    });
  }


  void toggleButtonVisibility() {
    setState(() {
      isButtonVisible = !isButtonVisible;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurple,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("ISSUE INVOICE",style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.w500,))),
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
            const SizedBox(height:  20,),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Column(children: [
                              SizedBox(
                                  height: 100,
                                width: MediaQuery.of(context).size.width/0.9,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15,bottom: 10),
                                        child: Row(children: [
                                          Expanded(child: Container(
                                              alignment: Alignment.center,
                                              child: Text("Sl.No", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))),
                                          Expanded(child: Container(
                                              alignment: Alignment.center,
                                              child: Text("Order No", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))),
                                          Expanded(child: Container(
                                              alignment: Alignment.center,
                                              child: Text("Order Type", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))),
                                          Expanded(child: Container(
                                              alignment: Alignment.center,
                                              child: Text("Staff", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))),
                                          Expanded(child: Container(
                                              alignment: Alignment.center,
                                              child: Text("Delivery Type", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))),
                                          Expanded(child: Container(
                                              alignment: Alignment.center,
                                              child: Text("No. Of Items", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))),
                                        ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Container(
                                            height: 0.5,
                                            width: MediaQuery.of(context).size.width/0.9,
                                            color: Colors.deepPurple,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              ),
                              SizedBox(
                                height: 200,
                                width: MediaQuery.of(context).size.width/0.9,
                                child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    physics: const ClampingScrollPhysics(),
                                    itemCount: 10,
                                    itemBuilder: (BuildContext context,int rowIndex){
                                      return  SizedBox(
                                          height: 40,
                                          width: MediaQuery.of(context).size.width/0.9,
                                          child:GestureDetector(
                                            onTap: () {
                                              toggleButtonVisibility();
                                              selectRow(rowIndex);
                                            },
                                            child:
                                            Container(
                                                      height: 40,
                                                      width: MediaQuery.of(context).size.width/0.9,
                                                      color: selectedRowIndex == rowIndex ? Colors.grey : null,
                                                      child: Row(children: [
                                                        Expanded(child: Container(
                                                            alignment: Alignment.center,
                                                            child: Text("1", style: TextStyle(color: Colors.black),))),
                                                        Expanded(child: Container(
                                                            alignment: Alignment.center,
                                                            child: Text("102", style: TextStyle(color: Colors.black),))),
                                                        Expanded(child: Container(
                                                            alignment: Alignment.center,
                                                            child: Text("Normal", style: TextStyle(color: Colors.black),))),
                                                        Expanded(child: Container(
                                                            alignment: Alignment.center,
                                                            child: Text("Aswin", style: TextStyle(color: Colors.black),))),
                                                        Expanded(child: Container(
                                                            alignment: Alignment.center,
                                                            child: Text("Normal", style: TextStyle(color: Colors.black),))),
                                                        Expanded(child: Container(
                                                            alignment: Alignment.center,
                                                            child: Text("103", style: TextStyle(color: Colors.black),))),
                                                      ])),
                                          ));


                                    }),)

                            ]),
                    ),
                  ],
                ),
              ),
            ),
            if(isButtonVisible)
              Padding(
                padding: const EdgeInsets.all(50),
                child: InkWell(onTap: () {},
                  child: Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple),
                    child: const Center(
                        child: Text('Generate',
                          style: TextStyle(
                              color: Colors.white, fontSize: 12),)),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
