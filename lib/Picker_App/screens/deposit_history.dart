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

class DepsoitHistoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DepsoitHistoryScreenState();
}

class DepsoitHistoryScreenState extends State<DepsoitHistoryScreen> {
  bool valuefirst = false;
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => PickerBloc(
        RepositoryProvider.of<PickerRepository>(context),
      ),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
          child: Appbar(
            text: 'Deposit History',
          ),
        ),
        drawer: const MenuDrawer(),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: BlocBuilder<PickerBloc, PickerState>(
              builder: (context, state) {
                if (state is DepostiHistoryFetched) {
                  fromController.clear();
                  toController.clear();
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: size.height * 0.05),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                              Container(
                                margin: EdgeInsets.only(
                                    top: size.height * 0.01,
                                    left: size.width * 0.03),
                                padding: EdgeInsets.all(smallTextPadding),
                                width: size.width * 0.26,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Map<String, String> body = {
                                      "id": authData.user_id.toString(),
                                      "from_date": fromController.text,
                                      "to_date": toController.text
                                    };
                                    print(fromController.text);
                                    print(toController.text);
                                    BlocProvider.of<PickerBloc>(context).add(
                                        DepositHistoryFetchEvent(
                                            authData.user_token.toString(),
                                            body));
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
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      DataTable(
                        columns: [
                          DataColumn(label: Text('Sl.No')),
                          DataColumn(label: Text('Deposit Date')),
                          DataColumn(label: Text('Total Amount')),
                        ],
                        rows: state.data.map((e) {
                          return DataRow(
                            cells: [
                              DataCell(Text('0')),
                              DataCell(Text(e.depositeDate.toString())),
                              DataCell(Text(e.totalAmount)),
                            ]
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: size.height * 0.05),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                              Container(
                                margin: EdgeInsets.only(
                                    top: size.height * 0.01,
                                    left: size.width * 0.03),
                                padding: EdgeInsets.all(smallTextPadding),
                                width: size.width * 0.26,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Map<String, String> body = {
                                      "id": authData.user_id.toString(),
                                      "from_date": fromController.text,
                                      "to_date": toController.text
                                    };
                                    print(fromController.text);
                                    print(toController.text);
                                    BlocProvider.of<PickerBloc>(context).add(
                                        DepositHistoryFetchEvent(
                                            authData.user_token.toString(),
                                            body));
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
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Center(child: Text('Loading...'),),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                    ],
                  );
                }
              } ,
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
      ),
    );
  }
}
