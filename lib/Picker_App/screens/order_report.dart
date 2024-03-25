import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/PickerBloc/picker_bloc.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Repositories/PickerRepo/picker_repo.dart';
import 'package:intl/intl.dart';
import '../src/colors.dart';
import '../src/dimen.dart';
import '../src/textString.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/custom_shape.dart';
import '../util/drawer.dart';

class OrderReportScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OrderReportScreenState();
}

class OrderReportScreenState extends State<OrderReportScreen> {
  bool clicked = false;
  bool showData = false;
  int checker = 0;
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  @override
  void initState() {
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    checker += 1;
    print('state : $checker');
    toController.text = formattedDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<PickerBloc, PickerState>(
      buildWhen: (previous, current) {
        return checker == 1;
      },
      builder: (context, state) {
       if (state is OrderHistoryFetching) {
         print(state.toString());
         return Scaffold(
           // key: _scaffoldKey,
           appBar: PreferredSize(
             preferredSize:
             Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
             child: Appbar(
               text: 'Order History',
             ),
           ),
           drawer: const MenuDrawer(),
           body: SingleChildScrollView(
             child: Container(
               color: Colors.white,
               child: Column(
                 children: [
                   Container(
                     padding: EdgeInsets.symmetric(horizontal: 25),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Container(
                             alignment: Alignment.centerRight,
                             // margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.03),
                             width: size.width * 0.3,
                             height: size.height * 0.04,
                             decoration: ShapeDecoration(
                                 color: Colors.transparent,
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(2.0),
                                     side: BorderSide(
                                         width: 1, color: pickerPrimaryColor))),
                             child: Container(
                               // margin: EdgeInsets.only(top: size.height * 0.015),
                               alignment: Alignment.center,
                               child: TextField(
                                   controller:
                                   fromController, //editing controller of this TextField
                                   decoration: const InputDecoration(
                                       icon: Icon(Icons
                                           .calendar_today), //icon of text field
                                       hintText:
                                       "From Date" //label text of field
                                   ),
                                   readOnly:
                                   true, // when true user cannot edit text
                                   onTap: () async {
                                     DateTime? pickedDate = await showDatePicker(
                                         context: context,
                                         initialDate:
                                         DateTime.now(), //get today's date
                                         firstDate: DateTime(
                                             2000), //DateTime.now() - not to allow to choose before today.
                                         lastDate: DateTime(2101));
                                     if (pickedDate != null) {
                                       print(
                                           pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                                       String formattedDate =
                                       DateFormat('yyyy-MM-dd').format(
                                           pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                       print(
                                           formattedDate); //formatted date output using intl package =>  2022-07-04
                                       //You can format date as per your need

                                       setState(() {
                                         fromController.text =
                                             formattedDate; //set foratted date to TextField value.
                                       });
                                     } else {
                                       print("Date is not selected");
                                     }
                                   }),
                             )),
                         Container(
                             alignment: Alignment.center,
                             // margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.03),
                             width: size.width * 0.3,
                             height: size.height * 0.04,
                             decoration: ShapeDecoration(
                                 color: Colors.transparent,
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(2.0),
                                     side: BorderSide(
                                         width: 1, color: pickerPrimaryColor))),
                             child: Container(
                               // margin: EdgeInsets.only(top: size.height * 0.015),
                               child: TextField(
                                   controller:
                                   toController, //editing controller of this TextField
                                   decoration: const InputDecoration(
                                       icon: Icon(Icons
                                           .calendar_today), //icon of text field
                                       hintText: "To Date" //label text of field
                                   ),
                                   readOnly:
                                   true, // when true user cannot edit text
                                   onTap: () async {
                                     DateTime? pickedDate = await showDatePicker(
                                         context: context,
                                         initialDate:
                                         DateTime.now(), //get today's date
                                         firstDate: DateTime(
                                             2000), //DateTime.now() - not to allow to choose before today.
                                         lastDate: DateTime(2101));
                                     if (pickedDate != null) {
                                       print(
                                           pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                                       String formattedDate =
                                       DateFormat('yyyy-MM-dd').format(
                                           pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                       print(
                                           formattedDate); //formatted date output using intl package =>  2022-07-04
                                       //You can format date as per your need

                                       setState(() {
                                         toController.text =
                                             formattedDate; //set foratted date to TextField value.
                                       });
                                     } else {
                                       print("Date is not selected");
                                     }
                                   }),
                             )),
                       ],
                     ),
                   ),
                   Container(
                     margin: EdgeInsets.only(
                         top: size.height * 0.01, left: size.width * 0.03),
                     padding: EdgeInsets.all(smallTextPadding),
                     width: size.width / 2,
                     child: ElevatedButton(
                       onPressed: () {

                       },
                       style: ElevatedButton.styleFrom(
                         primary: Colors.greenAccent,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10),
                         ),
                         elevation: 15.0,
                       ),
                       child: Text(
                         'Loading...',
                         style: TextStyle(
                             color: Colors.white,
                             fontSize: 14,
                             fontWeight: FontWeight.w600),
                       ),
                     ),
                   ),
                   SizedBox(height: 120),
                   Center(child: Text('Fetching...'),),
                   // Row(
                   //   crossAxisAlignment: CrossAxisAlignment.center,
                   //   mainAxisAlignment: MainAxisAlignment.center,
                   //   children: [
                   //     Container(
                   //       margin: EdgeInsets.only(top: size.height * 0.03),
                   //       child: Text(
                   //         'No of Orders :',
                   //         style: TextStyle(fontSize: 17),
                   //       ),
                   //     ),
                   //     Container(
                   //         margin: EdgeInsets.only(
                   //             top: size.height * 0.03,
                   //             left: size.width * 0.03,
                   //             right: size.width * 0.08),
                   //         width: size.width * 0.1,
                   //         height: size.height * 0.05,
                   //         decoration: ShapeDecoration(
                   //             color: Colors.transparent,
                   //             shape: RoundedRectangleBorder(
                   //                 borderRadius: BorderRadius.circular(2.0),
                   //                 side: BorderSide(
                   //                     width: 2, color: pickerPrimaryColor))),
                   //         child: Center(
                   //           child: Text("15"),
                   //         )),
                   //   ],
                   // ),
                   // Container(
                   //     margin: EdgeInsets.only(
                   //       top: size.height * 0.03,
                   //       bottom: size.height * 0.01,
                   //     ),
                   //     width: size.width,
                   //     height: size.height * 0.15,
                   //     decoration: ShapeDecoration(
                   //         color: Colors.white,
                   //         shape: RoundedRectangleBorder(
                   //           borderRadius: BorderRadius.circular(2.0),
                   //         )),
                   //     child: Row(
                   //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                   //       children: [
                   //         Column(
                   //           mainAxisAlignment: MainAxisAlignment.center,
                   //           children: [
                   //             Container(
                   //               alignment: Alignment.center,
                   //               width: size.width * 0.15,
                   //               height: size.height * 0.1,
                   //               decoration: new BoxDecoration(
                   //                 color: pickerPrimaryColor,
                   //                 shape: BoxShape.circle,
                   //               ),
                   //               child: Text(
                   //                 '5',
                   //                 textAlign: TextAlign.center,
                   //                 style: TextStyle(
                   //                     color: Colors.white, fontSize: 18),
                   //               ),
                   //             ),
                   //             Container(
                   //               margin: EdgeInsets.only(top: size.width * 0.01),
                   //               child: Text(
                   //                 'VIA APP',
                   //                 style: TextStyle(
                   //                     color: Colors.blueAccent,
                   //                     fontSize: 13,
                   //                     fontWeight: FontWeight.w700),
                   //               ),
                   //             )
                   //           ],
                   //         ),
                   //         Column(
                   //           mainAxisAlignment: MainAxisAlignment.center,
                   //           children: [
                   //             Container(
                   //               alignment: Alignment.center,
                   //               width: size.width * 0.15,
                   //               height: size.height * 0.1,
                   //               decoration: new BoxDecoration(
                   //                 color: pickerPrimaryColor,
                   //                 shape: BoxShape.circle,
                   //               ),
                   //               child: Text(
                   //                 '5',
                   //                 textAlign: TextAlign.center,
                   //                 style: TextStyle(
                   //                     color: Colors.white, fontSize: 18),
                   //               ),
                   //             ),
                   //             Container(
                   //               margin: EdgeInsets.only(top: size.width * 0.01),
                   //               child: Text(
                   //                 'VIA CALL',
                   //                 style: TextStyle(
                   //                     color: Colors.blueAccent,
                   //                     fontSize: 13,
                   //                     fontWeight: FontWeight.w700),
                   //               ),
                   //             )
                   //           ],
                   //         ),
                   //         Column(
                   //           mainAxisAlignment: MainAxisAlignment.center,
                   //           children: [
                   //             Container(
                   //               alignment: Alignment.center,
                   //               width: size.width * 0.15,
                   //               height: size.height * 0.1,
                   //               decoration: new BoxDecoration(
                   //                 color: pickerPrimaryColor,
                   //                 shape: BoxShape.circle,
                   //               ),
                   //               child: Text(
                   //                 '5',
                   //                 textAlign: TextAlign.center,
                   //                 style: TextStyle(
                   //                     color: Colors.white, fontSize: 18),
                   //               ),
                   //             ),
                   //             Container(
                   //               margin: EdgeInsets.only(top: size.width * 0.01),
                   //               child: Text(
                   //                 'VIA STAFF',
                   //                 style: TextStyle(
                   //                     color: Colors.blueAccent,
                   //                     fontSize: 13,
                   //                     fontWeight: FontWeight.w700),
                   //               ),
                   //             )
                   //           ],
                   //         ),
                   //         Column(
                   //           mainAxisAlignment: MainAxisAlignment.center,
                   //           children: [
                   //             Container(
                   //               alignment: Alignment.center,
                   //               width: size.width * 0.15,
                   //               height: size.height * 0.1,
                   //               decoration: new BoxDecoration(
                   //                 color: pickerPrimaryColor,
                   //                 shape: BoxShape.circle,
                   //               ),
                   //               child: Text(
                   //                 '5',
                   //                 textAlign: TextAlign.center,
                   //                 style: TextStyle(
                   //                     color: Colors.white, fontSize: 18),
                   //               ),
                   //             ),
                   //             Container(
                   //               margin: EdgeInsets.only(top: size.width * 0.01),
                   //               child: Text(
                   //                 'NEW CLIENTS',
                   //                 style: TextStyle(
                   //                     color: Colors.blueAccent,
                   //                     fontSize: 13,
                   //                     fontWeight: FontWeight.w700),
                   //               ),
                   //             )
                   //           ],
                   //         )
                   //       ],
                   //     )),
                   // Align(
                   //   alignment: Alignment.centerRight,
                   //   child: Container(
                   //       alignment: Alignment.centerRight,
                   //       margin: EdgeInsets.only(
                   //           top: size.height * 0.03, right: size.width * 0.06),
                   //       width: size.width * 0.45,
                   //       height: size.height * 0.045,
                   //       decoration: ShapeDecoration(
                   //           color: Colors.transparent,
                   //           shape: RoundedRectangleBorder(
                   //               borderRadius: BorderRadius.circular(2.0),
                   //               side: BorderSide(
                   //                   width: 2, color: pickerPrimaryColor))),
                   //       child: Row(
                   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   //         crossAxisAlignment: CrossAxisAlignment.center,
                   //         children: [
                   //           Container(
                   //             margin: EdgeInsets.only(left: size.width * 0.02),
                   //             child: Text(
                   //               'Search....',
                   //             ),
                   //           ),
                   //           Container(
                   //               decoration:
                   //               BoxDecoration(color: pickerLightGreyColor),
                   //               child: IconButton(
                   //                 icon: Icon(
                   //                   Icons.search,
                   //                   color: pickerPrimaryColor,
                   //                   size: 22,
                   //                 ),
                   //                 onPressed: () {},
                   //               )),
                   //         ],
                   //       )),
                   // ),
                   // SizedBox(
                   //   height: size.height * 0.05,
                   // ),
                   // // if (state.data.length > 0)
                   // // Container(
                   // //   margin: EdgeInsets.symmetric(
                   // //       horizontal: size.width * 0.02),
                   // //   height: size.height * 0.22,
                   // //   width: MediaQuery.of(context).size.width *
                   // //       0.9, // Increased width
                   // //   child: ListView.builder(
                   // //     itemCount: 1,
                   // //     padding: EdgeInsets.zero,
                   // //     scrollDirection: Axis.horizontal,
                   // //     physics: const ClampingScrollPhysics(),
                   // //     itemBuilder: (context, index) {
                   // //       return Column(
                   // //         children: [
                   // //           Container(
                   // //             margin: EdgeInsets.symmetric(
                   // //                 horizontal: size.width * 0.05),
                   // //             height: size.height * 0.08,
                   // //             width: MediaQuery.of(context).size.width /
                   // //                 0.8, // Increased width
                   // //             child: Row(
                   // //               children: [
                   // //                 Expanded(
                   // //                   child: Container(
                   // //                     alignment: Alignment.center,
                   // //                     decoration: BoxDecoration(
                   // //                       border: Border.all(
                   // //                           color: Colors.deepPurple),
                   // //                     ),
                   // //                     child: Text(
                   // //                       " Sl No",
                   // //                       style: TextStyle(
                   // //                         color: Colors.deepPurple,
                   // //                         fontWeight: FontWeight.bold,
                   // //                       ),
                   // //                     ),
                   // //                   ),
                   // //                 ),
                   // //                 Expanded(
                   // //                   child: Container(
                   // //                     alignment: Alignment.center,
                   // //                     decoration: BoxDecoration(
                   // //                       border: Border.all(
                   // //                           color: Colors.deepPurple),
                   // //                     ),
                   // //                     child: Text(
                   // //                       "Order No",
                   // //                       style: TextStyle(
                   // //                         color: Colors.deepPurple,
                   // //                         fontWeight: FontWeight.bold,
                   // //                       ),
                   // //                     ),
                   // //                   ),
                   // //                 ),
                   // //                 Expanded(
                   // //                   child: Container(
                   // //                     alignment: Alignment.center,
                   // //                     decoration: BoxDecoration(
                   // //                       border: Border.all(
                   // //                           color: Colors.deepPurple),
                   // //                     ),
                   // //                     child: Text(
                   // //                       "Client Name",
                   // //                       style: TextStyle(
                   // //                         color: Colors.deepPurple,
                   // //                         fontWeight: FontWeight.bold,
                   // //                       ),
                   // //                     ),
                   // //                   ),
                   // //                 ),
                   // //                 Expanded(
                   // //                   child: Container(
                   // //                     alignment: Alignment.center,
                   // //                     decoration: BoxDecoration(
                   // //                       border: Border.all(
                   // //                           color: Colors.deepPurple),
                   // //                     ),
                   // //                     child: Text(
                   // //                       "Location",
                   // //                       style: TextStyle(
                   // //                         color: Colors.deepPurple,
                   // //                         fontWeight: FontWeight.bold,
                   // //                       ),
                   // //                     ),
                   // //                   ),
                   // //                 ),
                   // //                 Expanded(
                   // //                   child: Container(
                   // //                     alignment: Alignment.center,
                   // //                     decoration: BoxDecoration(
                   // //                       border: Border.all(
                   // //                           color: Colors.deepPurple),
                   // //                     ),
                   // //                     child: Text(
                   // //                       "Building.No",
                   // //                       style: TextStyle(
                   // //                         color: Colors.deepPurple,
                   // //                         fontWeight: FontWeight.bold,
                   // //                       ),
                   // //                     ),
                   // //                   ),
                   // //                 ),
                   // //                 Expanded(
                   // //                   child: Container(
                   // //                     alignment: Alignment.center,
                   // //                     decoration: BoxDecoration(
                   // //                       border: Border.all(
                   // //                           color: Colors.deepPurple),
                   // //                     ),
                   // //                     child: Text(
                   // //                       "Status",
                   // //                       style: TextStyle(
                   // //                         color: Colors.deepPurple,
                   // //                         fontWeight: FontWeight.bold,
                   // //                       ),
                   // //                     ),
                   // //                   ),
                   // //                 ),
                   // //                 Expanded(
                   // //                   child: Container(
                   // //                     alignment: Alignment.center,
                   // //                     decoration: BoxDecoration(
                   // //                       border: Border.all(
                   // //                           color: Colors.deepPurple),
                   // //                     ),
                   // //                     child: Text(
                   // //                       "Delivery Time",
                   // //                       style: TextStyle(
                   // //                         color: Colors.deepPurple,
                   // //                         fontWeight: FontWeight.bold,
                   // //                       ),
                   // //                     ),
                   // //                   ),
                   // //                 ),
                   // //               ],
                   // //             ),
                   // //           ),
                   // //           Container(
                   // //             height: size.height * 0.13,
                   // //             width: MediaQuery.of(context).size.width *
                   // //                 1.35,
                   // //             child: ListView.builder(
                   // //               padding: EdgeInsets.zero,
                   // //               scrollDirection: Axis.vertical,
                   // //               physics: const ClampingScrollPhysics(),
                   // //               itemCount: state.data.length,
                   // //               itemBuilder: (BuildContext context,
                   // //                   int rowIndex) {
                   // //                 return GestureDetector(
                   // //                   onTap: () {
                   // //                     setState(() {
                   // //                       clicked = true;
                   // //                     });
                   // //
                   // //                   },
                   // //                   child: SizedBox(
                   // //                     height: size.height * 0.05,
                   // //                     width: MediaQuery.of(context)
                   // //                             .size
                   // //                             .width *
                   // //                         1.5,
                   // //                     child: ListView.builder(
                   // //                       itemCount: 1,
                   // //                       scrollDirection: Axis.vertical,
                   // //                       itemBuilder: (context, index) {
                   // //                         return Container(
                   // //                           margin:
                   // //                               EdgeInsets.symmetric(
                   // //                                   horizontal:
                   // //                                       size.width *
                   // //                                           0.05),
                   // //                           height: size.height * 0.05,
                   // //                           width:
                   // //                               MediaQuery.of(context)
                   // //                                       .size
                   // //                                       .width *
                   // //                                   1.5,
                   // //                           // Increased width
                   // //                           child: Row(
                   // //                             children: [
                   // //                               Expanded(
                   // //                                 child: Container(
                   // //                                   width: size.width *
                   // //                                       0.15,
                   // //                                   alignment: Alignment
                   // //                                       .center,
                   // //                                   decoration:
                   // //                                       BoxDecoration(
                   // //                                     border: Border.all(
                   // //                                         color: Colors
                   // //                                             .deepPurple),
                   // //                                   ),
                   // //                                   child: Text(
                   // //                                    (rowIndex+1).toString(),
                   // //                                     style: TextStyle(
                   // //                                       color: Colors
                   // //                                           .black,
                   // //                                     ),
                   // //                                   ),
                   // //                                 ),
                   // //                               ),
                   // //                               Expanded(
                   // //                                 child: Container(
                   // //                                   width: size.width *
                   // //                                       0.15,
                   // //                                   alignment: Alignment
                   // //                                       .center,
                   // //                                   decoration:
                   // //                                       BoxDecoration(
                   // //                                     border: Border.all(
                   // //                                         color: Colors
                   // //                                             .deepPurple),
                   // //                                   ),
                   // //                                   child: Text(
                   // //                                     state.data[index].orderNumber,
                   // //                                     style: TextStyle(
                   // //                                       color: Colors
                   // //                                           .black,
                   // //                                     ),
                   // //                                   ),
                   // //                                 ),
                   // //                               ),
                   // //                               Expanded(
                   // //                                 child: Container(
                   // //                                   width: size.width *
                   // //                                       0.15,
                   // //                                   alignment: Alignment
                   // //                                       .center,
                   // //                                   decoration:
                   // //                                       BoxDecoration(
                   // //                                     border: Border.all(
                   // //                                         color: Colors
                   // //                                             .deepPurple),
                   // //                                   ),
                   // //                                   child: Text(
                   // //                                     state.data[index].customer.name,
                   // //                                     style: TextStyle(
                   // //                                       color: Colors
                   // //                                           .black,
                   // //                                     ),
                   // //                                   ),
                   // //                                 ),
                   // //                               ),
                   // //                               Expanded(
                   // //                                 child: Container(
                   // //                                   width: size.width *
                   // //                                       0.15,
                   // //                                   alignment: Alignment
                   // //                                       .center,
                   // //                                   decoration:
                   // //                                       BoxDecoration(
                   // //                                     border: Border.all(
                   // //                                         color: Colors
                   // //                                             .deepPurple),
                   // //                                   ),
                   // //                                   child: Text(
                   // //                                     state.data[index].customer.location.name,
                   // //                                     style: TextStyle(
                   // //                                       color: Colors
                   // //                                           .black,
                   // //                                     ),
                   // //                                   ),
                   // //                                 ),
                   // //                               ),
                   // //                               Expanded(
                   // //                                 child: Container(
                   // //                                   width: size.width *
                   // //                                       0.15,
                   // //                                   alignment: Alignment
                   // //                                       .center,
                   // //                                   decoration:
                   // //                                       BoxDecoration(
                   // //                                     border: Border.all(
                   // //                                         color: Colors
                   // //                                             .deepPurple),
                   // //                                   ),
                   // //                                   child: Text(
                   // //                                     state.data[index].customer.buildingNo,
                   // //                                     style: TextStyle(
                   // //                                       color: Colors
                   // //                                           .black,
                   // //                                     ),
                   // //                                   ),
                   // //                                 ),
                   // //                               ),
                   // //                               Expanded(
                   // //                                 child: Container(
                   // //                                   width: size.width *
                   // //                                       0.15,
                   // //                                   alignment: Alignment
                   // //                                       .center,
                   // //                                   decoration:
                   // //                                       BoxDecoration(
                   // //                                     border: Border.all(
                   // //                                         color: Colors
                   // //                                             .deepPurple),
                   // //                                   ),
                   // //                                   child: Text(
                   // //                                     state.data[index].status,
                   // //                                     style: TextStyle(
                   // //                                       color: Colors
                   // //                                           .black,
                   // //                                     ),
                   // //                                   ),
                   // //                                 ),
                   // //                               ),
                   // //                               Expanded(
                   // //                                 child: Container(
                   // //                                   width: size.width *
                   // //                                       0.15,
                   // //                                   alignment: Alignment
                   // //                                       .center,
                   // //                                   decoration:
                   // //                                       BoxDecoration(
                   // //                                     border: Border.all(
                   // //                                         color: Colors
                   // //                                             .deepPurple),
                   // //                                   ),
                   // //                                   child: Text(
                   // //                                     "0",
                   // //                                     style: TextStyle(
                   // //                                       color: Colors
                   // //                                           .black,
                   // //                                     ),
                   // //                                   ),
                   // //                                 ),
                   // //                               ),
                   // //                             ],
                   // //                           ),
                   // //                         );
                   // //                       },
                   // //                     ),
                   // //                   ),
                   // //                 );
                   // //               },
                   // //             ),
                   // //           ),
                   // //         ],
                   // //       );
                   // //     },
                   // //   ),
                   // // ),
                   // SingleChildScrollView(
                   //   padding: EdgeInsets.symmetric(horizontal: 16.0),
                   //   scrollDirection: Axis.vertical,
                   //   child: SingleChildScrollView(
                   //     scrollDirection: Axis.horizontal,
                   //     child: DataTable(
                   //       showCheckboxColumn: false,
                   //       border: TableBorder.all(color: pickerPrimaryColor),
                   //       columns: [
                   //         DataColumn(label: Center(child: Text('Sl.No'))),
                   //         DataColumn(label: Center(child: Text('Ord.No'))),
                   //         DataColumn(label: Center(child: Text('Client Name'))),
                   //         DataColumn(label: Center(child: Text('Location'))),
                   //         DataColumn(label: Center(child: Text('Build.No'))),
                   //         DataColumn(label: Center(child: Text('Status'))),
                   //         DataColumn(label: Center(child: Text('Del.Time'))),
                   //       ],
                   //       rows: [],
                   //     ),
                   //   ),
                   // ),
                   // clicked == true
                   //     ? Column(
                   //   children: [
                   //     Icon(
                   //       Icons.keyboard_double_arrow_down_outlined,
                   //       color: pickerPrimaryColor,
                   //     ),
                   //     Icon(
                   //       Icons.keyboard_double_arrow_down_outlined,
                   //       color: pickerPrimaryColor,
                   //     ),
                   //   ],
                   // )
                   //     : Container(),
                   // SizedBox(
                   //   height: size.height * 0.05,
                   // ),
                   // clicked == true
                   //     ? Row(
                   //   mainAxisAlignment: MainAxisAlignment.start,
                   //   children: [
                   //     Container(
                   //       margin: EdgeInsets.symmetric(
                   //           horizontal: size.width * 0.02),
                   //       height: size.height * 0.22,
                   //       width: MediaQuery.of(context).size.width *
                   //           0.8, // Increased width
                   //       child: ListView.builder(
                   //         itemCount: 1,
                   //         padding: EdgeInsets.zero,
                   //         scrollDirection: Axis.horizontal,
                   //         physics: const ClampingScrollPhysics(),
                   //         itemBuilder: (context, index) {
                   //           return Column(
                   //             children: [
                   //               Container(
                   //                 margin: EdgeInsets.symmetric(
                   //                     horizontal: size.width * 0.05),
                   //                 height: size.height * 0.08,
                   //                 width:
                   //                 MediaQuery.of(context).size.width *
                   //                     0.85, // Increased width
                   //                 child: Row(
                   //                   children: [
                   //                     Expanded(
                   //                       child: Container(
                   //                         alignment: Alignment.center,
                   //                         decoration: BoxDecoration(
                   //                           border: Border.all(
                   //                               color: Colors.deepPurple),
                   //                         ),
                   //                         child: Text(
                   //                           " Sl No",
                   //                           style: TextStyle(
                   //                             color: Colors.deepPurple,
                   //                             fontWeight: FontWeight.bold,
                   //                           ),
                   //                         ),
                   //                       ),
                   //                     ),
                   //                     Expanded(
                   //                       child: Container(
                   //                         alignment: Alignment.center,
                   //                         decoration: BoxDecoration(
                   //                           border: Border.all(
                   //                               color: Colors.deepPurple),
                   //                         ),
                   //                         child: Text(
                   //                           "Category",
                   //                           style: TextStyle(
                   //                             color: Colors.deepPurple,
                   //                             fontWeight: FontWeight.bold,
                   //                           ),
                   //                         ),
                   //                       ),
                   //                     ),
                   //                     Expanded(
                   //                       child: Container(
                   //                         alignment: Alignment.center,
                   //                         decoration: BoxDecoration(
                   //                           border: Border.all(
                   //                               color: Colors.deepPurple),
                   //                         ),
                   //                         child: Text(
                   //                           "Item Name",
                   //                           style: TextStyle(
                   //                             color: Colors.deepPurple,
                   //                             fontWeight: FontWeight.bold,
                   //                           ),
                   //                         ),
                   //                       ),
                   //                     ),
                   //                     Expanded(
                   //                       child: Container(
                   //                         alignment: Alignment.center,
                   //                         decoration: BoxDecoration(
                   //                           border: Border.all(
                   //                               color: Colors.deepPurple),
                   //                         ),
                   //                         child: Text(
                   //                           "Qty",
                   //                           style: TextStyle(
                   //                             color: Colors.deepPurple,
                   //                             fontWeight: FontWeight.bold,
                   //                           ),
                   //                         ),
                   //                       ),
                   //                     ),
                   //                   ],
                   //                 ),
                   //               ),
                   //               Container(
                   //                 height: size.height * 0.13,
                   //                 width:
                   //                 MediaQuery.of(context).size.width *
                   //                     0.85,
                   //                 child: ListView.builder(
                   //                   padding: EdgeInsets.zero,
                   //                   scrollDirection: Axis.vertical,
                   //                   physics:
                   //                   const ClampingScrollPhysics(),
                   //                   itemCount: 2,
                   //                   itemBuilder: (BuildContext context,
                   //                       int rowIndex) {
                   //                     return GestureDetector(
                   //                       onTap: () {
                   //                         setState(() {
                   //                           clicked = true;
                   //                         });
                   //                       },
                   //                       child: SizedBox(
                   //                         height: size.height * 0.05,
                   //                         width: MediaQuery.of(context)
                   //                             .size
                   //                             .width *
                   //                             0.55,
                   //                         child: ListView.builder(
                   //                           itemCount: 1,
                   //                           scrollDirection:
                   //                           Axis.vertical,
                   //                           itemBuilder:
                   //                               (context, index) {
                   //                             return Container(
                   //                               height:
                   //                               size.height * 0.05,
                   //                               width:
                   //                               MediaQuery.of(context)
                   //                                   .size
                   //                                   .width *
                   //                                   1.85,
                   //                               // Increased width
                   //                               child: Row(
                   //                                 children: [
                   //                                   Expanded(
                   //                                     child: Container(
                   //                                       width:
                   //                                       size.width *
                   //                                           0.2,
                   //                                       alignment:
                   //                                       Alignment
                   //                                           .center,
                   //                                       decoration:
                   //                                       BoxDecoration(
                   //                                         border: Border.all(
                   //                                             color: Colors
                   //                                                 .deepPurple),
                   //                                       ),
                   //                                       child: Text(
                   //                                         "",
                   //                                         style:
                   //                                         TextStyle(
                   //                                           color: Colors
                   //                                               .black,
                   //                                         ),
                   //                                       ),
                   //                                     ),
                   //                                   ),
                   //                                   Expanded(
                   //                                     child: Container(
                   //                                       width:
                   //                                       size.width *
                   //                                           0.2,
                   //                                       alignment:
                   //                                       Alignment
                   //                                           .center,
                   //                                       decoration:
                   //                                       BoxDecoration(
                   //                                         border: Border.all(
                   //                                             color: Colors
                   //                                                 .deepPurple),
                   //                                       ),
                   //                                       child: Text(
                   //                                         "",
                   //                                         style:
                   //                                         TextStyle(
                   //                                           color: Colors
                   //                                               .black,
                   //                                         ),
                   //                                       ),
                   //                                     ),
                   //                                   ),
                   //                                   Expanded(
                   //                                     child: Container(
                   //                                       width:
                   //                                       size.width *
                   //                                           0.2,
                   //                                       alignment:
                   //                                       Alignment
                   //                                           .center,
                   //                                       decoration:
                   //                                       BoxDecoration(
                   //                                         border: Border.all(
                   //                                             color: Colors
                   //                                                 .deepPurple),
                   //                                       ),
                   //                                       child: Text(
                   //                                         "",
                   //                                         style:
                   //                                         TextStyle(
                   //                                           color: Colors
                   //                                               .black,
                   //                                         ),
                   //                                       ),
                   //                                     ),
                   //                                   ),
                   //                                   Expanded(
                   //                                     child: Container(
                   //                                       width:
                   //                                       size.width *
                   //                                           0.2,
                   //                                       alignment:
                   //                                       Alignment
                   //                                           .center,
                   //                                       decoration:
                   //                                       BoxDecoration(
                   //                                         border: Border.all(
                   //                                             color: Colors
                   //                                                 .deepPurple),
                   //                                       ),
                   //                                       child: Text(
                   //                                         "",
                   //                                         style:
                   //                                         TextStyle(
                   //                                           color: Colors
                   //                                               .black,
                   //                                         ),
                   //                                       ),
                   //                                     ),
                   //                                   ),
                   //                                 ],
                   //                               ),
                   //                             );
                   //                           },
                   //                         ),
                   //                       ),
                   //                     );
                   //                   },
                   //                 ),
                   //               ),
                   //             ],
                   //           );
                   //         },
                   //       ),
                   //     ),
                   //   ],
                   // )
                   //     : Container(),
                 ],
               ),
             ),
           ),
           bottomNavigationBar: Container(
             decoration: BoxDecoration(
               image: DecorationImage(
                   image: AssetImage('Assets/Images/bg.png'), fit: BoxFit.fill),
             ),
             child: BottomDrawer(),
           ),
         );
       } else if (state is OrderdHistoryFetched) {
         print(state.toString());
         return Scaffold(
           // key: _scaffoldKey,
           appBar: PreferredSize(
             preferredSize:
             Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
             child: Appbar(
               text: 'Order History',
             ),
           ),
           drawer: const MenuDrawer(),
           body: SingleChildScrollView(
             child: Container(
               color: Colors.white,
               child: Column(
                 children: [
                   Container(
                     padding: EdgeInsets.symmetric(horizontal: 25),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Container(
                             alignment: Alignment.centerRight,
                             // margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.03),
                             width: size.width * 0.3,
                             height: size.height * 0.04,
                             decoration: ShapeDecoration(
                                 color: Colors.transparent,
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(2.0),
                                     side: BorderSide(
                                         width: 1, color: pickerPrimaryColor))),
                             child: Container(
                               // margin: EdgeInsets.only(top: size.height * 0.015),
                               alignment: Alignment.center,
                               child: TextField(
                                   controller:
                                   fromController, //editing controller of this TextField
                                   decoration: const InputDecoration(
                                       icon: Icon(Icons
                                           .calendar_today), //icon of text field
                                       hintText:
                                       "From Date" //label text of field
                                   ),
                                   readOnly:
                                   true, // when true user cannot edit text
                                   onTap: () async {
                                     DateTime? pickedDate = await showDatePicker(
                                         context: context,
                                         initialDate:
                                         DateTime.now(), //get today's date
                                         firstDate: DateTime(
                                             2000), //DateTime.now() - not to allow to choose before today.
                                         lastDate: DateTime(2101));
                                     if (pickedDate != null) {
                                       print(
                                           pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                                       String formattedDate =
                                       DateFormat('yyyy-MM-dd').format(
                                           pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                       print(
                                           formattedDate); //formatted date output using intl package =>  2022-07-04
                                       //You can format date as per your need

                                       setState(() {
                                         fromController.text =
                                             formattedDate; //set foratted date to TextField value.
                                       });
                                     } else {
                                       print("Date is not selected");
                                     }
                                   }),
                             )),
                         Container(
                             alignment: Alignment.center,
                             // margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.03),
                             width: size.width * 0.3,
                             height: size.height * 0.04,
                             decoration: ShapeDecoration(
                                 color: Colors.transparent,
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(2.0),
                                     side: BorderSide(
                                         width: 1, color: pickerPrimaryColor))),
                             child: Container(
                               // margin: EdgeInsets.only(top: size.height * 0.015),
                               child: TextField(
                                   controller:
                                   toController, //editing controller of this TextField
                                   decoration: const InputDecoration(
                                       icon: Icon(Icons
                                           .calendar_today), //icon of text field
                                       hintText: "To Date" //label text of field
                                   ),
                                   readOnly:
                                   true, // when true user cannot edit text
                                   onTap: () async {
                                     DateTime? pickedDate = await showDatePicker(
                                         context: context,
                                         initialDate:
                                         DateTime.now(), //get today's date
                                         firstDate: DateTime(
                                             2000), //DateTime.now() - not to allow to choose before today.
                                         lastDate: DateTime(2101));
                                     if (pickedDate != null) {
                                       print(
                                           pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                                       String formattedDate =
                                       DateFormat('yyyy-MM-dd').format(
                                           pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                       print(
                                           formattedDate); //formatted date output using intl package =>  2022-07-04
                                       //You can format date as per your need

                                       setState(() {
                                         toController.text =
                                             formattedDate; //set foratted date to TextField value.
                                       });
                                     } else {
                                       print("Date is not selected");
                                     }
                                   }),
                             )),
                       ],
                     ),
                   ),
                   Container(
                     margin: EdgeInsets.only(
                         top: size.height * 0.01, left: size.width * 0.03),
                     padding: EdgeInsets.all(smallTextPadding),
                     width: size.width / 2,
                     child: ElevatedButton(
                       onPressed: () {
                         if (fromController.text.isNotEmpty &&
                             toController.text.isNotEmpty) {
                           Map<String, String> data = {
                             "id": authData.user_id.toString(),
                             "from_date": fromController.text,
                             "to_date": toController.text
                           };
                           BlocProvider.of<PickerBloc>(context).add(
                               OrderHistoryListEvent(
                                   authData.user_token.toString(), data));
                         }
                       },
                       style: ElevatedButton.styleFrom(
                         primary: pickerPrimaryColor,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10),
                         ),
                         elevation: 15.0,
                       ),
                       child: Text(
                         'Load',
                         style: TextStyle(
                             color: Colors.white,
                             fontSize: 14,
                             fontWeight: FontWeight.w600),
                       ),
                     ),
                   ),
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Container(
                         margin: EdgeInsets.only(top: size.height * 0.03),
                         child: Text(
                           'No of Orders :',
                           style: TextStyle(fontSize: 17),
                         ),
                       ),
                       Container(
                           margin: EdgeInsets.only(
                               top: size.height * 0.03,
                               left: size.width * 0.03,
                               right: size.width * 0.08),
                           width: size.width * 0.1,
                           height: size.height * 0.05,
                           decoration: ShapeDecoration(
                               color: Colors.transparent,
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(2.0),
                                   side: BorderSide(
                                       width: 2, color: pickerPrimaryColor))),
                           child: Center(
                             child: Text(state.tc.orderCount.toString()),
                           )),
                     ],
                   ),
                   Container(
                       margin: EdgeInsets.only(
                         top: size.height * 0.03,
                         bottom: size.height * 0.01,
                       ),
                       width: size.width,
                       height: size.height * 0.15,
                       decoration: ShapeDecoration(
                           color: Colors.white,
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(2.0),
                           )),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Container(
                                 alignment: Alignment.center,
                                 width: size.width * 0.15,
                                 height: size.height * 0.1,
                                 decoration: new BoxDecoration(
                                   color: pickerPrimaryColor,
                                   shape: BoxShape.circle,
                                 ),
                                 child: Text(
                                   '5',
                                   textAlign: TextAlign.center,
                                   style: TextStyle(
                                       color: Colors.white, fontSize: 18),
                                 ),
                               ),
                               Container(
                                 margin: EdgeInsets.only(top: size.width * 0.01),
                                 child: Text(
                                   'VIA APP',
                                   style: TextStyle(
                                       color: Colors.blueAccent,
                                       fontSize: 13,
                                       fontWeight: FontWeight.w700),
                                 ),
                               )
                             ],
                           ),
                           Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Container(
                                 alignment: Alignment.center,
                                 width: size.width * 0.15,
                                 height: size.height * 0.1,
                                 decoration: new BoxDecoration(
                                   color: pickerPrimaryColor,
                                   shape: BoxShape.circle,
                                 ),
                                 child: Text(
                                   '5',
                                   textAlign: TextAlign.center,
                                   style: TextStyle(
                                       color: Colors.white, fontSize: 18),
                                 ),
                               ),
                               Container(
                                 margin: EdgeInsets.only(top: size.width * 0.01),
                                 child: Text(
                                   'VIA CALL',
                                   style: TextStyle(
                                       color: Colors.blueAccent,
                                       fontSize: 13,
                                       fontWeight: FontWeight.w700),
                                 ),
                               )
                             ],
                           ),
                           Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Container(
                                 alignment: Alignment.center,
                                 width: size.width * 0.15,
                                 height: size.height * 0.1,
                                 decoration: new BoxDecoration(
                                   color: pickerPrimaryColor,
                                   shape: BoxShape.circle,
                                 ),
                                 child: Text(
                                   '5',
                                   textAlign: TextAlign.center,
                                   style: TextStyle(
                                       color: Colors.white, fontSize: 18),
                                 ),
                               ),
                               Container(
                                 margin: EdgeInsets.only(top: size.width * 0.01),
                                 child: Text(
                                   'VIA STAFF',
                                   style: TextStyle(
                                       color: Colors.blueAccent,
                                       fontSize: 13,
                                       fontWeight: FontWeight.w700),
                                 ),
                               )
                             ],
                           ),
                           Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Container(
                                 alignment: Alignment.center,
                                 width: size.width * 0.15,
                                 height: size.height * 0.1,
                                 decoration: new BoxDecoration(
                                   color: pickerPrimaryColor,
                                   shape: BoxShape.circle,
                                 ),
                                 child: Text(
                                   '5',
                                   textAlign: TextAlign.center,
                                   style: TextStyle(
                                       color: Colors.white, fontSize: 18),
                                 ),
                               ),
                               Container(
                                 margin: EdgeInsets.only(top: size.width * 0.01),
                                 child: Text(
                                   'NEW CLIENTS',
                                   style: TextStyle(
                                       color: Colors.blueAccent,
                                       fontSize: 13,
                                       fontWeight: FontWeight.w700),
                                 ),
                               )
                             ],
                           )
                         ],
                       )),
                   Align(
                     alignment: Alignment.centerRight,
                     child: Container(
                         alignment: Alignment.centerRight,
                         margin: EdgeInsets.only(
                             top: size.height * 0.03, right: size.width * 0.06),
                         width: size.width * 0.45,
                         height: size.height * 0.045,
                         decoration: ShapeDecoration(
                             color: Colors.transparent,
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(2.0),
                                 side: BorderSide(
                                     width: 2, color: pickerPrimaryColor))),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Container(
                               margin: EdgeInsets.only(left: size.width * 0.02),
                               child: Text(
                                 'Search....',
                               ),
                             ),
                             Container(
                                 decoration:
                                 BoxDecoration(color: pickerLightGreyColor),
                                 child: IconButton(
                                   icon: Icon(
                                     Icons.search,
                                     color: pickerPrimaryColor,
                                     size: 22,
                                   ),
                                   onPressed: () {},
                                 )),
                           ],
                         )),
                   ),
                   SizedBox(
                     height: size.height * 0.05,
                   ),
                   if (state.data.length > 0)
                   // Container(
                   //   margin: EdgeInsets.symmetric(
                   //       horizontal: size.width * 0.02),
                   //   height: size.height * 0.22,
                   //   width: MediaQuery.of(context).size.width *
                   //       0.9, // Increased width
                   //   child: ListView.builder(
                   //     itemCount: 1,
                   //     padding: EdgeInsets.zero,
                   //     scrollDirection: Axis.horizontal,
                   //     physics: const ClampingScrollPhysics(),
                   //     itemBuilder: (context, index) {
                   //       return Column(
                   //         children: [
                   //           Container(
                   //             margin: EdgeInsets.symmetric(
                   //                 horizontal: size.width * 0.05),
                   //             height: size.height * 0.08,
                   //             width: MediaQuery.of(context).size.width /
                   //                 0.8, // Increased width
                   //             child: Row(
                   //               children: [
                   //                 Expanded(
                   //                   child: Container(
                   //                     alignment: Alignment.center,
                   //                     decoration: BoxDecoration(
                   //                       border: Border.all(
                   //                           color: Colors.deepPurple),
                   //                     ),
                   //                     child: Text(
                   //                       " Sl No",
                   //                       style: TextStyle(
                   //                         color: Colors.deepPurple,
                   //                         fontWeight: FontWeight.bold,
                   //                       ),
                   //                     ),
                   //                   ),
                   //                 ),
                   //                 Expanded(
                   //                   child: Container(
                   //                     alignment: Alignment.center,
                   //                     decoration: BoxDecoration(
                   //                       border: Border.all(
                   //                           color: Colors.deepPurple),
                   //                     ),
                   //                     child: Text(
                   //                       "Order No",
                   //                       style: TextStyle(
                   //                         color: Colors.deepPurple,
                   //                         fontWeight: FontWeight.bold,
                   //                       ),
                   //                     ),
                   //                   ),
                   //                 ),
                   //                 Expanded(
                   //                   child: Container(
                   //                     alignment: Alignment.center,
                   //                     decoration: BoxDecoration(
                   //                       border: Border.all(
                   //                           color: Colors.deepPurple),
                   //                     ),
                   //                     child: Text(
                   //                       "Client Name",
                   //                       style: TextStyle(
                   //                         color: Colors.deepPurple,
                   //                         fontWeight: FontWeight.bold,
                   //                       ),
                   //                     ),
                   //                   ),
                   //                 ),
                   //                 Expanded(
                   //                   child: Container(
                   //                     alignment: Alignment.center,
                   //                     decoration: BoxDecoration(
                   //                       border: Border.all(
                   //                           color: Colors.deepPurple),
                   //                     ),
                   //                     child: Text(
                   //                       "Location",
                   //                       style: TextStyle(
                   //                         color: Colors.deepPurple,
                   //                         fontWeight: FontWeight.bold,
                   //                       ),
                   //                     ),
                   //                   ),
                   //                 ),
                   //                 Expanded(
                   //                   child: Container(
                   //                     alignment: Alignment.center,
                   //                     decoration: BoxDecoration(
                   //                       border: Border.all(
                   //                           color: Colors.deepPurple),
                   //                     ),
                   //                     child: Text(
                   //                       "Building.No",
                   //                       style: TextStyle(
                   //                         color: Colors.deepPurple,
                   //                         fontWeight: FontWeight.bold,
                   //                       ),
                   //                     ),
                   //                   ),
                   //                 ),
                   //                 Expanded(
                   //                   child: Container(
                   //                     alignment: Alignment.center,
                   //                     decoration: BoxDecoration(
                   //                       border: Border.all(
                   //                           color: Colors.deepPurple),
                   //                     ),
                   //                     child: Text(
                   //                       "Status",
                   //                       style: TextStyle(
                   //                         color: Colors.deepPurple,
                   //                         fontWeight: FontWeight.bold,
                   //                       ),
                   //                     ),
                   //                   ),
                   //                 ),
                   //                 Expanded(
                   //                   child: Container(
                   //                     alignment: Alignment.center,
                   //                     decoration: BoxDecoration(
                   //                       border: Border.all(
                   //                           color: Colors.deepPurple),
                   //                     ),
                   //                     child: Text(
                   //                       "Delivery Time",
                   //                       style: TextStyle(
                   //                         color: Colors.deepPurple,
                   //                         fontWeight: FontWeight.bold,
                   //                       ),
                   //                     ),
                   //                   ),
                   //                 ),
                   //               ],
                   //             ),
                   //           ),
                   //           Container(
                   //             height: size.height * 0.13,
                   //             width: MediaQuery.of(context).size.width *
                   //                 1.35,
                   //             child: ListView.builder(
                   //               padding: EdgeInsets.zero,
                   //               scrollDirection: Axis.vertical,
                   //               physics: const ClampingScrollPhysics(),
                   //               itemCount: state.data.length,
                   //               itemBuilder: (BuildContext context,
                   //                   int rowIndex) {
                   //                 return GestureDetector(
                   //                   onTap: () {
                   //                     setState(() {
                   //                       clicked = true;
                   //                     });
                   //
                   //                   },
                   //                   child: SizedBox(
                   //                     height: size.height * 0.05,
                   //                     width: MediaQuery.of(context)
                   //                             .size
                   //                             .width *
                   //                         1.5,
                   //                     child: ListView.builder(
                   //                       itemCount: 1,
                   //                       scrollDirection: Axis.vertical,
                   //                       itemBuilder: (context, index) {
                   //                         return Container(
                   //                           margin:
                   //                               EdgeInsets.symmetric(
                   //                                   horizontal:
                   //                                       size.width *
                   //                                           0.05),
                   //                           height: size.height * 0.05,
                   //                           width:
                   //                               MediaQuery.of(context)
                   //                                       .size
                   //                                       .width *
                   //                                   1.5,
                   //                           // Increased width
                   //                           child: Row(
                   //                             children: [
                   //                               Expanded(
                   //                                 child: Container(
                   //                                   width: size.width *
                   //                                       0.15,
                   //                                   alignment: Alignment
                   //                                       .center,
                   //                                   decoration:
                   //                                       BoxDecoration(
                   //                                     border: Border.all(
                   //                                         color: Colors
                   //                                             .deepPurple),
                   //                                   ),
                   //                                   child: Text(
                   //                                    (rowIndex+1).toString(),
                   //                                     style: TextStyle(
                   //                                       color: Colors
                   //                                           .black,
                   //                                     ),
                   //                                   ),
                   //                                 ),
                   //                               ),
                   //                               Expanded(
                   //                                 child: Container(
                   //                                   width: size.width *
                   //                                       0.15,
                   //                                   alignment: Alignment
                   //                                       .center,
                   //                                   decoration:
                   //                                       BoxDecoration(
                   //                                     border: Border.all(
                   //                                         color: Colors
                   //                                             .deepPurple),
                   //                                   ),
                   //                                   child: Text(
                   //                                     state.data[index].orderNumber,
                   //                                     style: TextStyle(
                   //                                       color: Colors
                   //                                           .black,
                   //                                     ),
                   //                                   ),
                   //                                 ),
                   //                               ),
                   //                               Expanded(
                   //                                 child: Container(
                   //                                   width: size.width *
                   //                                       0.15,
                   //                                   alignment: Alignment
                   //                                       .center,
                   //                                   decoration:
                   //                                       BoxDecoration(
                   //                                     border: Border.all(
                   //                                         color: Colors
                   //                                             .deepPurple),
                   //                                   ),
                   //                                   child: Text(
                   //                                     state.data[index].customer.name,
                   //                                     style: TextStyle(
                   //                                       color: Colors
                   //                                           .black,
                   //                                     ),
                   //                                   ),
                   //                                 ),
                   //                               ),
                   //                               Expanded(
                   //                                 child: Container(
                   //                                   width: size.width *
                   //                                       0.15,
                   //                                   alignment: Alignment
                   //                                       .center,
                   //                                   decoration:
                   //                                       BoxDecoration(
                   //                                     border: Border.all(
                   //                                         color: Colors
                   //                                             .deepPurple),
                   //                                   ),
                   //                                   child: Text(
                   //                                     state.data[index].customer.location.name,
                   //                                     style: TextStyle(
                   //                                       color: Colors
                   //                                           .black,
                   //                                     ),
                   //                                   ),
                   //                                 ),
                   //                               ),
                   //                               Expanded(
                   //                                 child: Container(
                   //                                   width: size.width *
                   //                                       0.15,
                   //                                   alignment: Alignment
                   //                                       .center,
                   //                                   decoration:
                   //                                       BoxDecoration(
                   //                                     border: Border.all(
                   //                                         color: Colors
                   //                                             .deepPurple),
                   //                                   ),
                   //                                   child: Text(
                   //                                     state.data[index].customer.buildingNo,
                   //                                     style: TextStyle(
                   //                                       color: Colors
                   //                                           .black,
                   //                                     ),
                   //                                   ),
                   //                                 ),
                   //                               ),
                   //                               Expanded(
                   //                                 child: Container(
                   //                                   width: size.width *
                   //                                       0.15,
                   //                                   alignment: Alignment
                   //                                       .center,
                   //                                   decoration:
                   //                                       BoxDecoration(
                   //                                     border: Border.all(
                   //                                         color: Colors
                   //                                             .deepPurple),
                   //                                   ),
                   //                                   child: Text(
                   //                                     state.data[index].status,
                   //                                     style: TextStyle(
                   //                                       color: Colors
                   //                                           .black,
                   //                                     ),
                   //                                   ),
                   //                                 ),
                   //                               ),
                   //                               Expanded(
                   //                                 child: Container(
                   //                                   width: size.width *
                   //                                       0.15,
                   //                                   alignment: Alignment
                   //                                       .center,
                   //                                   decoration:
                   //                                       BoxDecoration(
                   //                                     border: Border.all(
                   //                                         color: Colors
                   //                                             .deepPurple),
                   //                                   ),
                   //                                   child: Text(
                   //                                     "0",
                   //                                     style: TextStyle(
                   //                                       color: Colors
                   //                                           .black,
                   //                                     ),
                   //                                   ),
                   //                                 ),
                   //                               ),
                   //                             ],
                   //                           ),
                   //                         );
                   //                       },
                   //                     ),
                   //                   ),
                   //                 );
                   //               },
                   //             ),
                   //           ),
                   //         ],
                   //       );
                   //     },
                   //   ),
                   // ),
                   SingleChildScrollView(
                     padding: EdgeInsets.symmetric(horizontal: 16.0),
                     scrollDirection: Axis.vertical,
                     child: SingleChildScrollView(
                       scrollDirection: Axis.horizontal,
                       child: DataTable(
                         showCheckboxColumn: false,
                         border: TableBorder.all(color: pickerPrimaryColor),
                         columns: [
                           DataColumn(label: Center(child: Text('Sl.No'))),
                           DataColumn(label: Center(child: Text('Ord.No'))),
                           DataColumn(label: Center(child: Text('Order Date'))),
                           DataColumn(label: Center(child: Text('Client Name'))),
                           DataColumn(label: Center(child: Text('Pickup Date'))),
                           DataColumn(label: Center(child: Text('Pickup Time'))),
                           DataColumn(label: Center(child: Text('Status'))),
                         ],
                         rows: List<DataRow>.generate(
                            state.data.length,
                           (index) {
                              final tableData = state.data[index];
                             return DataRow(
                               onSelectChanged: (value) {
                                 checker = 0;
                                 if (!clicked) {
                                   setState(() {
                                     clicked = true;
                                   });
                                 } else {
                                   setState(() {
                                     clicked = false;
                                     showData = false;
                                   });
                                 }

                                 if (clicked) {

                                   BlocProvider.of<PickerBloc>(context).add(OrderDetailsEvent(authData.user_token.toString(), tableData.orderNumber));
                                 }
                               },
                               cells: [
                                 DataCell(Center(child: Text((index + 1).toString()))),
                                 DataCell(Center(child: Text(tableData.orderNumber))),
                                 DataCell(Center(child: Text(DateFormat('yyyy-MM-dd').format(tableData.orderDate).toString()))),
                                 DataCell(Center(child: Text(tableData.customer.name))),
                                 DataCell(Center(child: Text(DateFormat('yyyy-MM-dd').format(tableData.pickupDate).toString()))),
                                 DataCell(Center(child: Text(tableData.pickupTime))),
                                 DataCell(Center(child: Text(tableData.status))),
                               ]
                             );
                           },
                         ),
                       ),
                     ),
                   ),
                   if (showData)
                     Column(
                       children: [
                         Icon(
                           Icons.keyboard_double_arrow_down_outlined,
                           color: pickerPrimaryColor,
                         ),
                         Icon(
                           Icons.keyboard_double_arrow_down_outlined,
                           color: pickerPrimaryColor,
                         ),
                       ],
                     ),
                   BlocBuilder<PickerBloc, PickerState>(
                     builder: (context, st) {
                       if (st is OrderDetailsFetched) {
                         showData = true;
                         if (clicked) {
                           return SingleChildScrollView(
                             padding: EdgeInsets.symmetric(horizontal: 16.0),
                             scrollDirection: Axis.vertical,
                             child: SingleChildScrollView(
                               scrollDirection: Axis.horizontal,
                               child: DataTable(
                                 border: TableBorder.all(color: pickerPrimaryColor),
                                 columns: [
                                   DataColumn(label: Center(child: Text('Order No'))),
                                   DataColumn(label: Center(child: Text('Pickup Mode'))),
                                   DataColumn(label: Center(child: Text('Order Type'))),
                                   DataColumn(label: Center(child: Text('Del.Date'))),
                                   DataColumn(label: Center(child: Text('Del.Time'))),
                                   DataColumn(label: Center(child: Text('Amount'))),
                                 ],
                                 rows: [
                                   DataRow(
                                     cells: [
                                       DataCell(Center(child: Text(st.finalData.orderNumber))),
                                       DataCell(Center(child: Text(st.finalData.pickupMode))),
                                       DataCell(Center(child: Text(st.finalData.orderType))),
                                       DataCell(Center(child: Text(st.finalData.deliveryDate ?? ''))),
                                       DataCell(Center(child: Text(st.finalData.deliveryTime ?? ''))),
                                       DataCell(Center(child: Text(st.finalData.totalAmount ?? ''))),
                                     ]
                                   ),
                                 ],
                               ),
                             ),
                           );
                         } else {
                           return Container();
                         }
                       } else {
                         return Container();
                       }
                     },
                   ),
                   SizedBox(
                     height: size.height * 0.05,
                   ),
                   // clicked == true
                   //     ? Column(
                   //   children: [
                   //     Icon(
                   //       Icons.keyboard_double_arrow_down_outlined,
                   //       color: pickerPrimaryColor,
                   //     ),
                   //     Icon(
                   //       Icons.keyboard_double_arrow_down_outlined,
                   //       color: pickerPrimaryColor,
                   //     ),
                   //   ],
                   // )
                   //     : Container(),
                   // SizedBox(
                   //   height: size.height * 0.05,
                   // ),
                   // clicked == true
                   //     ? Row(
                   //   mainAxisAlignment: MainAxisAlignment.start,
                   //   children: [
                   //     Container(
                   //       margin: EdgeInsets.symmetric(
                   //           horizontal: size.width * 0.02),
                   //       height: size.height * 0.22,
                   //       width: MediaQuery.of(context).size.width *
                   //           0.8, // Increased width
                   //       child: ListView.builder(
                   //         itemCount: 1,
                   //         padding: EdgeInsets.zero,
                   //         scrollDirection: Axis.horizontal,
                   //         physics: const ClampingScrollPhysics(),
                   //         itemBuilder: (context, index) {
                   //           return Column(
                   //             children: [
                   //               Container(
                   //                 margin: EdgeInsets.symmetric(
                   //                     horizontal: size.width * 0.05),
                   //                 height: size.height * 0.08,
                   //                 width:
                   //                 MediaQuery.of(context).size.width *
                   //                     0.85, // Increased width
                   //                 child: Row(
                   //                   children: [
                   //                     Expanded(
                   //                       child: Container(
                   //                         alignment: Alignment.center,
                   //                         decoration: BoxDecoration(
                   //                           border: Border.all(
                   //                               color: Colors.deepPurple),
                   //                         ),
                   //                         child: Text(
                   //                           " Sl No",
                   //                           style: TextStyle(
                   //                             color: Colors.deepPurple,
                   //                             fontWeight: FontWeight.bold,
                   //                           ),
                   //                         ),
                   //                       ),
                   //                     ),
                   //                     Expanded(
                   //                       child: Container(
                   //                         alignment: Alignment.center,
                   //                         decoration: BoxDecoration(
                   //                           border: Border.all(
                   //                               color: Colors.deepPurple),
                   //                         ),
                   //                         child: Text(
                   //                           "Category",
                   //                           style: TextStyle(
                   //                             color: Colors.deepPurple,
                   //                             fontWeight: FontWeight.bold,
                   //                           ),
                   //                         ),
                   //                       ),
                   //                     ),
                   //                     Expanded(
                   //                       child: Container(
                   //                         alignment: Alignment.center,
                   //                         decoration: BoxDecoration(
                   //                           border: Border.all(
                   //                               color: Colors.deepPurple),
                   //                         ),
                   //                         child: Text(
                   //                           "Item Name",
                   //                           style: TextStyle(
                   //                             color: Colors.deepPurple,
                   //                             fontWeight: FontWeight.bold,
                   //                           ),
                   //                         ),
                   //                       ),
                   //                     ),
                   //                     Expanded(
                   //                       child: Container(
                   //                         alignment: Alignment.center,
                   //                         decoration: BoxDecoration(
                   //                           border: Border.all(
                   //                               color: Colors.deepPurple),
                   //                         ),
                   //                         child: Text(
                   //                           "Qty",
                   //                           style: TextStyle(
                   //                             color: Colors.deepPurple,
                   //                             fontWeight: FontWeight.bold,
                   //                           ),
                   //                         ),
                   //                       ),
                   //                     ),
                   //                   ],
                   //                 ),
                   //               ),
                   //               Container(
                   //                 height: size.height * 0.13,
                   //                 width:
                   //                 MediaQuery.of(context).size.width *
                   //                     0.85,
                   //                 child: ListView.builder(
                   //                   padding: EdgeInsets.zero,
                   //                   scrollDirection: Axis.vertical,
                   //                   physics:
                   //                   const ClampingScrollPhysics(),
                   //                   itemCount: 2,
                   //                   itemBuilder: (BuildContext context,
                   //                       int rowIndex) {
                   //                     return GestureDetector(
                   //                       onTap: () {
                   //                         setState(() {
                   //                           clicked = true;
                   //                         });
                   //                       },
                   //                       child: SizedBox(
                   //                         height: size.height * 0.05,
                   //                         width: MediaQuery.of(context)
                   //                             .size
                   //                             .width *
                   //                             0.55,
                   //                         child: ListView.builder(
                   //                           itemCount: 1,
                   //                           scrollDirection:
                   //                           Axis.vertical,
                   //                           itemBuilder:
                   //                               (context, index) {
                   //                             return Container(
                   //                               height:
                   //                               size.height * 0.05,
                   //                               width:
                   //                               MediaQuery.of(context)
                   //                                   .size
                   //                                   .width *
                   //                                   1.85,
                   //                               // Increased width
                   //                               child: Row(
                   //                                 children: [
                   //                                   Expanded(
                   //                                     child: Container(
                   //                                       width:
                   //                                       size.width *
                   //                                           0.2,
                   //                                       alignment:
                   //                                       Alignment
                   //                                           .center,
                   //                                       decoration:
                   //                                       BoxDecoration(
                   //                                         border: Border.all(
                   //                                             color: Colors
                   //                                                 .deepPurple),
                   //                                       ),
                   //                                       child: Text(
                   //                                         "",
                   //                                         style:
                   //                                         TextStyle(
                   //                                           color: Colors
                   //                                               .black,
                   //                                         ),
                   //                                       ),
                   //                                     ),
                   //                                   ),
                   //                                   Expanded(
                   //                                     child: Container(
                   //                                       width:
                   //                                       size.width *
                   //                                           0.2,
                   //                                       alignment:
                   //                                       Alignment
                   //                                           .center,
                   //                                       decoration:
                   //                                       BoxDecoration(
                   //                                         border: Border.all(
                   //                                             color: Colors
                   //                                                 .deepPurple),
                   //                                       ),
                   //                                       child: Text(
                   //                                         "",
                   //                                         style:
                   //                                         TextStyle(
                   //                                           color: Colors
                   //                                               .black,
                   //                                         ),
                   //                                       ),
                   //                                     ),
                   //                                   ),
                   //                                   Expanded(
                   //                                     child: Container(
                   //                                       width:
                   //                                       size.width *
                   //                                           0.2,
                   //                                       alignment:
                   //                                       Alignment
                   //                                           .center,
                   //                                       decoration:
                   //                                       BoxDecoration(
                   //                                         border: Border.all(
                   //                                             color: Colors
                   //                                                 .deepPurple),
                   //                                       ),
                   //                                       child: Text(
                   //                                         "",
                   //                                         style:
                   //                                         TextStyle(
                   //                                           color: Colors
                   //                                               .black,
                   //                                         ),
                   //                                       ),
                   //                                     ),
                   //                                   ),
                   //                                   Expanded(
                   //                                     child: Container(
                   //                                       width:
                   //                                       size.width *
                   //                                           0.2,
                   //                                       alignment:
                   //                                       Alignment
                   //                                           .center,
                   //                                       decoration:
                   //                                       BoxDecoration(
                   //                                         border: Border.all(
                   //                                             color: Colors
                   //                                                 .deepPurple),
                   //                                       ),
                   //                                       child: Text(
                   //                                         "",
                   //                                         style:
                   //                                         TextStyle(
                   //                                           color: Colors
                   //                                               .black,
                   //                                         ),
                   //                                       ),
                   //                                     ),
                   //                                   ),
                   //                                 ],
                   //                               ),
                   //                             );
                   //                           },
                   //                         ),
                   //                       ),
                   //                     );
                   //                   },
                   //                 ),
                   //               ),
                   //             ],
                   //           );
                   //         },
                   //       ),
                   //     ),
                   //   ],
                   // )
                   //     : Container(),
                 ],
               ),
             ),
           ),
           bottomNavigationBar: Container(
             decoration: BoxDecoration(
               image: DecorationImage(
                   image: AssetImage('Assets/Images/bg.png'), fit: BoxFit.fill),
             ),
             child: BottomDrawer(),
           ),
         );
       } else {
         print(state.toString());
         return Scaffold(
           // key: _scaffoldKey,
           appBar: PreferredSize(
             preferredSize:
             Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
             child: Appbar(
               text: 'Order History',
             ),
           ),
           drawer: const MenuDrawer(),
           body: SingleChildScrollView(
             child: Container(
               color: Colors.white,
               child: Column(
                 children: [
                   Container(
                     padding: EdgeInsets.symmetric(horizontal: 25),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Container(
                             alignment: Alignment.centerRight,
                             // margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.03),
                             width: size.width * 0.3,
                             height: size.height * 0.04,
                             decoration: ShapeDecoration(
                                 color: Colors.transparent,
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(2.0),
                                     side: BorderSide(
                                         width: 1, color: pickerPrimaryColor))),
                             child: Container(
                               // margin: EdgeInsets.only(top: size.height * 0.015),
                               alignment: Alignment.center,
                               child: TextField(
                                   controller:
                                   fromController, //editing controller of this TextField
                                   decoration: const InputDecoration(
                                       icon: Icon(Icons
                                           .calendar_today), //icon of text field
                                       hintText:
                                       "From Date" //label text of field
                                   ),
                                   readOnly:
                                   true, // when true user cannot edit text
                                   onTap: () async {
                                     DateTime? pickedDate = await showDatePicker(
                                         context: context,
                                         initialDate:
                                         DateTime.now(), //get today's date
                                         firstDate: DateTime(
                                             2000), //DateTime.now() - not to allow to choose before today.
                                         lastDate: DateTime(2101));
                                     if (pickedDate != null) {
                                       print(
                                           pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                                       String formattedDate =
                                       DateFormat('yyyy-MM-dd').format(
                                           pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                       print(
                                           formattedDate); //formatted date output using intl package =>  2022-07-04
                                       //You can format date as per your need

                                       setState(() {
                                         fromController.text =
                                             formattedDate; //set foratted date to TextField value.
                                       });
                                     } else {
                                       print("Date is not selected");
                                     }
                                   }),
                             )),
                         Container(
                             alignment: Alignment.center,
                             // margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.03),
                             width: size.width * 0.3,
                             height: size.height * 0.04,
                             decoration: ShapeDecoration(
                                 color: Colors.transparent,
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(2.0),
                                     side: BorderSide(
                                         width: 1, color: pickerPrimaryColor))),
                             child: Container(
                               // margin: EdgeInsets.only(top: size.height * 0.015),
                               child: TextField(
                                   controller:
                                   toController, //editing controller of this TextField
                                   decoration: const InputDecoration(
                                       icon: Icon(Icons
                                           .calendar_today), //icon of text field
                                       hintText: "To Date" //label text of field
                                   ),
                                   readOnly:
                                   true, // when true user cannot edit text
                                   onTap: () async {
                                     DateTime? pickedDate = await showDatePicker(
                                         context: context,
                                         initialDate:
                                         DateTime.now(), //get today's date
                                         firstDate: DateTime(
                                             2000), //DateTime.now() - not to allow to choose before today.
                                         lastDate: DateTime(2101));
                                     if (pickedDate != null) {
                                       print(
                                           pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                                       String formattedDate =
                                       DateFormat('yyyy-MM-dd').format(
                                           pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                       print(
                                           formattedDate); //formatted date output using intl package =>  2022-07-04
                                       //You can format date as per your need

                                       setState(() {
                                         toController.text =
                                             formattedDate; //set foratted date to TextField value.
                                       });
                                     } else {
                                       print("Date is not selected");
                                     }
                                   }),
                             )),
                       ],
                     ),
                   ),
                   Container(
                     margin: EdgeInsets.only(
                         top: size.height * 0.01, left: size.width * 0.03),
                     padding: EdgeInsets.all(smallTextPadding),
                     width: size.width / 2,
                     child: ElevatedButton(
                       onPressed: () {
                         if (fromController.text.isNotEmpty &&
                             toController.text.isNotEmpty) {
                           Map<String, String> data = {
                             "id": authData.user_id.toString(),
                             "from_date": fromController.text,
                             "to_date": toController.text
                           };
                           BlocProvider.of<PickerBloc>(context).add(
                               OrderHistoryListEvent(
                                   authData.user_token.toString(), data));
                         }
                       },
                       style: ElevatedButton.styleFrom(
                         primary: pickerPrimaryColor,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10),
                         ),
                         elevation: 15.0,
                       ),
                       child: Text(
                         'Load',
                         style: TextStyle(
                             color: Colors.white,
                             fontSize: 14,
                             fontWeight: FontWeight.w600),
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 120,
                   ),
                   Center(child: Text("No Data!"),),
                   // Row(
                   //   crossAxisAlignment: CrossAxisAlignment.center,
                   //   mainAxisAlignment: MainAxisAlignment.center,
                   //   children: [
                   //     Container(
                   //       margin: EdgeInsets.only(top: size.height * 0.03),
                   //       child: Text(
                   //         'No of Orders :',
                   //         style: TextStyle(fontSize: 17),
                   //       ),
                   //     ),
                   //     Container(
                   //         margin: EdgeInsets.only(
                   //             top: size.height * 0.03,
                   //             left: size.width * 0.03,
                   //             right: size.width * 0.08),
                   //         width: size.width * 0.1,
                   //         height: size.height * 0.05,
                   //         decoration: ShapeDecoration(
                   //             color: Colors.transparent,
                   //             shape: RoundedRectangleBorder(
                   //                 borderRadius: BorderRadius.circular(2.0),
                   //                 side: BorderSide(
                   //                     width: 2, color: pickerPrimaryColor))),
                   //         child: Center(
                   //           child: Text("15"),
                   //         )),
                   //   ],
                   // ),
                   // Container(
                   //     margin: EdgeInsets.only(
                   //       top: size.height * 0.03,
                   //       bottom: size.height * 0.01,
                   //     ),
                   //     width: size.width,
                   //     height: size.height * 0.15,
                   //     decoration: ShapeDecoration(
                   //         color: Colors.white,
                   //         shape: RoundedRectangleBorder(
                   //           borderRadius: BorderRadius.circular(2.0),
                   //         )),
                   //     child: Row(
                   //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                   //       children: [
                   //         Column(
                   //           mainAxisAlignment: MainAxisAlignment.center,
                   //           children: [
                   //             Container(
                   //               alignment: Alignment.center,
                   //               width: size.width * 0.15,
                   //               height: size.height * 0.1,
                   //               decoration: new BoxDecoration(
                   //                 color: pickerPrimaryColor,
                   //                 shape: BoxShape.circle,
                   //               ),
                   //               child: Text(
                   //                 '5',
                   //                 textAlign: TextAlign.center,
                   //                 style: TextStyle(
                   //                     color: Colors.white, fontSize: 18),
                   //               ),
                   //             ),
                   //             Container(
                   //               margin: EdgeInsets.only(top: size.width * 0.01),
                   //               child: Text(
                   //                 'VIA APP',
                   //                 style: TextStyle(
                   //                     color: Colors.blueAccent,
                   //                     fontSize: 13,
                   //                     fontWeight: FontWeight.w700),
                   //               ),
                   //             )
                   //           ],
                   //         ),
                   //         Column(
                   //           mainAxisAlignment: MainAxisAlignment.center,
                   //           children: [
                   //             Container(
                   //               alignment: Alignment.center,
                   //               width: size.width * 0.15,
                   //               height: size.height * 0.1,
                   //               decoration: new BoxDecoration(
                   //                 color: pickerPrimaryColor,
                   //                 shape: BoxShape.circle,
                   //               ),
                   //               child: Text(
                   //                 '5',
                   //                 textAlign: TextAlign.center,
                   //                 style: TextStyle(
                   //                     color: Colors.white, fontSize: 18),
                   //               ),
                   //             ),
                   //             Container(
                   //               margin: EdgeInsets.only(top: size.width * 0.01),
                   //               child: Text(
                   //                 'VIA CALL',
                   //                 style: TextStyle(
                   //                     color: Colors.blueAccent,
                   //                     fontSize: 13,
                   //                     fontWeight: FontWeight.w700),
                   //               ),
                   //             )
                   //           ],
                   //         ),
                   //         Column(
                   //           mainAxisAlignment: MainAxisAlignment.center,
                   //           children: [
                   //             Container(
                   //               alignment: Alignment.center,
                   //               width: size.width * 0.15,
                   //               height: size.height * 0.1,
                   //               decoration: new BoxDecoration(
                   //                 color: pickerPrimaryColor,
                   //                 shape: BoxShape.circle,
                   //               ),
                   //               child: Text(
                   //                 '5',
                   //                 textAlign: TextAlign.center,
                   //                 style: TextStyle(
                   //                     color: Colors.white, fontSize: 18),
                   //               ),
                   //             ),
                   //             Container(
                   //               margin: EdgeInsets.only(top: size.width * 0.01),
                   //               child: Text(
                   //                 'VIA STAFF',
                   //                 style: TextStyle(
                   //                     color: Colors.blueAccent,
                   //                     fontSize: 13,
                   //                     fontWeight: FontWeight.w700),
                   //               ),
                   //             )
                   //           ],
                   //         ),
                   //         Column(
                   //           mainAxisAlignment: MainAxisAlignment.center,
                   //           children: [
                   //             Container(
                   //               alignment: Alignment.center,
                   //               width: size.width * 0.15,
                   //               height: size.height * 0.1,
                   //               decoration: new BoxDecoration(
                   //                 color: pickerPrimaryColor,
                   //                 shape: BoxShape.circle,
                   //               ),
                   //               child: Text(
                   //                 '5',
                   //                 textAlign: TextAlign.center,
                   //                 style: TextStyle(
                   //                     color: Colors.white, fontSize: 18),
                   //               ),
                   //             ),
                   //             Container(
                   //               margin: EdgeInsets.only(top: size.width * 0.01),
                   //               child: Text(
                   //                 'NEW CLIENTS',
                   //                 style: TextStyle(
                   //                     color: Colors.blueAccent,
                   //                     fontSize: 13,
                   //                     fontWeight: FontWeight.w700),
                   //               ),
                   //             )
                   //           ],
                   //         )
                   //       ],
                   //     )),
                   // Align(
                   //   alignment: Alignment.centerRight,
                   //   child: Container(
                   //       alignment: Alignment.centerRight,
                   //       margin: EdgeInsets.only(
                   //           top: size.height * 0.03, right: size.width * 0.06),
                   //       width: size.width * 0.45,
                   //       height: size.height * 0.045,
                   //       decoration: ShapeDecoration(
                   //           color: Colors.transparent,
                   //           shape: RoundedRectangleBorder(
                   //               borderRadius: BorderRadius.circular(2.0),
                   //               side: BorderSide(
                   //                   width: 2, color: pickerPrimaryColor))),
                   //       child: Row(
                   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   //         crossAxisAlignment: CrossAxisAlignment.center,
                   //         children: [
                   //           Container(
                   //             margin: EdgeInsets.only(left: size.width * 0.02),
                   //             child: Text(
                   //               'Search....',
                   //             ),
                   //           ),
                   //           Container(
                   //               decoration:
                   //               BoxDecoration(color: pickerLightGreyColor),
                   //               child: IconButton(
                   //                 icon: Icon(
                   //                   Icons.search,
                   //                   color: pickerPrimaryColor,
                   //                   size: 22,
                   //                 ),
                   //                 onPressed: () {},
                   //               )),
                   //         ],
                   //       )),
                   // ),
                   // SizedBox(
                   //   height: size.height * 0.05,
                   // ),
                   // // if (state.data.length > 0)
                   // // Container(
                   // //   margin: EdgeInsets.symmetric(
                   // //       horizontal: size.width * 0.02),
                   // //   height: size.height * 0.22,
                   // //   width: MediaQuery.of(context).size.width *
                   // //       0.9, // Increased width
                   // //   child: ListView.builder(
                   // //     itemCount: 1,
                   // //     padding: EdgeInsets.zero,
                   // //     scrollDirection: Axis.horizontal,
                   // //     physics: const ClampingScrollPhysics(),
                   // //     itemBuilder: (context, index) {
                   // //       return Column(
                   // //         children: [
                   // //           Container(
                   // //             margin: EdgeInsets.symmetric(
                   // //                 horizontal: size.width * 0.05),
                   // //             height: size.height * 0.08,
                   // //             width: MediaQuery.of(context).size.width /
                   // //                 0.8, // Increased width
                   // //             child: Row(
                   // //               children: [
                   // //                 Expanded(
                   // //                   child: Container(
                   // //                     alignment: Alignment.center,
                   // //                     decoration: BoxDecoration(
                   // //                       border: Border.all(
                   // //                           color: Colors.deepPurple),
                   // //                     ),
                   // //                     child: Text(
                   // //                       " Sl No",
                   // //                       style: TextStyle(
                   // //                         color: Colors.deepPurple,
                   // //                         fontWeight: FontWeight.bold,
                   // //                       ),
                   // //                     ),
                   // //                   ),
                   // //                 ),
                   // //                 Expanded(
                   // //                   child: Container(
                   // //                     alignment: Alignment.center,
                   // //                     decoration: BoxDecoration(
                   // //                       border: Border.all(
                   // //                           color: Colors.deepPurple),
                   // //                     ),
                   // //                     child: Text(
                   // //                       "Order No",
                   // //                       style: TextStyle(
                   // //                         color: Colors.deepPurple,
                   // //                         fontWeight: FontWeight.bold,
                   // //                       ),
                   // //                     ),
                   // //                   ),
                   // //                 ),
                   // //                 Expanded(
                   // //                   child: Container(
                   // //                     alignment: Alignment.center,
                   // //                     decoration: BoxDecoration(
                   // //                       border: Border.all(
                   // //                           color: Colors.deepPurple),
                   // //                     ),
                   // //                     child: Text(
                   // //                       "Client Name",
                   // //                       style: TextStyle(
                   // //                         color: Colors.deepPurple,
                   // //                         fontWeight: FontWeight.bold,
                   // //                       ),
                   // //                     ),
                   // //                   ),
                   // //                 ),
                   // //                 Expanded(
                   // //                   child: Container(
                   // //                     alignment: Alignment.center,
                   // //                     decoration: BoxDecoration(
                   // //                       border: Border.all(
                   // //                           color: Colors.deepPurple),
                   // //                     ),
                   // //                     child: Text(
                   // //                       "Location",
                   // //                       style: TextStyle(
                   // //                         color: Colors.deepPurple,
                   // //                         fontWeight: FontWeight.bold,
                   // //                       ),
                   // //                     ),
                   // //                   ),
                   // //                 ),
                   // //                 Expanded(
                   // //                   child: Container(
                   // //                     alignment: Alignment.center,
                   // //                     decoration: BoxDecoration(
                   // //                       border: Border.all(
                   // //                           color: Colors.deepPurple),
                   // //                     ),
                   // //                     child: Text(
                   // //                       "Building.No",
                   // //                       style: TextStyle(
                   // //                         color: Colors.deepPurple,
                   // //                         fontWeight: FontWeight.bold,
                   // //                       ),
                   // //                     ),
                   // //                   ),
                   // //                 ),
                   // //                 Expanded(
                   // //                   child: Container(
                   // //                     alignment: Alignment.center,
                   // //                     decoration: BoxDecoration(
                   // //                       border: Border.all(
                   // //                           color: Colors.deepPurple),
                   // //                     ),
                   // //                     child: Text(
                   // //                       "Status",
                   // //                       style: TextStyle(
                   // //                         color: Colors.deepPurple,
                   // //                         fontWeight: FontWeight.bold,
                   // //                       ),
                   // //                     ),
                   // //                   ),
                   // //                 ),
                   // //                 Expanded(
                   // //                   child: Container(
                   // //                     alignment: Alignment.center,
                   // //                     decoration: BoxDecoration(
                   // //                       border: Border.all(
                   // //                           color: Colors.deepPurple),
                   // //                     ),
                   // //                     child: Text(
                   // //                       "Delivery Time",
                   // //                       style: TextStyle(
                   // //                         color: Colors.deepPurple,
                   // //                         fontWeight: FontWeight.bold,
                   // //                       ),
                   // //                     ),
                   // //                   ),
                   // //                 ),
                   // //               ],
                   // //             ),
                   // //           ),
                   // //           Container(
                   // //             height: size.height * 0.13,
                   // //             width: MediaQuery.of(context).size.width *
                   // //                 1.35,
                   // //             child: ListView.builder(
                   // //               padding: EdgeInsets.zero,
                   // //               scrollDirection: Axis.vertical,
                   // //               physics: const ClampingScrollPhysics(),
                   // //               itemCount: state.data.length,
                   // //               itemBuilder: (BuildContext context,
                   // //                   int rowIndex) {
                   // //                 return GestureDetector(
                   // //                   onTap: () {
                   // //                     setState(() {
                   // //                       clicked = true;
                   // //                     });
                   // //
                   // //                   },
                   // //                   child: SizedBox(
                   // //                     height: size.height * 0.05,
                   // //                     width: MediaQuery.of(context)
                   // //                             .size
                   // //                             .width *
                   // //                         1.5,
                   // //                     child: ListView.builder(
                   // //                       itemCount: 1,
                   // //                       scrollDirection: Axis.vertical,
                   // //                       itemBuilder: (context, index) {
                   // //                         return Container(
                   // //                           margin:
                   // //                               EdgeInsets.symmetric(
                   // //                                   horizontal:
                   // //                                       size.width *
                   // //                                           0.05),
                   // //                           height: size.height * 0.05,
                   // //                           width:
                   // //                               MediaQuery.of(context)
                   // //                                       .size
                   // //                                       .width *
                   // //                                   1.5,
                   // //                           // Increased width
                   // //                           child: Row(
                   // //                             children: [
                   // //                               Expanded(
                   // //                                 child: Container(
                   // //                                   width: size.width *
                   // //                                       0.15,
                   // //                                   alignment: Alignment
                   // //                                       .center,
                   // //                                   decoration:
                   // //                                       BoxDecoration(
                   // //                                     border: Border.all(
                   // //                                         color: Colors
                   // //                                             .deepPurple),
                   // //                                   ),
                   // //                                   child: Text(
                   // //                                    (rowIndex+1).toString(),
                   // //                                     style: TextStyle(
                   // //                                       color: Colors
                   // //                                           .black,
                   // //                                     ),
                   // //                                   ),
                   // //                                 ),
                   // //                               ),
                   // //                               Expanded(
                   // //                                 child: Container(
                   // //                                   width: size.width *
                   // //                                       0.15,
                   // //                                   alignment: Alignment
                   // //                                       .center,
                   // //                                   decoration:
                   // //                                       BoxDecoration(
                   // //                                     border: Border.all(
                   // //                                         color: Colors
                   // //                                             .deepPurple),
                   // //                                   ),
                   // //                                   child: Text(
                   // //                                     state.data[index].orderNumber,
                   // //                                     style: TextStyle(
                   // //                                       color: Colors
                   // //                                           .black,
                   // //                                     ),
                   // //                                   ),
                   // //                                 ),
                   // //                               ),
                   // //                               Expanded(
                   // //                                 child: Container(
                   // //                                   width: size.width *
                   // //                                       0.15,
                   // //                                   alignment: Alignment
                   // //                                       .center,
                   // //                                   decoration:
                   // //                                       BoxDecoration(
                   // //                                     border: Border.all(
                   // //                                         color: Colors
                   // //                                             .deepPurple),
                   // //                                   ),
                   // //                                   child: Text(
                   // //                                     state.data[index].customer.name,
                   // //                                     style: TextStyle(
                   // //                                       color: Colors
                   // //                                           .black,
                   // //                                     ),
                   // //                                   ),
                   // //                                 ),
                   // //                               ),
                   // //                               Expanded(
                   // //                                 child: Container(
                   // //                                   width: size.width *
                   // //                                       0.15,
                   // //                                   alignment: Alignment
                   // //                                       .center,
                   // //                                   decoration:
                   // //                                       BoxDecoration(
                   // //                                     border: Border.all(
                   // //                                         color: Colors
                   // //                                             .deepPurple),
                   // //                                   ),
                   // //                                   child: Text(
                   // //                                     state.data[index].customer.location.name,
                   // //                                     style: TextStyle(
                   // //                                       color: Colors
                   // //                                           .black,
                   // //                                     ),
                   // //                                   ),
                   // //                                 ),
                   // //                               ),
                   // //                               Expanded(
                   // //                                 child: Container(
                   // //                                   width: size.width *
                   // //                                       0.15,
                   // //                                   alignment: Alignment
                   // //                                       .center,
                   // //                                   decoration:
                   // //                                       BoxDecoration(
                   // //                                     border: Border.all(
                   // //                                         color: Colors
                   // //                                             .deepPurple),
                   // //                                   ),
                   // //                                   child: Text(
                   // //                                     state.data[index].customer.buildingNo,
                   // //                                     style: TextStyle(
                   // //                                       color: Colors
                   // //                                           .black,
                   // //                                     ),
                   // //                                   ),
                   // //                                 ),
                   // //                               ),
                   // //                               Expanded(
                   // //                                 child: Container(
                   // //                                   width: size.width *
                   // //                                       0.15,
                   // //                                   alignment: Alignment
                   // //                                       .center,
                   // //                                   decoration:
                   // //                                       BoxDecoration(
                   // //                                     border: Border.all(
                   // //                                         color: Colors
                   // //                                             .deepPurple),
                   // //                                   ),
                   // //                                   child: Text(
                   // //                                     state.data[index].status,
                   // //                                     style: TextStyle(
                   // //                                       color: Colors
                   // //                                           .black,
                   // //                                     ),
                   // //                                   ),
                   // //                                 ),
                   // //                               ),
                   // //                               Expanded(
                   // //                                 child: Container(
                   // //                                   width: size.width *
                   // //                                       0.15,
                   // //                                   alignment: Alignment
                   // //                                       .center,
                   // //                                   decoration:
                   // //                                       BoxDecoration(
                   // //                                     border: Border.all(
                   // //                                         color: Colors
                   // //                                             .deepPurple),
                   // //                                   ),
                   // //                                   child: Text(
                   // //                                     "0",
                   // //                                     style: TextStyle(
                   // //                                       color: Colors
                   // //                                           .black,
                   // //                                     ),
                   // //                                   ),
                   // //                                 ),
                   // //                               ),
                   // //                             ],
                   // //                           ),
                   // //                         );
                   // //                       },
                   // //                     ),
                   // //                   ),
                   // //                 );
                   // //               },
                   // //             ),
                   // //           ),
                   // //         ],
                   // //       );
                   // //     },
                   // //   ),
                   // // ),
                   // SingleChildScrollView(
                   //   padding: EdgeInsets.symmetric(horizontal: 16.0),
                   //   scrollDirection: Axis.vertical,
                   //   child: SingleChildScrollView(
                   //     scrollDirection: Axis.horizontal,
                   //     child: DataTable(
                   //       showCheckboxColumn: false,
                   //       border: TableBorder.all(color: pickerPrimaryColor),
                   //       columns: [
                   //         DataColumn(label: Center(child: Text('Sl.No'))),
                   //         DataColumn(label: Center(child: Text('Ord.No'))),
                   //         DataColumn(label: Center(child: Text('Client Name'))),
                   //         DataColumn(label: Center(child: Text('Location'))),
                   //         DataColumn(label: Center(child: Text('Build.No'))),
                   //         DataColumn(label: Center(child: Text('Status'))),
                   //         DataColumn(label: Center(child: Text('Del.Time'))),
                   //       ],
                   //       rows: [],
                   //     ),
                   //   ),
                   // ),
                   // clicked == true
                   //     ? Column(
                   //   children: [
                   //     Icon(
                   //       Icons.keyboard_double_arrow_down_outlined,
                   //       color: pickerPrimaryColor,
                   //     ),
                   //     Icon(
                   //       Icons.keyboard_double_arrow_down_outlined,
                   //       color: pickerPrimaryColor,
                   //     ),
                   //   ],
                   // )
                   //     : Container(),
                   // SizedBox(
                   //   height: size.height * 0.05,
                   // ),
                   // clicked == true
                   //     ? Row(
                   //   mainAxisAlignment: MainAxisAlignment.start,
                   //   children: [
                   //     Container(
                   //       margin: EdgeInsets.symmetric(
                   //           horizontal: size.width * 0.02),
                   //       height: size.height * 0.22,
                   //       width: MediaQuery.of(context).size.width *
                   //           0.8, // Increased width
                   //       child: ListView.builder(
                   //         itemCount: 1,
                   //         padding: EdgeInsets.zero,
                   //         scrollDirection: Axis.horizontal,
                   //         physics: const ClampingScrollPhysics(),
                   //         itemBuilder: (context, index) {
                   //           return Column(
                   //             children: [
                   //               Container(
                   //                 margin: EdgeInsets.symmetric(
                   //                     horizontal: size.width * 0.05),
                   //                 height: size.height * 0.08,
                   //                 width:
                   //                 MediaQuery.of(context).size.width *
                   //                     0.85, // Increased width
                   //                 child: Row(
                   //                   children: [
                   //                     Expanded(
                   //                       child: Container(
                   //                         alignment: Alignment.center,
                   //                         decoration: BoxDecoration(
                   //                           border: Border.all(
                   //                               color: Colors.deepPurple),
                   //                         ),
                   //                         child: Text(
                   //                           " Sl No",
                   //                           style: TextStyle(
                   //                             color: Colors.deepPurple,
                   //                             fontWeight: FontWeight.bold,
                   //                           ),
                   //                         ),
                   //                       ),
                   //                     ),
                   //                     Expanded(
                   //                       child: Container(
                   //                         alignment: Alignment.center,
                   //                         decoration: BoxDecoration(
                   //                           border: Border.all(
                   //                               color: Colors.deepPurple),
                   //                         ),
                   //                         child: Text(
                   //                           "Category",
                   //                           style: TextStyle(
                   //                             color: Colors.deepPurple,
                   //                             fontWeight: FontWeight.bold,
                   //                           ),
                   //                         ),
                   //                       ),
                   //                     ),
                   //                     Expanded(
                   //                       child: Container(
                   //                         alignment: Alignment.center,
                   //                         decoration: BoxDecoration(
                   //                           border: Border.all(
                   //                               color: Colors.deepPurple),
                   //                         ),
                   //                         child: Text(
                   //                           "Item Name",
                   //                           style: TextStyle(
                   //                             color: Colors.deepPurple,
                   //                             fontWeight: FontWeight.bold,
                   //                           ),
                   //                         ),
                   //                       ),
                   //                     ),
                   //                     Expanded(
                   //                       child: Container(
                   //                         alignment: Alignment.center,
                   //                         decoration: BoxDecoration(
                   //                           border: Border.all(
                   //                               color: Colors.deepPurple),
                   //                         ),
                   //                         child: Text(
                   //                           "Qty",
                   //                           style: TextStyle(
                   //                             color: Colors.deepPurple,
                   //                             fontWeight: FontWeight.bold,
                   //                           ),
                   //                         ),
                   //                       ),
                   //                     ),
                   //                   ],
                   //                 ),
                   //               ),
                   //               Container(
                   //                 height: size.height * 0.13,
                   //                 width:
                   //                 MediaQuery.of(context).size.width *
                   //                     0.85,
                   //                 child: ListView.builder(
                   //                   padding: EdgeInsets.zero,
                   //                   scrollDirection: Axis.vertical,
                   //                   physics:
                   //                   const ClampingScrollPhysics(),
                   //                   itemCount: 2,
                   //                   itemBuilder: (BuildContext context,
                   //                       int rowIndex) {
                   //                     return GestureDetector(
                   //                       onTap: () {
                   //                         setState(() {
                   //                           clicked = true;
                   //                         });
                   //                       },
                   //                       child: SizedBox(
                   //                         height: size.height * 0.05,
                   //                         width: MediaQuery.of(context)
                   //                             .size
                   //                             .width *
                   //                             0.55,
                   //                         child: ListView.builder(
                   //                           itemCount: 1,
                   //                           scrollDirection:
                   //                           Axis.vertical,
                   //                           itemBuilder:
                   //                               (context, index) {
                   //                             return Container(
                   //                               height:
                   //                               size.height * 0.05,
                   //                               width:
                   //                               MediaQuery.of(context)
                   //                                   .size
                   //                                   .width *
                   //                                   1.85,
                   //                               // Increased width
                   //                               child: Row(
                   //                                 children: [
                   //                                   Expanded(
                   //                                     child: Container(
                   //                                       width:
                   //                                       size.width *
                   //                                           0.2,
                   //                                       alignment:
                   //                                       Alignment
                   //                                           .center,
                   //                                       decoration:
                   //                                       BoxDecoration(
                   //                                         border: Border.all(
                   //                                             color: Colors
                   //                                                 .deepPurple),
                   //                                       ),
                   //                                       child: Text(
                   //                                         "",
                   //                                         style:
                   //                                         TextStyle(
                   //                                           color: Colors
                   //                                               .black,
                   //                                         ),
                   //                                       ),
                   //                                     ),
                   //                                   ),
                   //                                   Expanded(
                   //                                     child: Container(
                   //                                       width:
                   //                                       size.width *
                   //                                           0.2,
                   //                                       alignment:
                   //                                       Alignment
                   //                                           .center,
                   //                                       decoration:
                   //                                       BoxDecoration(
                   //                                         border: Border.all(
                   //                                             color: Colors
                   //                                                 .deepPurple),
                   //                                       ),
                   //                                       child: Text(
                   //                                         "",
                   //                                         style:
                   //                                         TextStyle(
                   //                                           color: Colors
                   //                                               .black,
                   //                                         ),
                   //                                       ),
                   //                                     ),
                   //                                   ),
                   //                                   Expanded(
                   //                                     child: Container(
                   //                                       width:
                   //                                       size.width *
                   //                                           0.2,
                   //                                       alignment:
                   //                                       Alignment
                   //                                           .center,
                   //                                       decoration:
                   //                                       BoxDecoration(
                   //                                         border: Border.all(
                   //                                             color: Colors
                   //                                                 .deepPurple),
                   //                                       ),
                   //                                       child: Text(
                   //                                         "",
                   //                                         style:
                   //                                         TextStyle(
                   //                                           color: Colors
                   //                                               .black,
                   //                                         ),
                   //                                       ),
                   //                                     ),
                   //                                   ),
                   //                                   Expanded(
                   //                                     child: Container(
                   //                                       width:
                   //                                       size.width *
                   //                                           0.2,
                   //                                       alignment:
                   //                                       Alignment
                   //                                           .center,
                   //                                       decoration:
                   //                                       BoxDecoration(
                   //                                         border: Border.all(
                   //                                             color: Colors
                   //                                                 .deepPurple),
                   //                                       ),
                   //                                       child: Text(
                   //                                         "",
                   //                                         style:
                   //                                         TextStyle(
                   //                                           color: Colors
                   //                                               .black,
                   //                                         ),
                   //                                       ),
                   //                                     ),
                   //                                   ),
                   //                                 ],
                   //                               ),
                   //                             );
                   //                           },
                   //                         ),
                   //                       ),
                   //                     );
                   //                   },
                   //                 ),
                   //               ),
                   //             ],
                   //           );
                   //         },
                   //       ),
                   //     ),
                   //   ],
                   // )
                   //     : Container(),
                 ],
               ),
             ),
           ),
           bottomNavigationBar: Container(
             decoration: BoxDecoration(
               image: DecorationImage(
                   image: AssetImage('Assets/Images/bg.png'), fit: BoxFit.fill),
             ),
             child: BottomDrawer(),
           ),
         );
       }
      },
    );
  }
}
