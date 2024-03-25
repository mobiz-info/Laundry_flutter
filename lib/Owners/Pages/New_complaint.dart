import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewComplaint extends StatefulWidget {
  const NewComplaint({Key? key}) : super(key: key);

  @override
  State<NewComplaint> createState() => _NewComplaintState();
}

class _NewComplaintState extends State<NewComplaint> {
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.red;
    }
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("NEW COMPLAINT",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500))),
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
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Card(elevation: 2,
                surfaceTintColor: Colors.white,
                child: SizedBox(
                    height: MediaQuery.of(context).size.height*0.5,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        itemCount: 1,
                        padding: EdgeInsets.zero,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(children: [
                            SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                child: Row(children: [
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Sl. No",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ))),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Order. No",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ))),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Order",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ))),
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
                                            "Select",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ))),
                                ])),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                color: Colors.blue,
                                height: 0.5,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.4,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  physics: const ClampingScrollPhysics(),
                                  itemCount: 2,
                                  itemBuilder: (BuildContext context, int rowIndex) {
                                    return SizedBox(
                                        height: 40,
                                        width: MediaQuery.of(context).size.width,
                                        child: ListView.builder(
                                            itemCount: 1,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                  height: 40,
                                                  width: MediaQuery.of(context).size.width,
                                                  child: Row(children: [
                                                    Expanded(
                                                        child: Container(
                                                            alignment:
                                                            Alignment.center,
                                                            child: Text(
                                                              "1",
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
                                                              "Normal",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ))),
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
                                                            child: Checkbox(
                                                              checkColor: Colors.white,
                                                              fillColor: MaterialStateProperty.resolveWith(getColor),
                                                              value: isChecked,
                                                              onChanged: (bool? value) {
                                                                setState(() {
                                                                  isChecked = value!;
                                                                });
                                                              },
                                                            ))),
                                                  ]));
                                            }));
                                  }),
                            ),
                          ]);
                        })),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text('Complaint Type'),
                  ),
                  Container(
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 60,child: Text('Remark')),
                  Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue[700])),
                onPressed: () {
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => Expense(),));
                },
                child: Text('SAVE',style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
