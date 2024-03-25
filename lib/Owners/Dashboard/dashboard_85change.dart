import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Owners/Dashboard/pages2/21-06/Individual_items_116.dart';
import 'package:golden_falcon/Owners/Dashboard/pages2/21-06/Listall_117.dart';
import 'package:golden_falcon/Owners/Dashboard/pages2/21-06/Order_Statistics_120.dart';
import 'package:golden_falcon/Owners/Dashboard/pages2/21-06/Order_details_115.dart';
import 'package:golden_falcon/Owners/Dashboard/pages2/21-06/Order_status_121.dart';
import 'package:golden_falcon/Owners/Dashboard/pages2/21-06/Pending_Orders_118.dart';
import 'package:golden_falcon/Owners/Dashboard/pages2/22-06/Ageing_Report_129.dart';
import 'package:golden_falcon/Owners/Dashboard/pages2/22-06/Bags_125.dart';
import 'package:golden_falcon/Owners/Dashboard/pages2/22-06/Bags_Master_124.dart';
import 'package:golden_falcon/Owners/Dashboard/pages2/22-06/Outstanding%20127.dart';
import 'package:golden_falcon/Owners/Dashboard/pages2/22-06/Over_dues_300.dart';
import 'package:golden_falcon/Owners/Dashboard/pages2/22-06/Payment_Collection_128.dart';
import 'package:golden_falcon/Owners/Dashboard/pages2/22-06/Pickup_pending_123.dart';
import 'package:golden_falcon/Owners/Pages/Activity_Monitor.dart';
import 'package:golden_falcon/Owners/Pages/Assign_Staff.dart';
import 'package:golden_falcon/Owners/Pages/Client_Management.dart';
import 'package:golden_falcon/Owners/Pages/Create_Invoice.dart';
import 'package:golden_falcon/Owners/Pages/Create_NewOrder.dart';
import 'package:golden_falcon/Owners/Pages/Dispatch_Pending.dart';
import 'package:golden_falcon/Owners/Pages/Expence_heads.dart';
import 'package:golden_falcon/Owners/Pages/Orders_Map.dart';
import 'package:golden_falcon/Owners/Pages/Outstanding.dart';
import 'package:golden_falcon/Owners/Pages/Price_Group.dart';
import 'package:golden_falcon/Owners/Pages/ReadyForDispatch.dart';
import 'package:golden_falcon/Owners/Pages/Revenue_Report.dart';
import 'package:intl/intl.dart';

import '../../Loginscreen.dart';
import '../Pages/Add_clients.dart';
import '../Pages/Delivered.dart';
import '../Pages/Payment_history.dart';
import '../Pages/Serviceable_areas.dart';

class DataItem {
  int x;
  double y1;
  double y2;
  double y3;
  double y4;
  DataItem(
      {required this.x,
      required this.y1,
      required this.y2,
      required this.y3,
      required this.y4});
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> particulars = [
    'New Orders',
    'Express',
    'Normal',
    'confirmed',
    'picked',
    'in process',
    'finished',
    'Ready for dispatch',
    'invoice generated',
    'invoice value',
    'Dispatched',
    'Delivered',
  ];
  TextEditingController Date = TextEditingController(
      text: DateFormat('dd-MM-yyyy').format(DateTime.now()));

  String character = 'All';

