import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceComplaint extends StatefulWidget {
  const ServiceComplaint({Key? key}) : super(key: key);

  @override
  State<ServiceComplaint> createState() => _ServiceComplaintState();
}

class _ServiceComplaintState extends State<ServiceComplaint> {

  bool isVisible = false;
  int selectedRowIndex = -1;

  void toggleButtonVisibility() {
    setState(() {
      isVisible = true;
    });
  }

  void selectRow(int index) {
    setState(() {
      selectedRowIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurple,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("COMPLAINT",style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.w500))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.refresh_outlined,
              color: Colors.deepPurple,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 10),
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
                onPressed: () {
                },
                child: Text('NEW',style: TextStyle(color: Colors.white),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Card(
                surfaceTintColor: Colors.white,
                elevation: 2,
                child: Column(children: [
                        SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            child: Row(children: [
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Date",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ))),
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Com. No",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ))),
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Type",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ))),
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Status",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ))),
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Remark",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ))),
                            ])),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            color: Colors.deepPurple,
                            height: 0.5,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                        SizedBox(
                          height: size.height*0.6,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                              padding: EdgeInsets.zero,
                              itemCount: 20,
                              itemBuilder: (BuildContext context, int rowIndex) {
                                return SizedBox(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width,
                                    child: GestureDetector(
                                      onTap: () {
                                        toggleButtonVisibility();
                                        selectRow(rowIndex);
                                      },
                                      child: Container(
                                                height: 40,
                                                width: MediaQuery.of(context).size.width,
                                                color: selectedRowIndex == rowIndex ? Colors.grey : null,
                                                child: Row(children: [
                                                  Expanded(
                                                      child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "1-2-2023",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ))),
                                                  Expanded(
                                                      child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "102",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ))),
                                                  Expanded(
                                                      child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "Damaged",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ))),
                                                  Expanded(
                                                      child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "Pending",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ))),
                                                  Expanded(
                                                      child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ))),
                                                ]))
                                    ));
                              }),
                        )
                      ])
              ),
            ),
            if(isVisible)
            SizedBox(
              child: Column(
                children: [
                  Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Icon(CupertinoIcons.chevron_down,color: Colors.deepPurple[900],),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Icon(CupertinoIcons.chevron_down,color: Colors.deepPurple),
                        )
                      ]
                  ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,bottom: 15),
                        child: Text('Complaint No : 102',style: TextStyle(fontSize: 16),),
                      ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,bottom: 15),
                    child: Text('Complaint Date : 1-2-2023',style: TextStyle(fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,bottom: 15),
                    child: Text('Order No : 50',style: TextStyle(fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,bottom: 15),
                    child: Text('Complaint Type : Damaged',style: TextStyle(fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,bottom: 30),
                    child: Text('Status : Resolved/Pending',style: TextStyle(fontSize: 16)),
                  ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20,bottom: 10),
                  child: Text('Reply from Company',style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('We recieved Your Complaint, It will be Resolved Soon'),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'My Remark',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue[900]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurple[700])),
                      onPressed: () {},
                      child: Text('REPLY',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurple[700])),
                      onPressed: () {},
                      child: Text('BACK',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
