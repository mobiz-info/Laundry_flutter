import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RevenueReport extends StatefulWidget {
  const RevenueReport({Key? key}) : super(key: key);

  @override
  State<RevenueReport> createState() => _RevenueReportState();
}

class _RevenueReportState extends State<RevenueReport> {
  TextEditingController From = TextEditingController(text: DateFormat('dd-MM-yyyy').format(DateTime.now()));
  TextEditingController To = TextEditingController();
  String character = 'All' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("REVENUE REPORT",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500))),
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
              padding: const EdgeInsets.all(10),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,bottom: 5),
                        child: Text('From'),
                      ),
                      Container(
                        height: 40,
                        width: 135,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blue)),
                        child: TextFormField(
                          style: TextStyle(fontSize: 14),
                          controller: From,
                          onTap: () async {

                            FocusScope.of(context).requestFocus(FocusNode());
                            var pickedDate = await showDatePicker(
                                builder: (context, child) {
                                  return Theme(
                                      data: ThemeData().copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: Colors.blue,
                                          onPrimary: Colors.white,
                                          surface: Colors.blue,
                                          onSurface: Colors.black,
                                        ),
                                        dialogBackgroundColor:Colors.blueGrey.shade50,
                                      ), child: child!);

                                },
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000,01,01),
                                lastDate: DateTime(2050,12,31));
                            From.text = DateFormat('dd-MM-yyyy').format(pickedDate!);
                          }, decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(CupertinoIcons.calendar,color: Colors.blue,),
                          contentPadding: EdgeInsets.only(top: 1),
                        ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20,),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,bottom: 5),
                        child: Text('To'),
                      ),
                      Container(
                        height: 40,
                        width: 135,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blue)),
                        child: TextFormField(
                          style: TextStyle(fontSize: 14),
                          controller: To,
                          onTap: () async {

                            FocusScope.of(context).requestFocus(FocusNode());
                            var pickedDate = await showDatePicker(
                                builder: (context, child) {
                                  return Theme(
                                      data: ThemeData().copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: Colors.blue,
                                          onPrimary: Colors.white,
                                          surface: Colors.blue,
                                          onSurface: Colors.black,
                                        ),
                                        dialogBackgroundColor:Colors.blueGrey.shade50,
                                      ), child: child!);

                                },
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000,01,01),
                                lastDate: DateTime(2050,12,31));
                            To.text = DateFormat('dd-MM-yyyy').format(pickedDate!);
                          }, decoration: InputDecoration(
                          hintText: 'Select date',
                          border: InputBorder.none,
                          prefixIcon: Icon(CupertinoIcons.calendar,color: Colors.blue,),
                          contentPadding: EdgeInsets.only(top: 1),
                        ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                elevation: 2,
                surfaceTintColor: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              height: 40,
                              alignment: Alignment.center,
                              child: Text(
                                "Particular",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        Container(
                          width: 80,
                            height: 40,
                            alignment: Alignment.center,
                            child: Text(
                              "Today",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        Container(
                            width: 80,
                            height: 40,
                            alignment: Alignment.center,
                            child: Text(
                              "Month",
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
                      height: MediaQuery.of(context).size.height*0.5,
                      child: ListView.builder(
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Orders",
                                      )),
                                ),
                                Container(
                                  width: 80,
                                    height: 40,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "10",
                                    )),
                                Container(
                                    width: 80,
                                    height: 40,
                                    alignment: Alignment.center,
                                    child: Text('20')
                                ),
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
