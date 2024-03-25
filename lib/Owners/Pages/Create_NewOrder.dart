import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Owners/Pages/New_Order.dart';

class CreateNewOrder extends StatefulWidget {
  const CreateNewOrder({Key? key}) : super(key: key);

  @override
  State<CreateNewOrder> createState() => _CreateNewOrderState();
}

class _CreateNewOrderState extends State<CreateNewOrder> {
  bool isExpanded = false;
  String character = 'All' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("CREATE NEW ORDE",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500))),
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
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    height: 30,
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
                          child: InkWell(
                            child: Container(
                                width: 35,
                                decoration: BoxDecoration(color: Colors.grey,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        bottomRight: Radius.circular(30))
                                ),
                                child: Icon(CupertinoIcons.search)),
                          ),
                        ),
                        contentPadding: EdgeInsets.only(bottom: 10),
                        border: InputBorder.none,
                        hintText: 'Mobile No.',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Search result for : xxxxxxxxxx'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NewOrder(),));
                      },
                      child: Text('New Order',style: TextStyle(color: Colors.white,fontSize: 12),)),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => Management(),));
                      },
                      child: Text('Edit Client',style: TextStyle(color: Colors.white,fontSize: 12),)),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: () {
                       // Navigator.push(context, MaterialPageRoute(builder: (context) => Delivered(),));
                      },
                      child: Text('Order Status',style: TextStyle(color: Colors.white,fontSize: 12),)),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: () {
                       // Navigator.push(context, MaterialPageRoute(builder: (context) => Assign(),));
                      },
                      child: Text('Availability',style: TextStyle(color: Colors.white,fontSize: 12),)),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: () {
                       // Navigator.push(context, MaterialPageRoute(builder: (context) => AssignStaff(),));
                      },
                      child: Text('Outstanding',style: TextStyle(color: Colors.white,fontSize: 12),)),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: () {
                        setState(() {
                          isExpanded = true;
                        });
                      },
                      child: Text('Complaint',style: TextStyle(color: Colors.white,fontSize: 12),)),
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if(isExpanded)
                Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: Stack(
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
                ),
              ],
            ),
            Stack(
              alignment: Alignment.topRight,
              children: [
                Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Client Name'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Client Id'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Address'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Area'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Location'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Staff in Charge'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Mobile No.'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Email Id'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Job Category'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Birthday'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('GPS Status'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Status'),
                        ),
                      ],
                    ),
                  ),
              Padding(
                padding: const EdgeInsets.only(top: 2),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 15,bottom: 5),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(''),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(''),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(''),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(''),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(''),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(''),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(''),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(''),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(''),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(''),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Uploaded/Not Uploaded'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Not on Vacation'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
                if(isExpanded)
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                          onPressed: () { },
                          child: Text('New',style: TextStyle(color: Colors.white,fontSize: 12),)),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                          onPressed: () { },
                          child: Text('Unresolved',style: TextStyle(color: Colors.white,fontSize: 12),)),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                          onPressed: () { },
                          child: Text('Complaints',style: TextStyle(color: Colors.white,fontSize: 12),)),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                          onPressed: () { },
                          child: Text('Cancel',style: TextStyle(color: Colors.white,fontSize: 12),)),
                    ],
                  ),
                )
              ]
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 115,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => NewOrder(),));
                    },
                    child: Text('New Order',style: TextStyle(color: Colors.white),)),
              ),
            ),
            Center(
              child: Text(
                'Order',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blue[900]),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text('Pick Time'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15,bottom: 15),
                  child: Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue)),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.only(bottom: 10),
                        prefix: SizedBox(
                          width: 10,
                        ),
                        hintText: 'Select Slot',
                      ), items: [
                      DropdownMenuItem(child: Text('select Slot'))
                    ],
                      onChanged: (value) {  },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 115,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                     // Navigator.push(context, MaterialPageRoute(builder: (context) => DispatchPending(),));
                    },
                    child: Text('Save',style: TextStyle(color: Colors.white),)),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('If that mobile No. is not fount then.'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Serach Result',style: TextStyle(fontSize: 20),),
                      Icon(Icons.broken_image_rounded),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Do you want to add customer?'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Go to Add new client page'),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                          onPressed: () { },
                          child: Text('Yes',style: TextStyle(color: Colors.white),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                          onPressed: () { },
                          child: Text('no',style: TextStyle(color: Colors.white),)),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
