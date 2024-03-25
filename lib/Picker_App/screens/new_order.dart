import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/CustomerBloc/customer_bloc.dart';
import 'package:golden_falcon/BLoCs/PickerBloc/picker_bloc.dart';
import 'package:golden_falcon/Models/PickerModel/new_order_save.dart';
import 'package:golden_falcon/Picker_App/screens/new_order_2.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Repositories/CustomerRepo/customer_repository.dart';
import 'package:golden_falcon/Repositories/PickerRepo/picker_repo.dart';
import 'package:golden_falcon/Utils/common.dart';
import 'package:intl/intl.dart';
import 'package:golden_falcon/Picker_App/screens/stock_transfer.dart';

import '../src/colors.dart';
import '../src/dimen.dart';
import '../src/textString.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/custom_shape.dart';
import '../util/drawer.dart';

class NewOrderScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewOrderScreenState();
}

class NewOrderScreenState extends State<NewOrderScreen> {
  String selectedCustomer = "Select Client";
  String selectedCustomerId = "";
  String selectedType = "Select Type";
  TextEditingController pickup_dt_controller = TextEditingController();
  TextEditingController pickup_tmt_controller = TextEditingController();
  TextEditingController del_dt_controller = TextEditingController();
  TextEditingController del_tm_controller = TextEditingController();
  List<String> customerData = [];
  List<NewOrderData> orderData = [];
  String new_order_id = "";
  List<String> orderType = ['Select Type', 'Normal', 'Express', 'Urgent'];
  String mode_of_action = "save_order";

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
        child: Appbar(
          text: 'New Order',
        ),
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/Images/bg.png'), fit: BoxFit.fill),
        ),
        child: BottomDrawer(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Map<String, String> data = {
            "id": authData.user_id.toString(),
            "customer_id": selectedCustomerId,
            "pickup_date": pickup_dt_controller.text,
            "pickup_time": pickup_tmt_controller.text,
            "order_type": selectedType,
            "Delivery_date": del_dt_controller.text,
            "Delivery_time": del_tm_controller.text
          };
          print(jsonEncode(data));
          BlocProvider.of<PickerBloc>(context)
              .add(AddNewOrderEvent(data, authData.user_token.toString()));
          setState(() {
            mode_of_action = "get_items";
          });
        },
        child: Text("Save"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                              alignment: Alignment.centerRight,
                              // margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.03),
                              width: size.width * 0.3,
                              height: size.height * 0.06,
                              decoration: ShapeDecoration(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                          width: 1.5,
                                          color: pickerPrimaryColor))),
                              child: Container(
                                // margin: EdgeInsets.only(top: size.height * 0.015),
                                alignment: Alignment.center,
                                child: TextField(
                                    controller:
                                        pickup_dt_controller, //editing controller of this TextField
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        icon: Icon(Icons
                                            .calendar_today), //icon of text field
                                        hintText:
                                            "Pickup Date" //label text of field
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
                                          pickup_dt_controller.text =
                                              formattedDate; //set foratted date to TextField value.
                                        });
                                      } else {
                                        print("Date is not selected");
                                      }
                                    }),
                              )),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              // margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.03),
                              width: size.width * 0.3,
                              height: size.height * 0.06,
                              decoration: ShapeDecoration(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                          width: 1.5,
                                          color: pickerPrimaryColor))),
                              child: Container(
                                // margin: EdgeInsets.only(top: size.height * 0.015),
                                child: TextField(
                                    controller:
                                        pickup_tmt_controller, //editing controller of this TextField
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        suffixIcon: Icon(Icons
                                            .timer_outlined), //icon of text field
                                        hintText:
                                            "Pickup Time" //label text of field
                                        ),
                                    readOnly:
                                        true, // when true user cannot edit text
                                    onTap: () async {
                                      final TimeOfDay? newTime =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                        initialEntryMode:
                                            TimePickerEntryMode.input,
                                      );
                                      String time24Hours =
                                          newTime!.hour.toString() +
                                              ':' +
                                              newTime.minute.toString();
                                      final DateFormat inputFormat = DateFormat
                                          .Hm(); // Input format for 24-hour time
                                      final DateFormat outputFormat =
                                          DateFormat.Hms();
                                      final DateTime dateTime =
                                          inputFormat.parse(time24Hours);
                                      final String formattedTime =
                                          outputFormat.format(dateTime);
                                      pickup_tmt_controller.text =
                                          formattedTime;
                                    }),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                              alignment: Alignment.centerRight,
                              // margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.03),
                              width: size.width * 0.3,
                              height: size.height * 0.06,
                              decoration: ShapeDecoration(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                          width: 1.5,
                                          color: pickerPrimaryColor))),
                              child: Container(
                                // margin: EdgeInsets.only(top: size.height * 0.015),
                                alignment: Alignment.center,
                                child: TextField(
                                    controller:
                                        del_dt_controller, //editing controller of this TextField
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        icon: Icon(Icons
                                            .calendar_today), //icon of text field
                                        hintText:
                                            "Delivery Date" //label text of field
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
                                          del_dt_controller.text =
                                              formattedDate; //set foratted date to TextField value.
                                        });
                                      } else {
                                        print("Date is not selected");
                                      }
                                    }),
                              )),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              // margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.03),
                              width: size.width * 0.3,
                              height: size.height * 0.06,
                              decoration: ShapeDecoration(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                          width: 1.5,
                                          color: pickerPrimaryColor))),
                              child: Container(
                                // margin: EdgeInsets.only(top: size.height * 0.015),
                                child: TextField(
                                    controller:
                                        del_tm_controller, //editing controller of this TextField
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        suffixIcon: Icon(Icons
                                            .timer_outlined), //icon of text field
                                        hintText:
                                            "Delivery Time" //label text of field
                                        ),
                                    readOnly:
                                        true, // when true user cannot edit text
                                    onTap: () async {
                                      final TimeOfDay? newTime =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                        initialEntryMode:
                                            TimePickerEntryMode.input,
                                      );
                                      String time24Hours =
                                          newTime!.hour.toString() +
                                              ':' +
                                              newTime.minute.toString();
                                      final DateFormat inputFormat = DateFormat
                                          .Hm(); // Input format for 24-hour time
                                      final DateFormat outputFormat =
                                          DateFormat.Hms();
                                      final DateTime dateTime =
                                          inputFormat.parse(time24Hours);
                                      final String formattedTime =
                                          outputFormat.format(dateTime);
                                      del_tm_controller.text = formattedTime;
                                    }),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    BlocProvider(
                      create: (context) => PickerBloc(
                        RepositoryProvider.of<PickerRepository>(context),
                      )..add(ListAllClientsEvent(authData.user_id.toString(),
                          authData.user_token.toString())),
                      child: BlocBuilder<PickerBloc, PickerState>(
                        builder: (context, state) {
                          if (state is FetchingClientList) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: pickerPrimaryColor,
                                            width: 1.5),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: pickerPrimaryColor,
                                            width: 1.5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: pickerPrimaryColor,
                                            width: 1.5),
                                      ),
                                    ),
                                    items: customerData.map((customer) {
                                      return DropdownMenuItem(
                                        value: customer,
                                        child: Center(child: Text(customer)),
                                      );
                                    }).toList(),
                                    value: selectedCustomer,
                                    onChanged: (value) {},
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: pickerPrimaryColor,
                                            width: 1.5),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: pickerPrimaryColor,
                                            width: 1.5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: pickerPrimaryColor,
                                            width: 1.5),
                                      ),
                                    ),
                                    items: orderType.map((type) {
                                      return DropdownMenuItem(
                                        value: type,
                                        child: Center(child: Text(type)),
                                      );
                                    }).toList(),
                                    value: selectedType,
                                    onChanged: (value) {},
                                  ),
                                ),
                              ],
                            );
                          } else if (state is FetchedClientList) {
                            if (customerData.isEmpty) {
                              customerData.add('Select Client');
                              state.customerList.forEach((cl) {
                                customerData.add(cl.name);
                              });
                            }
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: pickerPrimaryColor,
                                            width: 1.5),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: pickerPrimaryColor,
                                            width: 1.5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: pickerPrimaryColor,
                                            width: 1.5),
                                      ),
                                    ),
                                    items: customerData.map((customer) {
                                      return DropdownMenuItem(
                                        value: customer,
                                        child: Center(child: Text(customer)),
                                      );
                                    }).toList(),
                                    value: selectedCustomer,
                                    onChanged: (value) {
                                      selectedCustomer = value!;
                                      state.customerList.forEach((cList) {
                                        if (value == cList.name) {
                                          selectedCustomerId = cList.customerId;
                                        }
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: pickerPrimaryColor,
                                            width: 1.5),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: pickerPrimaryColor,
                                            width: 1.5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: pickerPrimaryColor,
                                            width: 1.5),
                                      ),
                                    ),
                                    items: orderType.map((type) {
                                      return DropdownMenuItem(
                                        value: type,
                                        child: Center(child: Text(type)),
                                      );
                                    }).toList(),
                                    value: selectedType,
                                    onChanged: (value) {
                                      selectedType = value!;
                                    },
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: pickerPrimaryColor,
                                            width: 1.5),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: pickerPrimaryColor,
                                            width: 1.5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: pickerPrimaryColor,
                                            width: 1.5),
                                      ),
                                    ),
                                    items: customerData.map((customer) {
                                      return DropdownMenuItem(
                                        value: customer,
                                        child: Center(child: Text(customer)),
                                      );
                                    }).toList(),
                                    value: selectedCustomer,
                                    onChanged: (value) {},
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: pickerPrimaryColor,
                                            width: 1.5),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: pickerPrimaryColor,
                                            width: 1.5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: pickerPrimaryColor,
                                            width: 1.5),
                                      ),
                                    ),
                                    items: orderType.map((type) {
                                      return DropdownMenuItem(
                                        value: type,
                                        child: Center(child: Text(type)),
                                      );
                                    }).toList(),
                                    value: selectedType,
                                    onChanged: (value) {},
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                BlocBuilder<PickerBloc, PickerState>(
                    builder: (context, state) {
                      if (state is AddedNewOrderState) {
                        print(state.toString());
                        orderData.add(state.ordData);
                        return SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              border: TableBorder.all(
                                color: pickerPrimaryColor,
                              ),
                              showCheckboxColumn: false,
                              columns: [
                                DataColumn(label: Center(child: Text("Sl.No"))),
                                DataColumn(label: Center(child: Text("Order Id"))),
                                DataColumn(label: Center(child: Text("Order No"))),
                                DataColumn(label: Center(child: Text("Customer Id"))),
                              ],
                              rows: List<DataRow>.generate(
                                orderData.length,
                                    (index) {
                                  return DataRow(
                                    onSelectChanged: (value) {
                                      authData.setOrdCstmrId(orderData[index].orderId, orderData[index].customer);
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewOrderScreen2(cstId: orderData[index].customer),));
                                    },
                                      cells: [
                                        DataCell(Center(child: Text('${(index + 1)}'))),
                                        DataCell(Center(child: Text(orderData[index].orderId))),
                                        DataCell(Center(child: Text(orderData[index].orderNumber))),
                                        DataCell(Center(child: Text(orderData[index].customer))),
                                      ]
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      } else {
                        print(state.toString());
                        return Center(child: Text("Error"),);
                      }
                    },
                )
            ],
          ),
        ),
      ),

    );
  }
}