  Future<bool> showExitPopup() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            title: Center(
                child: Text(
              'Exit App !',
              style: TextStyle(color: Colors.pinkAccent[400]),
            )),
            content: SizedBox(
                height: 50,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        const Text('Do you Really Want to'),
                        const Text('Close the App ?')
                      ],
                    ),
                  ),
                )),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    'No',
                    style: TextStyle(color: Colors.green[700]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(
                    'Yes',
                    style: TextStyle(color: Colors.pinkAccent[400]),
                  ),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }

  final List<DataItem> _myData = List.generate(
      3,
      (index) => DataItem(
            x: index,
            y1: Random().nextInt(20) + Random().nextDouble(),
            y2: Random().nextInt(20) + Random().nextDouble(),
            y3: Random().nextInt(20) + Random().nextDouble(),
            y4: Random().nextInt(20) + Random().nextDouble(),
          ));

  String selectedOption = '';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
          drawer: NavigationDrawer(
            backgroundColor: Colors.white,
            elevation: 10,
            children: [
              DrawerHeader(
                  child: CircleAvatar(
                foregroundImage: AssetImage(
                    'Assets/Images/Laundry-Logo-Graphics-1-8-580x386.jpg'),
              )),
              ListTile(
                leading: Icon(
                  CupertinoIcons.tray_arrow_up_fill,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PickUpPending(),
                    )),
                title: Text(
                  'Pickup pending',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.list,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IndividualItems(),
                    )),
                title: Text(
                  'Individual Items',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.location_solid,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrdersMap(),
                    )),
                title: Text(
                  'Orders Map',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.create_solid,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateInvoice(),
                    )),
                title: Text(
                  'Create Invoice',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.man,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Assign(),
                    )),
                title: Text(
                  'Assign Staff',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.local_activity,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Activity(),
                    )),
                title: Text(
                  'Activity Monitor',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.price_change,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PriceGroup(),
                    )),
                title: Text(
                  'Price Group',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.payment,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Payment(),
                    )),
                title: Text(
                  'Payment History',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.manage_accounts,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Management(),
                    )),
                title: Text(
                  'Client Management',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.money_dollar,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Expense(),
                    )),
                title: Text(
                  'Expence Heads',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.request_page,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RevenueReport(),
                    )),
                title: Text(
                  'Revenue Report',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.markunread_mailbox,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReadyForDispatch(),
                    )),
                title: Text(
                  'Ready For Dispatches',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.pending,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DispatchPending(),
                    )),
                title: Text(
                  'Pending Dispatches',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.delivery_dining,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Delivered(),
                    )),
                title: Text(
                  'Delivered',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.account_balance_outlined,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentCollection(),
                    )),
                title: Text(
                  'Payment Collection',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.shopping_bag_sharp,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BagsMaster(),
                    )),
                title: Text(
                  'Bags Master',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Bags(),
                    )),
                title: Text(
                  'Bags',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.report_problem,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AgeingReport(),
                    )),
                title: Text(
                  'Ageing Report',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.payments,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OverDues(),
                    )),
                title: Text(
                  'Over Dues',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.filter_list_outlined,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListAll(),
                    )),
                title: Text(
                  'List All',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.pie_chart,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderStatistics(),
                    )),
                title: Text(
                  'Order Statistics',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.details,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderDetails(),
                    )),
                title: Text(
                  'Order Details',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.pending_actions,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PendingOrders(),
                    )),
                title: Text(
                  'Pending Orders ',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    )),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
            ],
          ),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.blue, size: 30),
            elevation: 0,
            backgroundColor: CupertinoColors.white,
            title: Center(
                child: Text("OWNERS DASHBOARD",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w500))),
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
              child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('Branch'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.40,
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
                      ),
                      items: [DropdownMenuItem(child: Text('select'))],
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: '',
                  activeColor: Colors.blue,
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
            SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Center(
                      child: Text(
                    'At a Glance',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: Stack(children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.deepPurple,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 70),
                            child: Text(
                              'Orders',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(50),
                      elevation: 3,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: Text(
                          '25',
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: Stack(children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.deepPurpleAccent[100],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 70),
                            child: Text(
                              'Picked',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(50),
                      elevation: 3,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: Text(
                          '18',
                          style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: Stack(children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.indigo[400],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 70),
                            child: Text(
                              'Ready for Delivery',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(50),
                      elevation: 3,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: Text(
                          '30',
                          style: TextStyle(
                              color: Colors.indigo[400],
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: Stack(children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue[400],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 70),
                            child: Text(
                              'Pending',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(50),
                      elevation: 3,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: Text(
                          '23',
                          style: TextStyle(
                              color: Colors.blue[400],
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: Stack(children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.orange[900],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 70),
                            child: Text(
                              'Add Leads',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(50),
                      elevation: 3,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: Text(
                          '20',
                          style: TextStyle(
                              color: Colors.orange[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: Stack(children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.orange,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 70),
                            child: Text(
                              'Collection',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(50),
                      elevation: 3,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: Text(
                          '250',
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: Stack(children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.lightGreenAccent[700],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 70),
                            child: Text(
                              'New Bag Request',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(50),
                      elevation: 3,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: Text(
                          '50',
                          style: TextStyle(
                              color: Colors.lightGreenAccent[700],
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: Stack(children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.lightGreen[700],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 70),
                            child: Text(
                              'Bag to be Supplyed',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(50),
                      elevation: 3,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: Text(
                          '65',
                          style: TextStyle(
                              color: Colors.lightGreen[700],
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 40),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateNewOrder(),
                          ));
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue[600]),
                      child: Center(
                          child: Text(
                        'New Order',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: 30),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderStatus(),
                          ));
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue[600]),
                      child: Center(
                          child: Text(
                        'Order Status',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddClients(),
                          ));
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue[600]),
                      child: Center(
                          child: Text(
                        'New Client',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 30),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Outstanding(),
                          ));
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue[600]),
                      child: Center(
                          child: Text(
                        'Check Outstanding',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Areas(),
                      ));
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue[600]),
                  child: Center(
                      child: Text(
                    'Availability',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      child: Row(
                    children: [
                      Icon(
                        Icons.arrow_right_outlined,
                        size: 35,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          controller: Date,
                          style: TextStyle(fontSize: 14),
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
                                        dialogBackgroundColor:
                                            Colors.blueGrey.shade50,
                                      ),
                                      child: child!);
                                },
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000, 01, 01),
                                lastDate: DateTime(2050, 12, 31));
                            Date.text =
                                DateFormat('dd-MM-yyyy').format(pickedDate!);
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(10)),
                            contentPadding: EdgeInsets.only(),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_left_outlined,
                        size: 35,
                        color: Colors.blue,
                      ),
                    ],
                  )),
                  Text('Order Value : 250')
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                surfaceTintColor: Colors.white,
                elevation: 2,
                child: Column(children: [
                  Container(
                      height: 40,
                      child: Row(children: [
                        Container(
                            width: 50,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        Container(
                            width: 50,
                            alignment: Alignment.center,
                            child: Text(
                              "Sl. No",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        Expanded(
                            child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Particulars",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ))),
                        Container(
                            width: 60,
                            alignment: Alignment.center,
                            child: Text(
                              "Today",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        Container(
                            width: 60,
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "This Month",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
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
                    height: MediaQuery.of(context).size.height*0.5,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.zero,
                        itemCount: particulars.length,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            child: Row(children: [
                              Container(
                                width: 50,
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.arrow_right_outlined,
                                  size: 35,
                                  color: Colors.blue,
                                ),
                              ),
                              Container(
                                  width: 50,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "1",
                                    style: TextStyle(color: Colors.black),
                                  )),
                              Expanded(
                                  child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                         particulars[index],
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ))),
                              Container(
                                  width: 60,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "5",
                                    style: TextStyle(color: Colors.black),
                                  )),
                              Container(
                                  width: 60,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "1236",
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ]),
                          );
                        }),
                  )
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: Text(
                  'Category Wise',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  surfaceTintColor: Colors.white,
                  elevation: 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 40,
                              width: 40,
                              alignment: Alignment.center,
                              child: Text(
                                "Sl.No",
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
                                  "Category",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          Container(
                              width: 50,
                              height: 40,
                              alignment: Alignment.center,
                              child: Text(
                                "New",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                          Container(
                              height: 40,
                              width: 70,
                              alignment: Alignment.center,
                              child: Text(
                                "Processed",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                          Container(
                              height: 40,
                              width: 60,
                              alignment: Alignment.center,
                              child: Text(
                                "Pending",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                          Container(
                              height: 40,
                              width: 60,
                              alignment: Alignment.center,
                              child: Text(
                                "Delivered",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          color: Colors.blue,
                          height: 0.5,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.35,
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                child: Row(children: [
                                  Container(
                                      width: 40,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "1",
                                        style: TextStyle(color: Colors.black),
                                      )),
                                  Expanded(
                                    child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Dry Clean",
                                          style: TextStyle(color: Colors.black),
                                        )),
                                  ),
                                  Container(
                                      width: 50,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "10",
                                        style: TextStyle(color: Colors.black),
                                      )),
                                  Container(
                                      width: 70,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "5",
                                        style: TextStyle(color: Colors.black),
                                      )),
                                  Container(
                                      width: 60,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "5",
                                        style: TextStyle(color: Colors.black),
                                      )),
                                  Container(
                                      width: 60,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "5",
                                        style: TextStyle(color: Colors.black),
                                      )),
                                ]));
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: Text(
                  'Item Wise',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                height: MediaQuery.of(context).size.height*0.5,
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
                                  "Item",
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
                                  "Hang",
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
                                  "Fold",
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
                                  "Roll",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          color: Colors.blue,
                          height: 0.5,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.35,
                        child: ListView.builder(
                          itemCount: 15,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Shirts",
                                      )),
                                ),
                                Expanded(
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "60",
                                      )),
                                ),
                                Expanded(
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "100",
                                      )),
                                ),
                                Expanded(
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "250",
                                      )),
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: Text(
                  'Staff Wise Orders',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Sales',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SizedBox(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blue)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Radio<String>(
                                  value: 'Cash on Delivery',
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value!;
                                    });
                                  },
                                ),
                                Center(child: Text('Last 7 Days')),
                              ],
                            ),
                            Row(
                              children: [
                                Radio<String>(
                                  value: 'Cash on Delivery',
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value!;
                                    });
                                  },
                                ),
                                Center(child: Text('Today')),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 30),
              child: SizedBox(
                height: 300,
                child: BarChart(BarChartData(
                    gridData: FlGridData(show: false),
                    borderData: FlBorderData(
                        border: const Border(
                      top: BorderSide.none,
                      right: BorderSide.none,
                      left: BorderSide(width: 1),
                      bottom: BorderSide(width: 1),
                    )),
                    groupsSpace: 10,
                    titlesData: FlTitlesData(
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        leftTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            String text = '';
                            switch (value.toInt()) {
                              case 1:
                                text = 'Ahamad';
                                break;
                              case 2:
                                text = 'Sogin';
                                break;
                              case 3:
                                text = 'Deepesh';
                                break;
                              case 4:
                                text = 'Abdul';
                                break;
                              case 5:
                                text = 'Shalu';
                                break;
                            }

                            return Text(text);
                          },
                        ))),

                    // add bars
                    barGroups: [
                      BarChartGroupData(x: 1, barRods: [
                        BarChartRodData(
                            toY: 10,
                            width: 25,
                            color: Colors.blue,
                            borderRadius: BorderRadius.zero),
                      ]),
                      BarChartGroupData(x: 2, barRods: [
                        BarChartRodData(
                            toY: 9,
                            width: 25,
                            color: Colors.blue,
                            borderRadius: BorderRadius.zero),
                      ]),
                      BarChartGroupData(x: 3, barRods: [
                        BarChartRodData(
                            toY: 4,
                            width: 25,
                            color: Colors.blue,
                            borderRadius: BorderRadius.zero),
                      ]),
                      BarChartGroupData(x: 4, barRods: [
                        BarChartRodData(
                            toY: 2,
                            width: 25,
                            color: Colors.blue,
                            borderRadius: BorderRadius.zero),
                      ]),
                      BarChartGroupData(x: 5, barRods: [
                        BarChartRodData(
                            toY: 13,
                            width: 25,
                            color: Colors.blue,
                            borderRadius: BorderRadius.zero),
                      ]),
                    ])),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: Text(
                  'Order v/s Delivery',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Sales',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SizedBox(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blue)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Radio<String>(
                                  value: 'Cash on Delivery',
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value!;
                                    });
                                  },
                                ),
                                Center(child: Text('Last 7 Days')),
                              ],
                            ),
                            Row(
                              children: [
                                Radio<String>(
                                  value: 'Cash on Delivery',
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value!;
                                    });
                                  },
                                ),
                                Center(child: Text('Today')),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: BarChart(BarChartData(
                    gridData: FlGridData(show: false),
                    borderData: FlBorderData(
                        border: const Border(
                      top: BorderSide.none,
                      right: BorderSide.none,
                      left: BorderSide(width: 1),
                      bottom: BorderSide(width: 1),
                    )),
                    titlesData: FlTitlesData(
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            String text = '';
                            switch (value.toInt()) {
                              case 0:
                                text = 'March 28';
                                break;
                              case 1:
                                text = 'March 27';
                                break;
                              case 2:
                                text = 'March 26';
                                break;
                            }

                            return Text(text);
                          },
                        )),
                        leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  String text = '';
                                  switch (value.toInt()) {
                                    case 0:
                                      text = '0';
                                      break;
                                    case 2:
                                      text = '10';
                                      break;
                                    case 4:
                                      text = '20';
                                      break;
                                    case 6:
                                      text = '30';
                                      break;
                                    case 8:
                                      text = '40';
                                      break;
                                    case 10:
                                      text = '50';
                                      break;
                                    case 12:
                                      text = '60';
                                      break;
                                  }
                                  return Text(text);
                                }))),
                    barGroups: _myData
                        .map((dataItem) =>
                            BarChartGroupData(x: dataItem.x, barRods: [
                              BarChartRodData(
                                  toY: dataItem.y1,
                                  width: 25,
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.zero),
                              BarChartRodData(
                                  toY: dataItem.y2,
                                  width: 25,
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.zero),
                            ]))
                        .toList())),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: Text(
                  'Sales Summery',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text('Last 7 Days'),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 300,
              child: LineChart(
                LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false))),
                    borderData: FlBorderData(
                        show: true,
                        border: Border(
                            left: BorderSide(color: Colors.black),
                            bottom: BorderSide(color: Colors.black))),
                    lineBarsData: [
                      LineChartBarData(
                          isCurved: false,
                          spots: [
                            FlSpot(0, 10),
                            const FlSpot(1, 8),
                            const FlSpot(2, 10),
                            const FlSpot(3, 7),
                            const FlSpot(4, 12),
                            const FlSpot(5, 13),
                            const FlSpot(6, 17),
                            const FlSpot(7, 15),
                          ],
                          dotData: FlDotData(show: false))
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                height: 40,
                width: 160,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: Text(
                  'Income v/s Expense',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue)),
                    child: Column(
                      children: [
                        Center(
                            child: Row(
                          children: [
                            Radio<String>(
                              value: 'Cash on Delivery',
                              groupValue: selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  selectedOption = value!;
                                });
                              },
                            ),
                            Text('Last 7 Days'),
                          ],
                        )),
                        Center(
                            child: Row(
                          children: [
                            Radio<String>(
                              value: 'Cash on Delivery',
                              groupValue: selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  selectedOption = value!;
                                });
                              },
                            ),
                            Text('This Month'),
                          ],
                        )),
                        Center(
                            child: Row(
                          children: [
                            Radio<String>(
                              value: 'Cash on Delivery',
                              groupValue: selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  selectedOption = value!;
                                });
                              },
                            ),
                            Text('This Day'),
                          ],
                        )),
                      ],
                    ),
                  ),
                ]),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: PieChart(PieChartData(
                      centerSpaceRadius: 1,
                      borderData: FlBorderData(show: false),
                      sections: [
                        PieChartSectionData(
                            value: 30,
                            color: Colors.green,
                            radius: 100,
                            title: 'Expence'),
                        PieChartSectionData(
                            value: 70,
                            color: Colors.orange[900],
                            radius: 100,
                            title: 'Income')
                      ])),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Income : 170000.00'),
                    Text('Expence : 30000.00'),
                    Text('Profit : 140000.00'),
                  ],
                )
              ],
            ),
          ]))),
    );
  }
}
