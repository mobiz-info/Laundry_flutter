import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Complaint.dart';

class NewOrder extends StatefulWidget {
  const NewOrder({Key? key}) : super(key: key);

  @override
  State<NewOrder> createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  TextEditingController Date = TextEditingController(text: DateFormat('dd-MM-yyyy').format(DateTime.now()));
  String character = 'All' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("NEW ORDER",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500))),
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
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.blue)),
                  child:
                  TextFormField(
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(1.5),
                        child: Container(
                            width: 35,
                            decoration: BoxDecoration(color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30))
                            ),
                            child: Icon(CupertinoIcons.search)),
                      ),
                      contentPadding: EdgeInsets.only(bottom: 12),
                      border: InputBorder.none,
                      hintText: 'Mobile No.',
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text('Search Result'),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Customer Name'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Customer Id'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Address/Flat No.'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Mobile No.'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Whatsapp'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Alternate No.'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Email Id.'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Staff Assigned'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Area'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Laundry'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(':'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(':'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(':'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(':'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(':'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(':'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(':'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(':'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(':'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(':'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: () {
                      },
                      child: Text('Edit',style: TextStyle(color: Colors.white),)),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: () {
                       // Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNewOrder(),));
                      },
                      child: Text('New Order',style: TextStyle(color: Colors.white),)),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Complaint(),));
                      },
                      child: Text('Complaint',style: TextStyle(color: Colors.white),)),
                ],
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
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('Branch'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15,bottom: 15),
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue)),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.only(),
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
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text('Staff Assigned'),
                  ),
                  Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(5)),
                    child: Center(child: Text('Default')),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                      Text('Normal'),
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
                      Text('Express'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text('Date : '),
                  ),
                  Container(
                    height: 40,
                    width: 135,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue)),
                    child: TextFormField(
                      style: TextStyle(fontSize: 14),
                      controller: Date,
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
                        Date.text = DateFormat('dd-MM-yyyy').format(pickedDate!);
                      }, decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(CupertinoIcons.calendar,color: Colors.blue,),
                      contentPadding: EdgeInsets.only(top: 1),
                    ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text('Picking Time : '),
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(child: Text('Select')),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                    },
                    child: Text('Save',style: TextStyle(color: Colors.white),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
