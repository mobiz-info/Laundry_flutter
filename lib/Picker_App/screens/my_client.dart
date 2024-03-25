import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/PickerBloc/picker_bloc.dart';
import 'package:golden_falcon/Picker_App/screens/add_client.dart';
import 'package:golden_falcon/Picker_App/screens/edit_client.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Repositories/PickerRepo/picker_repo.dart';

import '../../Customers/Customer_Home.dart';
import '../src/colors.dart';
import '../src/dimen.dart';
import '../src/textString.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/custom_shape.dart';
import '../util/drawer.dart';
import 'navigation.dart';

class MyClientScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyClientScreenState();
}

class MyClientScreenState extends State<MyClientScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => PickerBloc(
        RepositoryProvider.of<PickerRepository>(context),
      )..add(ListAllClientsEvent(
          authData.user_id.toString(), authData.user_token.toString())),
      child: Scaffold(
        // key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
          child: Appbar(
            text: 'My Client',
          ),
        ),
        drawer: const MenuDrawer(),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: size.height * 0.03, left: size.width * 0.06),
                    padding: EdgeInsets.all(smallTextPadding),
                    width: size.width * 0.33,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => AddClientScreen(fromHome: false),
                          ),
                          (route) => false),
                      style: ElevatedButton.styleFrom(
                        primary: pickerPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        elevation: 15.0,
                      ),
                      child: Text(
                        'Add New',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
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
                      ))
                ],
              ),
             BlocBuilder<PickerBloc, PickerState>(
               builder: (context, state) {
                 if (state is FetchingClientList) {
                   print(state.toString());
                   return Center(child: CircularProgressIndicator());
                 } else if (state is FetchedClientList) {
                   print(state.toString());
                   return  SizedBox(
                     height: MediaQuery.of(context).size.height / 2,
                     child: ListView.builder(
                       itemCount: state.customerList.length,
                       itemBuilder: (BuildContext context, int index) {
                         return GestureDetector(
                           child: Container(
                             margin: EdgeInsets.only(bottom: size.width * 0.05),
                             child: Column(
                               children: [
                                 Container(
                                   margin: EdgeInsets.only(top: size.height * 0.05),
                                   width: size.width * 0.9,
                                   height: size.height * 0.25,
                                   decoration: ShapeDecoration(
                                       color: Colors.white,
                                       shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(10.0),
                                           side: BorderSide(
                                               width: 2,
                                               color: pickerPrimaryColor))),
                                   child: Column(
                                     mainAxisAlignment:
                                     MainAxisAlignment.spaceAround,
                                     children: [
                                       Row(
                                         children: [
                                           Container(
                                             margin: EdgeInsets.only(
                                                 left: size.width * 0.03),
                                             child: Text('Customer Name :'),
                                           ),
                                           Container(
                                             margin: EdgeInsets.only(
                                                 left: size.width * 0.03),
                                             child: Text(state.customerList[index].name),
                                           )
                                         ],
                                       ),
                                       Row(
                                         children: [
                                           Container(
                                             margin: EdgeInsets.only(
                                                 left: size.width * 0.03),
                                             child: Text('Customer Type :'),
                                           ),
                                           Container(
                                             margin: EdgeInsets.only(
                                                 left: size.width * 0.03),
                                             child: Text(state.customerList[index].customerType),
                                           )
                                         ],
                                       ),
                                       Row(
                                         children: [
                                           Container(
                                               margin: EdgeInsets.only(
                                                   left: size.width * 0.03),
                                               child:
                                               Text('Door No,Building Name :')),
                                           Container(
                                             margin: EdgeInsets.only(
                                                 left: size.width * 0.03),
                                             child: Text(state.customerList[index].buildingNo),
                                           )
                                         ],
                                       ),
                                       Row(
                                         children: [
                                           Container(
                                               margin: EdgeInsets.only(
                                                   left: size.width * 0.03),
                                               child: Text('Mobile No. :')),
                                           Container(
                                             margin: EdgeInsets.only(
                                                 left: size.width * 0.03),
                                             child: Text(state.customerList[index].mobile),
                                           )
                                         ],
                                       ),
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.end,
                                         children: [
                                           Container(
                                               margin: EdgeInsets.only(
                                                   left: size.width * 0.03),
                                               child: CircleAvatar(
                                                 radius: 15,
                                                 backgroundColor:
                                                 pickerPrimaryColor, //<-- SEE HERE
                                                 child: Center(
                                                   child: IconButton(
                                                     icon: Icon(
                                                       Icons.call,
                                                       color: Colors.white,
                                                       size: 15,
                                                     ),
                                                     onPressed: () {},
                                                   ),
                                                 ),
                                               )),
                                           Container(
                                               margin: EdgeInsets.only(
                                                   left: size.width * 0.03),
                                               child: CircleAvatar(
                                                 radius: 15,
                                                 backgroundColor:
                                                 pickerPrimaryColor, //<-- SEE HERE
                                                 child: Center(
                                                   child: IconButton(
                                                     icon: Icon(
                                                       Icons.remove_red_eye_outlined,
                                                       color: Colors.white,
                                                       size: 15,
                                                     ),
                                                     onPressed: () {},
                                                   ),
                                                 ),
                                               )),
                                           Container(
                                               margin: EdgeInsets.only(
                                                   left: size.width * 0.03),
                                               child: CircleAvatar(
                                                 radius: 15,
                                                 backgroundColor:
                                                 pickerPrimaryColor, //<-- SEE HERE
                                                 child: Center(
                                                   child: IconButton(
                                                     icon: Icon(
                                                       Icons.location_on,
                                                       color: Colors.white,
                                                       size: 15,
                                                     ),
                                                     onPressed: () {
                                                       Navigator.push(
                                                           context,
                                                           MaterialPageRoute(
                                                             builder: (context) =>
                                                                 NavigationScreen(),
                                                           ));
                                                     },
                                                   ),
                                                 ),
                                               )),
                                           Container(
                                               margin: EdgeInsets.only(
                                                   left: size.width * 0.03,
                                                   right: size.width * 0.03),
                                               child: CircleAvatar(
                                                 radius: 15,
                                                 backgroundColor:
                                                 pickerPrimaryColor, //<-- SEE HERE
                                                 child: Center(
                                                   child: IconButton(
                                                     icon: Icon(
                                                       Icons
                                                           .mode_edit_outline_outlined,
                                                       color: Colors.white,
                                                       size: 15,
                                                     ),
                                                     onPressed: () {},
                                                   ),
                                                 ),
                                               )),
                                         ],
                                       ),
                                     ],
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           onTap: () {
                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                 builder: (context) => CustomerHomeScreen(),
                               ),
                             );
                           },
                         );
                       },
                     ),
                   );
                 } else {
                   print(state.toString());
                   return Center(child: Text("No Client Data"));
                 }
               },
             ),
            ],
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
