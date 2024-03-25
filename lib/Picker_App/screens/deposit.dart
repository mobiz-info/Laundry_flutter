import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/PickerBloc/picker_bloc.dart';
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

class DepositScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DepositScreenState();
}

class DepositScreenState extends State<DepositScreen> {
  int count = 0;
  bool isChecked = false;
  TextEditingController _cdController = TextEditingController();

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.red;
    }
    return pickerPrimaryColor;
  }
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => PickerBloc(
        RepositoryProvider.of<PickerRepository>(context)
      ),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
          Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
          child:Appbar(
              text: 'Deposit',
          ),
        ),
        drawer: const MenuDrawer(),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                BlocProvider(
                  create: (context) => PickerBloc(
                    RepositoryProvider.of<PickerRepository>(context),
                  ),
                  child: BlocListener<PickerBloc, PickerState>(
                    listener: (context, state) {
                      if (state is DepositAddedState) {
                        print(state.toString());
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
                      }
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BlocBuilder<PickerBloc, PickerState>(
                            buildWhen: (previous, current) {
                              current = PickerInitial();
                              return true;
                            },
                            builder: (context, state) {
                              if (state is DepositAddingState) {
                                print(state.toString());
                                return Container(
                                  margin: EdgeInsets.only(top: size.height * 0.03,left: size.width * 0.06),
                                  padding: EdgeInsets.all(smallTextPadding),
                                  width: size.width * 0.3,
                                  child:  ElevatedButton(
                                    onPressed: (){},
                                    // onPressed: () {
                                    //   final authData = AuthData();
                                    //   BlocProvider.of<PickerBloc>(context).add(AddDepositEvent(authData.user_token.toString(),authData.user_id.toString(), _cdController.text ?? '0'));
                                    // },
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
                              }  else if (state is DepositErrorState) {
                                print(state.toString());
                                return Container(
                                  margin: EdgeInsets.only(top: size.height * 0.03,left: size.width * 0.06),
                                  padding: EdgeInsets.all(smallTextPadding),
                                  width: size.width * 0.3,
                                  child:  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => DepositScreen()), (route) => false);
                                    },
                                    // onPressed: () {
                                    //   final authData = AuthData();
                                    //   BlocProvider.of<PickerBloc>(context).add(AddDepositEvent(authData.user_token.toString(),authData.user_id.toString(), _cdController.text ?? '0'));
                                    // },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.redAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),

                                      ),
                                      elevation: 15.0,
                                    ),
                                    child:  Text(
                                      'Try Again!',
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
                                  margin: EdgeInsets.only(top: size.height * 0.03,left: size.width * 0.06),
                                  padding: EdgeInsets.all(smallTextPadding),
                                  width: size.width * 0.3,
                                  child:  ElevatedButton(
                                    onPressed: () {
                                      if (_cdController.text.isNotEmpty) {
                                        final authData = AuthData();
                                        BlocProvider.of<PickerBloc>(context).add(AddDepositEvent(authData.user_token.toString(),authData.user_id.toString(), _cdController.text ?? '0'));
                                      } else {

                                      }
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
                            },
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: size.height * 0.03,right: size.width *0.06),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child:  Text('Cash Collect: 150',style: TextStyle(color: pickerPrimaryColor),),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: size.height * 0.01),
                                  alignment: Alignment.center,
                                  child:  Text('Cheque in hand: 100',style: TextStyle(color: pickerPrimaryColor)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: size.height * 0.01),
                                  alignment: Alignment.center,
                                  child:  Text('No of Cheques: 2',style: TextStyle(color: pickerPrimaryColor)),
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                Column(
                  children: [

                  ],
                ),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.08,top: size.height * 0.03),
                    width: size.width * 0.25,
                    height: size.height * 0.04,
                    decoration: ShapeDecoration(
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                            side: BorderSide(width: 1, color: pickerPrimaryColor))),
                    child: Center(
                      child: Text('Date'),
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.025),
                      alignment: Alignment.center,
                      child:  Text('Cash Deposited',style: TextStyle(color: pickerPrimaryColor)),
                    ),
                    Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.08,top: size.height * 0.03),
                        width: size.width * 0.3,
                        height: size.height * 0.04,
                        decoration: ShapeDecoration(
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                                side: BorderSide(width: 1, color: pickerPrimaryColor))),
                        child: Container(
                          padding: EdgeInsets.all(1),
                          margin: EdgeInsets.only(top: size.height * 0.015),
                          child: TextFormField(
                            controller: _cdController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: '0',
                                border: null
                            ),
                          ),
                        )
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child:  Text('Cheque Deposited',style: TextStyle(color: pickerPrimaryColor)),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                          height: size.height * 0.24,
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
                                              "",
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
                                              " No",
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
                                              "Bank",
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
                                              "Date",
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
                                              "Amout",
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
                                        return SizedBox(
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
                                                            alignment:
                                                            Alignment.center,
                                                            decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .deepPurple),),
                                                            child: Checkbox(
                                                              checkColor: Colors.white,
                                                              fillColor: MaterialStateProperty.resolveWith(getColor),
                                                              value: isChecked,
                                                              onChanged: (bool? value) {
                                                                setState(() {
                                                                  isChecked = value!;
                                                                });
                                                              },
                                                            ))),
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
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                )
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
