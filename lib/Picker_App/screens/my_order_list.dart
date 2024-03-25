import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/PickerBloc/picker_bloc.dart';
import 'package:golden_falcon/Picker_App/screens/homepage.dart';
import 'package:golden_falcon/Picker_App/screens/new_order.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Repositories/PickerRepo/picker_repo.dart';
import 'package:intl/intl.dart';
import '../src/colors.dart';
import '../src/dimen.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/drawer.dart';

class MyOrderScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyOrderScreenState();
}

class MyOrderScreenState extends State<MyOrderScreen> {
  bool valuefirst = false;

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => PickerBloc(
        RepositoryProvider.of<PickerRepository>(context),
      )..add(PickupListFetchEvent(
          authData.user_token.toString(), authData.user_id.toString())),
      child: Scaffold(
        // key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
          child: Appbar(
            text: 'My Order List',
          ),
        ),
        drawer: const MenuDrawer(),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: size.height * 0.02, left: size.width * 0.02),
                        padding: EdgeInsets.all(smallTextPadding),
                        width: size.width * 0.35,
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => NewOrderScreen()), (route) => false),
                          style: ElevatedButton.styleFrom(
                            primary: pickerPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 15.0,
                          ),
                          child: Text(
                            'Create New',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              top: size.height * 0.03,
                              right: size.width * 0.06),
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
                                margin:
                                    EdgeInsets.only(left: size.width * 0.02),
                                child: Text(
                                  'Search....',
                                ),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      color: pickerLightGreyColor),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.search,
                                      color: pickerPrimaryColor,
                                      size: 22,
                                    ),
                                    onPressed: () {},
                                  )),
                            ],
                          ))
                    ],
                  ),
                ),

                SizedBox(
                  height: size.height * 0.05,
                ),
                BlocBuilder<PickerBloc, PickerState>(
                  builder: (context, state) {
                    if (state is PickupListFetching) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is PickupListFetched) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            border: TableBorder.all(color: pickerPrimaryColor),
                            columns: [
                              DataColumn(label: Center(child: Text("Sl.No"))),
                              DataColumn(label: Center(child: Text("Ord.No"))),
                              DataColumn(
                                  label: Center(child: Text("Customer Name"))),
                              DataColumn(
                                  label: Center(child: Text("Whatsapp.No"))),
                              DataColumn(label: Center(child: Text("Location"))),
                              DataColumn(label: Center(child: Text("Build.No"))),
                              DataColumn(
                                  label: Center(child: Text("Pickup Time"))),
                              DataColumn(
                                  label: Center(child: Text("Action", textAlign: TextAlign.center,))),
                            ],
                            rows: List<DataRow>.generate(
                              state.fData.length,
                                  (index) {
                                final tData = state.fData[index];
                                return DataRow(
                                    color: MaterialStateColor.resolveWith((states) {
                                      if (state.fData[index].orderType == "Urgent")  {
                                        return Colors.deepOrange;//make tha magic!
                                      } else if (state.fData[index].orderType == "Express") {
                                        return Colors.amber;
                                      } else {
                                        return Colors.transparent;
                                      }
                                    }),
                                    cells: [
                                      DataCell(Center(child: Text((index+1).toString()))),
                                      DataCell(Center(child: Text(tData.orderNumber))),
                                      DataCell(Center(child: Text(tData.customer.name))),
                                      DataCell(Center(child: Text(tData.customer.whatsApp))),
                                      DataCell(Center(child: Text(tData.customer.location))),
                                      DataCell(Center(child: Text(tData.customer.buildingNo))),
                                      DataCell(Center(child: Text(tData.pickupTime))),
                                      DataCell(Center(child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: pickerPrimaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8),
                                            )
                                        ),
                                        onPressed: (){
                                          Map<String, String> body = {
                                            "id":authData.user_id.toString(),
                                            "order_id":tData.orderId,
                                            "pickup_date":DateFormat('yyyy-MM-dd').format(tData.pickupDate).toString(),
                                            "pickup_time":tData.pickupTime
                                          };
                                          BlocProvider.of<PickerBloc>(context).add(PickerConfirmOrderEvent(body, authData.user_token.toString()));
                                          Future.delayed(
                                            Duration(seconds: 2),
                                            () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage(),), (route) => false),
                                          );
                                        },
                                        child: Text(
                                          "Confirm Order",
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                        ),
                                      ))),

                                    ]
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Center(child: Text('No Data'));
                    }
                  },
                ),
                // Icon(
                //   Icons.keyboard_double_arrow_down_outlined,
                //   color: pickerPrimaryColor,
                // ),
                // Icon(
                //   Icons.keyboard_double_arrow_down_outlined,
                //   color: pickerPrimaryColor,
                // ),
                // SizedBox(
                //   height: size.height * 0.05,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Container(
                //       margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                //       height: size.height * 0.22,
                //       width: MediaQuery.of(context).size.width* 0.9, // Increased width
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
                //                 width: MediaQuery.of(context)
                //                     .size
                //                     .width/0.8, // Increased width
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
                //
                //               Container(
                //                 height: size.height * 0.13,
                //                 width: MediaQuery.of(context)
                //                     .size
                //                     .width * 1.35,
                //                 child: ListView.builder(
                //                   padding: EdgeInsets.zero,
                //                   scrollDirection: Axis.vertical,
                //                   physics: const ClampingScrollPhysics(),
                //                   itemCount: 2,
                //                   itemBuilder:
                //                       (BuildContext context, int rowIndex) {
                //                     return SizedBox(
                //                       height: size.height * 0.05,
                //                       width: MediaQuery.of(context).size.width *1.5,
                //                       child: ListView.builder(
                //                         itemCount: 1,
                //                         scrollDirection: Axis.vertical,
                //                         itemBuilder: (context, index) {
                //                           return Container(
                //                             margin: EdgeInsets.symmetric(
                //                                 horizontal: size.width * 0.05),
                //                             height: size.height * 0.05,
                //                             width:
                //                             MediaQuery.of(context).size.width * 1.5,
                //                             // Increased width
                //                             child: Row(
                //                               children: [
                //                                 Expanded(
                //                                   child: Container(
                //                                     width: size.width * 0.15,
                //                                     alignment: Alignment.center,
                //                                     decoration: BoxDecoration(
                //                                       border: Border.all(
                //                                           color:
                //                                           Colors.deepPurple),
                //                                     ),
                //                                     child: Text(
                //                                       "",
                //                                       style: TextStyle(
                //                                         color: Colors.black,
                //                                       ),
                //                                     ),
                //                                   ),
                //                                 ),
                //                                 Expanded(
                //                                   child: Container(
                //                                     width: size.width * 0.15,
                //                                     alignment: Alignment.center,
                //                                     decoration: BoxDecoration(
                //                                       border: Border.all(
                //                                           color:
                //                                           Colors.deepPurple),
                //                                     ),
                //                                     child: Text(
                //                                       "",
                //                                       style: TextStyle(
                //                                         color: Colors.black,
                //                                       ),
                //                                     ),
                //                                   ),
                //                                 ),
                //                                 Expanded(
                //                                   child: Container(
                //                                     width: size.width * 0.15,
                //                                     alignment: Alignment.center,
                //                                     decoration: BoxDecoration(
                //                                       border: Border.all(
                //                                           color:
                //                                           Colors.deepPurple),
                //                                     ),
                //                                     child: Text(
                //                                       "",
                //                                       style: TextStyle(
                //                                         color: Colors.black,
                //                                       ),
                //                                     ),
                //                                   ),
                //                                 ),
                //                                 Expanded(
                //                                   child: Container(
                //                                     width: size.width * 0.15,
                //                                     alignment: Alignment.center,
                //                                     decoration: BoxDecoration(
                //                                       border: Border.all(
                //                                           color:
                //                                           Colors.deepPurple),
                //                                     ),
                //                                     child: Text(
                //                                       "",
                //                                       style: TextStyle(
                //                                         color: Colors.black,
                //                                       ),
                //                                     ),
                //                                   ),
                //                                 ),
                //
                //                               ],
                //                             ),
                //                           );
                //                         },
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
                // ),
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
      ),
    );
  }
}
