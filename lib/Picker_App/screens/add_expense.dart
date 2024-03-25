import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/PickerBloc/picker_bloc.dart';
import 'package:golden_falcon/Models/PickerModel/expense_drop_down_model.dart';
import 'package:golden_falcon/Picker_App/screens/homepage.dart';
import 'package:golden_falcon/Repositories/PickerRepo/picker_repo.dart';
import 'package:golden_falcon/Utils/common.dart';

import '../src/colors.dart';
import '../src/dimen.dart';
import '../src/textString.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/custom_shape.dart';
import '../util/drawer.dart';

class AddExpenseScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddExpenseScreenState();
}

class AddExpenseScreenState extends State<AddExpenseScreen> {
  bool valuefirst = false;
  String selectedItem = 'Select Head';
  TextEditingController _amountController = TextEditingController();
  TextEditingController _remarkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final authData = AuthData();
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => PickerBloc(
        RepositoryProvider.of<PickerRepository>(context),
      )..add(ExpenseHeadGetEvent(authData.user_token.toString())),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
          Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
          child: Appbar(text: 'Add Expense',),
        ),
        drawer: const MenuDrawer(),
        body: SingleChildScrollView(
          child: BlocBuilder<PickerBloc, PickerState>(
            builder: (context, state) {
              if (state is ExpenseHeadSuccessState) {
                print(state.toString());
                List data = [];
                data.add('Select Head');
                var datum = jsonDecode(state.data);
                for (var key in datum.keys) {
                  data.add(datum[key]);
                }
                return Container(
                  color: Colors.white,
                  child: Column(
                    children: [

                      BlocProvider(
                        create: (context) => PickerBloc(
                          RepositoryProvider.of<PickerRepository>(context),
                        ),
                        child: BlocListener<PickerBloc, PickerState>(
                          listener: (context, state) {
                            if (state is AddedExpenseState) {
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
                            }
                          },
                          child: BlocBuilder<PickerBloc, PickerState>(
                            builder: (context, state) {
                              if (state is AddingExpenseState) {
                                print(state.toString());
                                return Container(
                                  margin: EdgeInsets.only(top: size.height * 0.01,left: size.width * 0.06),
                                  padding: EdgeInsets.all(smallTextPadding),
                                  width: size.width * 0.3,
                                  child:  ElevatedButton(
                                    onPressed: () {

                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.greenAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),

                                      ),
                                      elevation: 15.0,
                                    ),
                                    child:  Text(
                                      'Adding..',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                );
                              } else {
                                print(state.toString());
                                return Container(
                                  margin: EdgeInsets.only(top: size.height * 0.01,left: size.width * 0.06),
                                  padding: EdgeInsets.all(smallTextPadding),
                                  width: size.width * 0.3,
                                  child:  ElevatedButton(
                                    onPressed: () {
                                      final authData = AuthData();
                                      Map<String, String> body = {
                                        "id":authData.user_id.toString(),
                                        "expense_type":selectedItem,
                                        "Remarks":_remarkController.text,
                                        "Amount":_amountController.text
                                      };
                                      BlocProvider.of<PickerBloc>(context).add(ExpenseAddEvent(body, authData.user_token.toString()));
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
                                );
                              }
                          },),
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: size.width * 0.03,top: size.height*0.03),
                          width: size.width * 0.3,
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
                                  hintText: 'Date'
                              ),
                            ),
                          )
                      ),
                      DropdownButton(
                        items: data.map((e) {
                          return DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (value) {
                            setState(() {
                              selectedItem = value.toString();
                            });
                        },
                        value: selectedItem,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(top: size.height * 0.02),
                                    child:  Text('Amount'),
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(left: size.width * 0.03,top: size.height*0.03),
                                      width: size.width * 0.45,
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
                                          controller: _amountController,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                              hintText: ''
                                          ),
                                        ),
                                      )
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(top: size.height * 0.02),
                                    child:  Text('Remarks'),
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(left: size.width * 0.03,top: size.height*0.03),
                                      width: size.width * 0.45,
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
                                          controller: _remarkController,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                              hintText: ''
                                          ),
                                        ),
                                      )
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                              alignment: Alignment.topCenter,
                              margin: EdgeInsets.only(left: size.width * 0.03,top: size.height*0.03),
                              width: size.width * 0.15,
                              height: size.height * 0.08,
                              decoration: ShapeDecoration(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.0),
                                      side: BorderSide(width: 1, color: pickerPrimaryColor))),
                              child: Container(
                                  margin: EdgeInsets.only(top: size.height * 0.015),
                                  alignment: Alignment.center,
                                  child: Text('Bill Pic')
                              )
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: size.height * 0.01,left: size.width * 0.06),
                        padding: EdgeInsets.all(smallTextPadding),
                        width: size.width * 0.25,
                        child:  ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            primary: pickerPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),

                            ),
                            elevation: 15.0,
                          ),
                          child:  Text(
                            'Save',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),


                    ],
                  ),
                );
              } else {
                print(state.toString());
                return Container(
                  color: Colors.white,
                  child: Column(
                    children: [

                      Container(
                        margin: EdgeInsets.only(top: size.height * 0.01,left: size.width * 0.06),
                        padding: EdgeInsets.all(smallTextPadding),
                        width: size.width * 0.3,
                        child:  ElevatedButton(
                          onPressed: () {

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
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: size.width * 0.03,top: size.height*0.03),
                          width: size.width * 0.3,
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
                                  hintText: 'Date'
                              ),
                            ),
                          )
                      ),
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: size.width * 0.03,top: size.height*0.03),
                          width: size.width * 0.4,
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
                                  hintText: 'Expense Head'
                              ),
                            ),
                          )
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(top: size.height * 0.02),
                                    child:  Text('Amount'),
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(left: size.width * 0.03,top: size.height*0.03),
                                      width: size.width * 0.45,
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
                                              hintText: ''
                                          ),
                                        ),
                                      )
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(top: size.height * 0.02),
                                    child:  Text('Remarks'),
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(left: size.width * 0.03,top: size.height*0.03),
                                      width: size.width * 0.45,
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
                                              hintText: ''
                                          ),
                                        ),
                                      )
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                              alignment: Alignment.topCenter,
                              margin: EdgeInsets.only(left: size.width * 0.03,top: size.height*0.03),
                              width: size.width * 0.15,
                              height: size.height * 0.08,
                              decoration: ShapeDecoration(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.0),
                                      side: BorderSide(width: 1, color: pickerPrimaryColor))),
                              child: Container(
                                  margin: EdgeInsets.only(top: size.height * 0.015),
                                  alignment: Alignment.center,
                                  child: Text('Bill Pic')
                              )
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: size.height * 0.01,left: size.width * 0.06),
                        padding: EdgeInsets.all(smallTextPadding),
                        width: size.width * 0.25,
                        child:  ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            primary: pickerPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),

                            ),
                            elevation: 15.0,
                          ),
                          child:  Text(
                            'Save',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
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
