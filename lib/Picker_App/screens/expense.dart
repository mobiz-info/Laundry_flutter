import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/PickerBloc/picker_bloc.dart';
import 'package:golden_falcon/Repositories/PickerRepo/picker_repo.dart';
import 'package:golden_falcon/Utils/common.dart';

import '../src/colors.dart';
import '../src/dimen.dart';
import '../src/textString.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/custom_shape.dart';
import '../util/drawer.dart';
import 'add_expense.dart';

class ExpenseScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExpenseScreenState();
}

class ExpenseScreenState extends State<ExpenseScreen> {
  bool valuefirst = false;

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final authData = AuthData();
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => PickerBloc(
        RepositoryProvider.of<PickerRepository>(context),
      )..add(ExpenseListFetchEvent(authData.user_token.toString(), authData.user_id.toString())),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize:
          Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
          child: Appbar(text: 'Expense',),
        ),
        drawer: const MenuDrawer(),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [

                Container(
                  margin: EdgeInsets.only(top: size.height * 0.01,left: size.width * 0.06),
                  padding: EdgeInsets.all(smallTextPadding),
                  width: size.width * 0.3,
                  child:  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder:
                              (context) =>  AddExpenseScreen(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: pickerPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),

                      ),
                      elevation: 15.0,
                    ),
                    child:  Text(
                      'Add',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      Center(
                          child: Text(
                            'From Date :',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          )),
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.08),
                          width: size.width * 0.2,
                          height: size.height * 0.04,
                          decoration: ShapeDecoration(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                  side: BorderSide(width: 1, color: pickerPrimaryColor))),
                          child: Container(
                            margin: EdgeInsets.only(top: size.height * 0.015),
                            alignment: Alignment.center,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  hintText: 'From Date'
                              ),
                            ),
                          )
                      ),
                      Spacer(),
                      Center(
                          child: Text(
                            'To Date :',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          )),
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.08),
                          width: size.width * 0.2,
                          height: size.height * 0.04,
                          decoration: ShapeDecoration(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                  side: BorderSide(width: 1, color: pickerPrimaryColor))),
                          child: Container(
                            margin: EdgeInsets.only(top: size.height * 0.015),
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  hintText: 'To Date'
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: size.height * 0.05,
                ),
                BlocBuilder<PickerBloc, PickerState>(
                  builder: (context, state) {
                      if (state is ExpenseFetchingState)  {
                        return Text("Fetching...");
                      } else if  (state is ExpenseFetchedState) {
                          return DataTable(
                            columns: [
                              DataColumn(label: Text('Sl. No')),
                              DataColumn(label: Text('Expense Head')),
                              DataColumn(label: Text('Amount')),
                            ],
                            rows: state.expenseData.map((e) {
                              return DataRow(
                                cells: [
                                  DataCell(Text('0')),
                                  DataCell(Text(e.expenseType.toString())),
                                  DataCell(Text(e.amount.toString())),
                                ]
                              );
                            }).toList(),
                          );
                      } else {
                        return Text("Error");
                      }
                  },
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
                //                           "Expense Head",
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
                //                     Expanded(
                //                       flex:6,
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
                //                       flex: 3,
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
