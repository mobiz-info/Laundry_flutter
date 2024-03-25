import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ServiceNewOrder_Screen.dart';
import 'Service_new_order.dart';
import 'Service_staff_dashboard_75.dart';

class ServiceNewOrder extends StatefulWidget {
  const ServiceNewOrder({Key? key}) : super(key: key);

  @override
  State<ServiceNewOrder> createState() => _ServiceNewOrderState();
}

class _ServiceNewOrderState extends State<ServiceNewOrder> {
  String? selectedStaff;
  String? selectedMode;

  List<String> staffNames = ['Staff 1', 'Staff 2', 'Staff 3'];
  List<String> modeOptions = ['Urgent', 'Normal', 'Express'];

  String selectedOption = '';
  bool expressSelected = false;
  bool normalSelected = false;
  String Time = 'Select Time';
  List<String> Timerange = [
    'Select Time',
    '09:00am to 11:00am',
    '11:00am to 01:00pm',
    '01:00pm to 03:00pm',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurple, size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(
            child: Text("NEW ORDER",
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 18,
                    fontWeight: FontWeight.w500))),
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
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Mobile Number/Customer ID",
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none,
                    suffixIcon: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(onPressed: () {
                _showDropdownDialog();
              },
                child: Text('New Pickup',style: TextStyle(color: Colors.white),),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
              ),
            ),
            SizedBox(height: 30,),
            SizedBox(
              width: 150,
              child: ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceNewOrderscreen(),));
              },
                child: Text('Collect Items',style: TextStyle(color: Colors.white),),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDropdownDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: Colors.white,
          title: Text('Select Options'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Select Staff'),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.deepPurple)),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(border: InputBorder.none,contentPadding: EdgeInsets.only(left: 10)),
                  value: selectedStaff,
                  onChanged: (newValue) {
                    setState(() {
                      selectedStaff = newValue;
                    });
                  },
                  items: staffNames.map((staffName) {
                    return DropdownMenuItem<String>(
                      value: staffName,
                      child: Text(staffName),
                    );
                  }).toList(),
                  hint: Text(staffNames[0]),
                ),
              ),
              SizedBox(height: 20),
              Text('Select Mode'),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.deepPurple)),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(border: InputBorder.none,contentPadding: EdgeInsets.only(left: 10)),
                  value: selectedMode,
                  onChanged: (newValue) {
                    setState(() {
                      selectedMode = newValue;
                    });
                  },
                  items: modeOptions.map((mode) {
                    return DropdownMenuItem<String>(
                      value: mode,
                      child: Text(mode),
                    );
                  }).toList(),
                  hint: Text(modeOptions[0]),
                ),
              ),
              SizedBox(height: 20),
              Text('Picking Time'),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.deepPurple)),
                child: DropdownButtonFormField(
                    validator: (d) {
                      if (d!.contains('Select Your Time')) {
                        return 'Select Your Time';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border:
                      OutlineInputBorder(borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.only(),
                      prefix: SizedBox(
                        width: 10,
                      ),
                      hintText: 'Select Your TIme',
                    ),
                    value: Time,
                    items: Timerange
                        .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                        .toList(),
                    onChanged: (v) {
                      setState(() {
                        Time = v!;
                      });
                    }),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Perform any action on the selected options if needed
                Navigator.of(context).pop();
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}
