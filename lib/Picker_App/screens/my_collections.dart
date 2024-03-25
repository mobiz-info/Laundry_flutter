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

class MyCollectionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyCollectionScreenState();
}

class MyCollectionScreenState extends State<MyCollectionScreen> {
  bool valuefirst = false;
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  String selectedValue = "Select Mode";

  @override
  void initState() {
    String formattedDate =
    DateFormat('yyyy-MM-dd').format(
        DateTime.now());
    toController.text = formattedDate;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create:  (context) =>
        PickerBloc(
          RepositoryProvider.of<PickerRepository>(context),
        ),
      child: Scaffold(
        // key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize:
          Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
          child: Appbar(text: 'My Collections',),
        ),
        drawer: const MenuDrawer(),
        body: SingleChildScrollView(
          child: BlocBuilder<PickerBloc, PickerState>(
            builder: (context, state) {
              if (state is CollectionListFetchingState) {
                print('current State:'+' '+state.toString());
                return Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        borderRadius:
                                        BorderRadius.circular(2.0),
                                        side: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor))),
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
                                        DateTime? pickedDate =
                                        await showDatePicker(
                                            context: context,
                                            initialDate: DateTime
                                                .now(), //get today's date
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
                                        borderRadius:
                                        BorderRadius.circular(2.0),
                                        side: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor))),
                                child: Container(
                                  // margin: EdgeInsets.only(top: size.height * 0.015),
                                  child: TextField(
                                      controller:
                                      toController, //editing controller of this TextField
                                      decoration: const InputDecoration(
                                          icon: Icon(Icons
                                              .calendar_today), //icon of text field
                                          hintText:
                                          "To Date" //label text of field
                                      ),
                                      readOnly:
                                      true, // when true user cannot edit text
                                      onTap: () async {
                                        DateTime? pickedDate =
                                        await showDatePicker(
                                            context: context,
                                            initialDate: DateTime
                                                .now(), //get today's date
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
                            DropdownButton<String>(
                              value: selectedValue, // Initial value
                              items: <String>['Select Mode', 'Cash', 'Cheque', 'Wallet', 'Card', 'Online']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                // This function will be called when the user selects an option
                                setState(() {
                                  selectedValue = newValue.toString();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: size.height * 0.01,
                            left: size.width * 0.03),
                        padding: EdgeInsets.all(smallTextPadding),
                        width: size.width /2,
                        child: ElevatedButton(
                          onPressed: () {},
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
                      SizedBox(
                        height: size.height * 0.05,
                      ),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Container(
                      //       margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      //       height: size.height * 0.3,
                      //       width: MediaQuery.of(context).size.width *
                      //           0.9, // Increased width
                      //       child: ListView.builder(
                      //         itemCount: 1,
                      //         padding: EdgeInsets.zero,
                      //         scrollDirection: Axis.horizontal,
                      //         physics: const ClampingScrollPhysics(),
                      //         itemBuilder: (context, index) {
                      //           return Column(
                      //             children: [
                      //               Container(
                      //                 alignment: Alignment.topRight,
                      //                 height: size.height * 0.06,
                      //                 width: MediaQuery.of(context).size.width /
                      //                     0.8, // Increased width
                      //                 child:  Container(
                      //                     alignment: Alignment.center,
                      //                     decoration: BoxDecoration(
                      //                       border:
                      //                       Border.all(color: Colors.deepPurple),
                      //                     ),
                      //                     child:   Container(
                      //                         margin: EdgeInsets.only(right: size.width *0.06),
                      //                         width: size.width * 0.45,
                      //                         height: size.height * 0.045,
                      //                         decoration: ShapeDecoration(
                      //                             color: Colors.transparent,
                      //                             shape: RoundedRectangleBorder (
                      //                                 borderRadius: BorderRadius.circular(2.0),
                      //                                 side: BorderSide(
                      //                                     width: 2,
                      //                                     color: pickerPrimaryColor
                      //                                 )
                      //                             )
                      //                         ),
                      //                         child: Row(
                      //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                           crossAxisAlignment: CrossAxisAlignment.center,
                      //                           children: [
                      //                             Container(
                      //                               margin:EdgeInsets.only(left: size.width * 0.02),
                      //                               child: Text('Search....',),
                      //                             ),
                      //                             Container(
                      //                                 decoration: BoxDecoration(
                      //                                     color: pickerLightGreyColor
                      //                                 ),
                      //                                 child: IconButton(
                      //                                   icon: Icon(
                      //                                     Icons.search,
                      //                                     color: pickerPrimaryColor,
                      //                                     size: 22,
                      //                                   ),
                      //                                   onPressed: () {},
                      //                                 )
                      //                             ),
                      //                           ],
                      //                         )
                      //                     )
                      //                 ),
                      //               ),
                      //               Container(
                      //                 margin: EdgeInsets.symmetric(
                      //                     horizontal: size.width * 0.05),
                      //                 height: size.height * 0.08,
                      //                 width: MediaQuery.of(context).size.width /
                      //                     0.8, // Increased width
                      //                 child: Row(
                      //                   children: [
                      //                     Expanded(
                      //                       child: Container(
                      //                         alignment: Alignment.center,
                      //                         decoration: BoxDecoration(
                      //                           border:
                      //                           Border.all(color: Colors.deepPurple),
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
                      //                           border:
                      //                           Border.all(color: Colors.deepPurple),
                      //                         ),
                      //                         child: Text(
                      //                           "Client Name",
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
                      //                           border:
                      //                           Border.all(color: Colors.deepPurple),
                      //                         ),
                      //                         child: Text(
                      //                           "Amount",
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
                      //                           border:
                      //                           Border.all(color: Colors.deepPurple),
                      //                         ),
                      //                         child: Text(
                      //                           "Mode",
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
                      //                           border:
                      //                           Border.all(color: Colors.deepPurple),
                      //                         ),
                      //                         child: Text(
                      //                           "Balance",
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
                      //                 height: size.height * 0.1,
                      //                 width: MediaQuery.of(context).size.width * 1.35,
                      //                 child: ListView.builder(
                      //                   padding: EdgeInsets.zero,
                      //                   scrollDirection: Axis.vertical,
                      //                   physics: const ClampingScrollPhysics(),
                      //                   itemCount: 2,
                      //                   itemBuilder:
                      //                       (BuildContext context, int rowIndex) {
                      //                     return GestureDetector(
                      //                       onTap: (){
                      //
                      //                       },
                      //                       child: SizedBox(
                      //                         height: size.height * 0.05,
                      //                         width:
                      //                         MediaQuery.of(context).size.width * 1.5,
                      //                         child: ListView.builder(
                      //                           itemCount: 1,
                      //                           scrollDirection: Axis.vertical,
                      //                           itemBuilder: (context, index) {
                      //                             return Container(
                      //                               margin: EdgeInsets.symmetric(
                      //                                   horizontal: size.width * 0.05),
                      //                               height: size.height * 0.05,
                      //                               width:
                      //                               MediaQuery.of(context).size.width *
                      //                                   1.5,
                      //                               // Increased width
                      //                               child: Row(
                      //                                 children: [
                      //                                   Expanded(
                      //                                     child: Container(
                      //                                       width: size.width * 0.15,
                      //                                       alignment: Alignment.center,
                      //                                       decoration: BoxDecoration(
                      //                                         border: Border.all(
                      //                                             color: Colors.deepPurple),
                      //                                       ),
                      //                                       child: Text(
                      //                                         "",
                      //                                         style: TextStyle(
                      //                                           color: Colors.black,
                      //                                         ),
                      //                                       ),
                      //                                     ),
                      //                                   ),
                      //                                   Expanded(
                      //                                     child: Container(
                      //                                       width: size.width * 0.15,
                      //                                       alignment: Alignment.center,
                      //                                       decoration: BoxDecoration(
                      //                                         border: Border.all(
                      //                                             color: Colors.deepPurple),
                      //                                       ),
                      //                                       child: Text(
                      //                                         "",
                      //                                         style: TextStyle(
                      //                                           color: Colors.black,
                      //                                         ),
                      //                                       ),
                      //                                     ),
                      //                                   ),
                      //                                   Expanded(
                      //                                     child: Container(
                      //                                       width: size.width * 0.15,
                      //                                       alignment: Alignment.center,
                      //                                       decoration: BoxDecoration(
                      //                                         border: Border.all(
                      //                                             color: Colors.deepPurple),
                      //                                       ),
                      //                                       child: Text(
                      //                                         "",
                      //                                         style: TextStyle(
                      //                                           color: Colors.black,
                      //                                         ),
                      //                                       ),
                      //                                     ),
                      //                                   ),
                      //                                   Expanded(
                      //                                     child: Container(
                      //                                       width: size.width * 0.15,
                      //                                       alignment: Alignment.center,
                      //                                       decoration: BoxDecoration(
                      //                                         border: Border.all(
                      //                                             color: Colors.deepPurple),
                      //                                       ),
                      //                                       child: Text(
                      //                                         "",
                      //                                         style: TextStyle(
                      //                                           color: Colors.black,
                      //                                         ),
                      //                                       ),
                      //                                     ),
                      //                                   ),
                      //                                   Expanded(
                      //                                     child: Container(
                      //                                       width: size.width * 0.15,
                      //                                       alignment: Alignment.center,
                      //                                       decoration: BoxDecoration(
                      //                                         border: Border.all(
                      //                                             color: Colors.deepPurple),
                      //                                       ),
                      //                                       child: Text(
                      //                                         "",
                      //                                         style: TextStyle(
                      //                                           color: Colors.black,
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
                      //               Container(
                      //                 height: size.height * 0.05,
                      //                 width: MediaQuery.of(context).size.width /
                      //                     0.8, // Increased width
                      //                 child: Row(
                      //                   children: [
                      //                     Container(
                      //                       width: size.width * 0.5,
                      //                       alignment: Alignment.center,
                      //                       decoration: BoxDecoration(
                      //                         border:
                      //                         Border.all(color: Colors.deepPurple),
                      //                       ),
                      //                       child: Text(
                      //                         " Total",
                      //                         style: TextStyle(
                      //                           color: Colors.deepPurple,
                      //                           fontWeight: FontWeight.bold,
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     Expanded(
                      //                       child: Container(
                      //                         width: size.width * 0.15,
                      //                         alignment: Alignment.center,
                      //                         decoration: BoxDecoration(
                      //                           border:
                      //                           Border.all(color: Colors.deepPurple),
                      //                         ),
                      //                         child: Text(
                      //                           "100",
                      //                           style: TextStyle(
                      //                             color: Colors.deepPurple,
                      //                             fontWeight: FontWeight.bold,
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     Expanded(
                      //                       child: Container(
                      //                         width: size.width * 0.65,
                      //                         alignment: Alignment.center,
                      //                         decoration: BoxDecoration(
                      //                           border:
                      //                           Border.all(color: Colors.deepPurple),
                      //                         ),
                      //                         child: Text(
                      //                           " Total",
                      //                           style: TextStyle(
                      //                             color: Colors.deepPurple,
                      //                             fontWeight: FontWeight.bold,
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     Expanded(
                      //                       child: Container(
                      //                         width: size.width * 0.15,
                      //                         alignment: Alignment.center,
                      //                         decoration: BoxDecoration(
                      //                           border:
                      //                           Border.all(color: Colors.deepPurple),
                      //                         ),
                      //                         child: Text(
                      //                           "100",
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
                      //             ],
                      //           );
                      //         },
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                    ],
                  ),
                );
              } else if (state is CollectionListFetchedState) {
                print('current State:'+' '+state.toString());
                return Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        borderRadius:
                                        BorderRadius.circular(2.0),
                                        side: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor))),
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
                                        DateTime? pickedDate =
                                        await showDatePicker(
                                            context: context,
                                            initialDate: DateTime
                                                .now(), //get today's date
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
                                        borderRadius:
                                        BorderRadius.circular(2.0),
                                        side: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor))),
                                child: Container(
                                  // margin: EdgeInsets.only(top: size.height * 0.015),
                                  child: TextField(
                                      controller:
                                      toController, //editing controller of this TextField
                                      decoration: const InputDecoration(
                                          icon: Icon(Icons
                                              .calendar_today), //icon of text field
                                          hintText:
                                          "To Date" //label text of field
                                      ),
                                      readOnly:
                                      true, // when true user cannot edit text
                                      onTap: () async {
                                        DateTime? pickedDate =
                                        await showDatePicker(
                                            context: context,
                                            initialDate: DateTime
                                                .now(), //get today's date
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
                            DropdownButton<String>(
                              value: selectedValue, // Initial value
                              items: <String>['Select Mode', 'Cash', 'Cheque', 'Wallet', 'Card', 'Online']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                // This function will be called when the user selects an option
                                setState(() {
                                  selectedValue = newValue.toString();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: size.height * 0.01,
                            left: size.width * 0.03),
                        padding: EdgeInsets.all(smallTextPadding),
                        width: size.width /2,
                        child: ElevatedButton(
                          onPressed: () {
                            if (fromController.text.isNotEmpty && toController.text.isNotEmpty && selectedValue != "Select Mode") {
                              Map<String, String> data = {
                                "id":authData.user_id.toString(),
                                "from_date":fromController.text,
                                "to_date":toController.text,
                                "collect_mode":selectedValue
                              };
                              BlocProvider.of<PickerBloc>(context).add(CollectionListFetchEvent(authData.user_token.toString(), data));
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
                        height: size.height * 0.05,
                      ),

                      if (state.data.length == 0)
                        Center(child: Text("No Data"),),
                      if (state.data.length != 0)
                        Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                            height: size.height * 0.3,
                            width: MediaQuery.of(context).size.width *
                                0.9, // Increased width
                            child: ListView.builder(
                              itemCount: 1,
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topRight,
                                      height: size.height * 0.06,
                                      width: MediaQuery.of(context).size.width /
                                          0.8, // Increased width
                                      child:  Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border:
                                            Border.all(color: Colors.deepPurple),
                                          ),
                                          child:   Container(
                                              margin: EdgeInsets.only(right: size.width *0.06),
                                              width: size.width * 0.45,
                                              height: size.height * 0.045,
                                              decoration: ShapeDecoration(
                                                  color: Colors.transparent,
                                                  shape: RoundedRectangleBorder (
                                                      borderRadius: BorderRadius.circular(2.0),
                                                      side: BorderSide(
                                                          width: 2,
                                                          color: pickerPrimaryColor
                                                      )
                                                  )
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    margin:EdgeInsets.only(left: size.width * 0.02),
                                                    child: Text('Search....',),
                                                  ),
                                                  Container(
                                                      decoration: BoxDecoration(
                                                          color: pickerLightGreyColor
                                                      ),
                                                      child: IconButton(
                                                        icon: Icon(
                                                          Icons.search,
                                                          color: pickerPrimaryColor,
                                                          size: 22,
                                                        ),
                                                        onPressed: () {},
                                                      )
                                                  ),
                                                ],
                                              )
                                          )
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.05),
                                      height: size.height * 0.08,
                                      width: MediaQuery.of(context).size.width /
                                          0.8, // Increased width
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                border:
                                                Border.all(color: Colors.deepPurple),
                                              ),
                                              child: Text(
                                                " Sl No",
                                                style: TextStyle(
                                                  color: Colors.deepPurple,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                border:
                                                Border.all(color: Colors.deepPurple),
                                              ),
                                              child: Text(
                                                "Client Name",
                                                style: TextStyle(
                                                  color: Colors.deepPurple,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                border:
                                                Border.all(color: Colors.deepPurple),
                                              ),
                                              child: Text(
                                                "Amount",
                                                style: TextStyle(
                                                  color: Colors.deepPurple,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                border:
                                                Border.all(color: Colors.deepPurple),
                                              ),
                                              child: Text(
                                                "Mode",
                                                style: TextStyle(
                                                  color: Colors.deepPurple,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                border:
                                                Border.all(color: Colors.deepPurple),
                                              ),
                                              child: Text(
                                                "Balance",
                                                style: TextStyle(
                                                  color: Colors.deepPurple,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: size.height * 0.1,
                                      width: MediaQuery.of(context).size.width * 1.35,
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        physics: const ClampingScrollPhysics(),
                                        itemCount: 2,
                                        itemBuilder:
                                            (BuildContext context, int rowIndex) {
                                          return GestureDetector(
                                            onTap: (){

                                            },
                                            child: SizedBox(
                                              height: size.height * 0.05,
                                              width:
                                              MediaQuery.of(context).size.width * 1.5,
                                              child: ListView.builder(
                                                itemCount: 1,
                                                scrollDirection: Axis.vertical,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    margin: EdgeInsets.symmetric(
                                                        horizontal: size.width * 0.05),
                                                    height: size.height * 0.05,
                                                    width:
                                                    MediaQuery.of(context).size.width *
                                                        1.5,
                                                    // Increased width
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: size.width * 0.15,
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors.deepPurple),
                                                            ),
                                                            child: Text(
                                                              "",
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: size.width * 0.15,
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors.deepPurple),
                                                            ),
                                                            child: Text(
                                                              "",
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: size.width * 0.15,
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors.deepPurple),
                                                            ),
                                                            child: Text(
                                                              "",
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: size.width * 0.15,
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors.deepPurple),
                                                            ),
                                                            child: Text(
                                                              "",
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: size.width * 0.15,
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors.deepPurple),
                                                            ),
                                                            child: Text(
                                                              "",
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      height: size.height * 0.05,
                                      width: MediaQuery.of(context).size.width /
                                          0.8, // Increased width
                                      child: Row(
                                        children: [
                                          Container(
                                            width: size.width * 0.5,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              border:
                                              Border.all(color: Colors.deepPurple),
                                            ),
                                            child: Text(
                                              " Total",
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: size.width * 0.15,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                border:
                                                Border.all(color: Colors.deepPurple),
                                              ),
                                              child: Text(
                                                "100",
                                                style: TextStyle(
                                                  color: Colors.deepPurple,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: size.width * 0.65,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                border:
                                                Border.all(color: Colors.deepPurple),
                                              ),
                                              child: Text(
                                                " Total",
                                                style: TextStyle(
                                                  color: Colors.deepPurple,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: size.width * 0.15,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                border:
                                                Border.all(color: Colors.deepPurple),
                                              ),
                                              child: Text(
                                                "100",
                                                style: TextStyle(
                                                  color: Colors.deepPurple,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: size.height * 0.01,
                      ),
                    ],
                  ),
                );
              } else {
                print('current State:'+' '+state.toString());
                return Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        borderRadius:
                                        BorderRadius.circular(2.0),
                                        side: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor))),
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
                                        DateTime? pickedDate =
                                        await showDatePicker(
                                            context: context,
                                            initialDate: DateTime
                                                .now(), //get today's date
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
                                        borderRadius:
                                        BorderRadius.circular(2.0),
                                        side: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor))),
                                child: Container(
                                  // margin: EdgeInsets.only(top: size.height * 0.015),
                                  child: TextField(
                                      controller:
                                      toController, //editing controller of this TextField
                                      decoration: const InputDecoration(
                                          icon: Icon(Icons
                                              .calendar_today), //icon of text field
                                          hintText:
                                          "To Date" //label text of field
                                      ),
                                      readOnly:
                                      true, // when true user cannot edit text
                                      onTap: () async {
                                        DateTime? pickedDate =
                                        await showDatePicker(
                                            context: context,
                                            initialDate: DateTime
                                                .now(), //get today's date
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
                            DropdownButton<String>(
                              value: selectedValue, // Initial value
                              items: <String>['Select Mode', 'Cash', 'Cheque', 'Wallet', 'Card', 'Online']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                // This function will be called when the user selects an option
                                setState(() {
                                  selectedValue = newValue.toString();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: size.height * 0.01,
                            left: size.width * 0.03),
                        padding: EdgeInsets.all(smallTextPadding),
                        width: size.width /2,
                        child: ElevatedButton(
                          onPressed: () {
                            if (fromController.text.isNotEmpty && toController.text.isNotEmpty && selectedValue != "Select Mode") {
                              Map<String, String> data = {
                                  "id":authData.user_id.toString(),
                                  "from_date":fromController.text,
                                  "to_date":toController.text,
                                  "collect_mode":selectedValue
                              };
                              BlocProvider.of<PickerBloc>(context).add(CollectionListFetchEvent(authData.user_token.toString(), data));
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
                        height: size.height * 0.05,
                      ),

                      Center(child: Text("No Data!")),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Assets/Images/bg.png'), fit: BoxFit.fill),
          ),
          child: BottomDrawer(),
        ),
      ),
    );
  }
}
