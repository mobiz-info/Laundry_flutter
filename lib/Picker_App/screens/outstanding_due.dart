import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/PickerBloc/picker_bloc.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Repositories/PickerRepo/picker_repo.dart';

import '../src/colors.dart';
import '../src/dimen.dart';
import '../src/textString.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/custom_shape.dart';
import '../util/drawer.dart';
import 'individul_outstanding_due.dart';

class OutStandinDueScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OutStandinDueScreenState();
}

enum Mode { cash, cheque, wallet }

class OutStandinDueScreenState extends State<OutStandinDueScreen> {
  bool valuefirst = false;

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => PickerBloc(
        RepositoryProvider.of<PickerRepository>(context),
      )..add(OutstandingDueFetchEvent(
          authData.user_id.toString(), authData.user_token.toString())),
      child: BlocBuilder<PickerBloc, PickerState>(
        builder: (context, state) {
          if (state is OutstandingFetchingState) {
            return Scaffold(
              // key: _scaffoldKey,
              appBar: PreferredSize(
                preferredSize:
                    Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
                child: Appbar(
                  text: 'OutStanding',
                ),
              ),
              drawer: const MenuDrawer(),
              // body: SingleChildScrollView(
              //   child: Container(
              //     color: Colors.white,
              //     child: Column(
              //       children: [
              //
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           children: [
              //             Container(
              //               margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              //               height: size.height * 0.24,
              //               width: MediaQuery.of(context).size.width *
              //                   0.9, // Increased width
              //               child: ListView.builder(
              //                 itemCount: 1,
              //                 padding: EdgeInsets.zero,
              //                 scrollDirection: Axis.horizontal,
              //                 physics: const ClampingScrollPhysics(),
              //                 itemBuilder: (context, index) {
              //                   return Column(
              //                     children: [
              //                       Container(
              //                         margin: EdgeInsets.symmetric(
              //                             horizontal: size.width * 0.05),
              //                         height: size.height * 0.08,
              //                         width: MediaQuery.of(context).size.width /
              //                             0.8, // Increased width
              //                         child: Row(
              //                           children: [
              //                             Expanded(
              //                               child: Container(
              //                                 alignment: Alignment.center,
              //                                 decoration: BoxDecoration(
              //                                   border:
              //                                   Border.all(color: Colors.deepPurple),
              //                                 ),
              //                                 child: Text(
              //                                   " Sl No",
              //                                   style: TextStyle(
              //                                     color: Colors.deepPurple,
              //                                     fontWeight: FontWeight.bold,
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                             Expanded(
              //                               child: Container(
              //                                 alignment: Alignment.center,
              //                                 decoration: BoxDecoration(
              //                                   border:
              //                                   Border.all(color: Colors.deepPurple),
              //                                 ),
              //                                 child: Text(
              //                                   "Customer Name",
              //                                   style: TextStyle(
              //                                     color: Colors.deepPurple,
              //                                     fontWeight: FontWeight.bold,
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                             Expanded(
              //                               child: Container(
              //                                 alignment: Alignment.center,
              //                                 decoration: BoxDecoration(
              //                                   border:
              //                                   Border.all(color: Colors.deepPurple),
              //                                 ),
              //                                 child: Text(
              //                                   "Locality/Area",
              //                                   style: TextStyle(
              //                                     color: Colors.deepPurple,
              //                                     fontWeight: FontWeight.bold,
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                             Expanded(
              //                               child: Container(
              //                                 alignment: Alignment.center,
              //                                 decoration: BoxDecoration(
              //                                   border:
              //                                   Border.all(color: Colors.deepPurple),
              //                                 ),
              //                                 child: Text(
              //                                   "Amount",
              //                                   style: TextStyle(
              //                                     color: Colors.deepPurple,
              //                                     fontWeight: FontWeight.bold,
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                             Expanded(
              //                               child: Container(
              //                                 alignment: Alignment.center,
              //                                 decoration: BoxDecoration(
              //                                   border:
              //                                   Border.all(color: Colors.deepPurple),
              //                                 ),
              //                                 child: Text(
              //                                   "Balance amt",
              //                                   style: TextStyle(
              //                                     color: Colors.deepPurple,
              //                                     fontWeight: FontWeight.bold,
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                       Container(
              //                         height: size.height * 0.1,
              //                         width: MediaQuery.of(context).size.width * 1.35,
              //                         child: ListView.builder(
              //                           padding: EdgeInsets.zero,
              //                           scrollDirection: Axis.vertical,
              //                           physics: const ClampingScrollPhysics(),
              //                           itemCount: 2,
              //                           itemBuilder:
              //                               (BuildContext context, int rowIndex) {
              //                             return GestureDetector(
              //                               onTap: (){
              //                                 Navigator.push(context,
              //                                     MaterialPageRoute(builder:
              //                                         (context) =>  IndividualOutStandinDueScreen(),
              //                                     ));
              //                               },
              //                               child: SizedBox(
              //                                 height: size.height * 0.05,
              //                                 width:
              //                                 MediaQuery.of(context).size.width * 1.5,
              //                                 child: ListView.builder(
              //                                   itemCount: 1,
              //                                   scrollDirection: Axis.vertical,
              //                                   itemBuilder: (context, index) {
              //                                     return Container(
              //                                       margin: EdgeInsets.symmetric(
              //                                           horizontal: size.width * 0.05),
              //                                       height: size.height * 0.05,
              //                                       width:
              //                                       MediaQuery.of(context).size.width *
              //                                           1.5,
              //                                       // Increased width
              //                                       child: Row(
              //                                         children: [
              //                                           Expanded(
              //                                             child: Container(
              //                                               width: size.width * 0.15,
              //                                               alignment: Alignment.center,
              //                                               decoration: BoxDecoration(
              //                                                 border: Border.all(
              //                                                     color: Colors.deepPurple),
              //                                               ),
              //                                               child: Text(
              //                                                 "",
              //                                                 style: TextStyle(
              //                                                   color: Colors.black,
              //                                                 ),
              //                                               ),
              //                                             ),
              //                                           ),
              //                                           Expanded(
              //                                             child: Container(
              //                                               width: size.width * 0.15,
              //                                               alignment: Alignment.center,
              //                                               decoration: BoxDecoration(
              //                                                 border: Border.all(
              //                                                     color: Colors.deepPurple),
              //                                               ),
              //                                               child: Text(
              //                                                 "",
              //                                                 style: TextStyle(
              //                                                   color: Colors.black,
              //                                                 ),
              //                                               ),
              //                                             ),
              //                                           ),
              //                                           Expanded(
              //                                             child: Container(
              //                                               width: size.width * 0.15,
              //                                               alignment: Alignment.center,
              //                                               decoration: BoxDecoration(
              //                                                 border: Border.all(
              //                                                     color: Colors.deepPurple),
              //                                               ),
              //                                               child: Text(
              //                                                 "",
              //                                                 style: TextStyle(
              //                                                   color: Colors.black,
              //                                                 ),
              //                                               ),
              //                                             ),
              //                                           ),
              //                                           Expanded(
              //                                             child: Container(
              //                                               width: size.width * 0.15,
              //                                               alignment: Alignment.center,
              //                                               decoration: BoxDecoration(
              //                                                 border: Border.all(
              //                                                     color: Colors.deepPurple),
              //                                               ),
              //                                               child: Text(
              //                                                 "",
              //                                                 style: TextStyle(
              //                                                   color: Colors.black,
              //                                                 ),
              //                                               ),
              //                                             ),
              //                                           ),
              //                                           Expanded(
              //                                             child: Container(
              //                                               width: size.width * 0.15,
              //                                               alignment: Alignment.center,
              //                                               decoration: BoxDecoration(
              //                                                 border: Border.all(
              //                                                     color: Colors.deepPurple),
              //                                               ),
              //                                               child: Text(
              //                                                 "",
              //                                                 style: TextStyle(
              //                                                   color: Colors.black,
              //                                                 ),
              //                                               ),
              //                                             ),
              //                                           ),
              //                                         ],
              //                                       ),
              //                                     );
              //                                   },
              //                                 ),
              //                               ),
              //                             );
              //                           },
              //                         ),
              //                       ),
              //                       Container(
              //                         height: size.height * 0.05,
              //                         width: MediaQuery.of(context).size.width /
              //                             0.8, // Increased width
              //                         child: Row(
              //                           children: [
              //                             Expanded(
              //                               flex: 4,
              //                               child: Container(
              //                                 alignment: Alignment.center,
              //                                 decoration: BoxDecoration(
              //                                   border:
              //                                   Border.all(color: Colors.deepPurple),
              //                                 ),
              //                                 child: Text(
              //                                   " Total",
              //                                   style: TextStyle(
              //                                     color: Colors.deepPurple,
              //                                     fontWeight: FontWeight.bold,
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                             Expanded(
              //                               flex: 1,
              //                               child: Container(
              //                                 alignment: Alignment.center,
              //                                 decoration: BoxDecoration(
              //                                   border:
              //                                   Border.all(color: Colors.deepPurple),
              //                                 ),
              //                                 child: Text(
              //                                   "100",
              //                                   style: TextStyle(
              //                                     color: Colors.deepPurple,
              //                                     fontWeight: FontWeight.bold,
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ],
              //                   );
              //                 },
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: size.height * 0.01,
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.end,
              //           children: [
              //             Text('Balance '),
              //             SizedBox(
              //               width: size.width * 0.02,
              //             ),
              //             Container(
              //               width: MediaQuery.of(context).size.width * 0.2,
              //               height:  size.height * 0.08,
              //               margin: EdgeInsets.only(top: size.height * 0.02),
              //               child: Align(
              //                 alignment: Alignment.topCenter,
              //                 child: ElevatedButton(
              //                   onPressed: () {},
              //                   style: ElevatedButton.styleFrom(
              //                     primary: pickerPrimaryColor,
              //                     shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(5),
              //                     ),
              //                     elevation: 15.0,
              //                   ),
              //                   child: Text(
              //                     '200',
              //                     style: TextStyle(fontSize: 14,color: Colors.white),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //             SizedBox(
              //               width: size.width * 0.05,
              //             ),
              //           ],
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              body: Center(
                child: Column(
                  children: [CircularProgressIndicator(), Text("Fetching...")],
                ),
              ),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Assets/Images/bg.png'),
                      fit: BoxFit.fill),
                ),
                child: BottomDrawer(),
              ),
            );
          } else if (state is OutstandingFetchedState) {
            if (state.data!.length > 0) {
              return Scaffold(
                // key: _scaffoldKey,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(
                      MediaQuery.of(context).size.height * 0.20),
                  child: Appbar(
                    text: 'OutStanding',
                  ),
                ),
                drawer: const MenuDrawer(),
                body: SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02),
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
                                        width:
                                            MediaQuery.of(context).size.width /
                                                0.8, // Increased width
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.deepPurple),
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
                                                  border: Border.all(
                                                      color: Colors.deepPurple),
                                                ),
                                                child: Text(
                                                  "Customer Name",
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
                                                  border: Border.all(
                                                      color: Colors.deepPurple),
                                                ),
                                                child: Text(
                                                  "Locality/Area",
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
                                                  border: Border.all(
                                                      color: Colors.deepPurple),
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
                                                  border: Border.all(
                                                      color: Colors.deepPurple),
                                                ),
                                                child: Text(
                                                  "Balance amt",
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.35,
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              const ClampingScrollPhysics(),
                                          itemCount: 2,
                                          itemBuilder: (BuildContext context,
                                              int rowIndex) {
                                            return GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          IndividualOutStandinDueScreen(),
                                                    ));
                                              },
                                              child: SizedBox(
                                                height: size.height * 0.05,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    1.5,
                                                child: ListView.builder(
                                                  itemCount: 1,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  size.width *
                                                                      0.05),
                                                      height:
                                                          size.height * 0.05,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              1.5,
                                                      // Increased width
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              width:
                                                                  size.width *
                                                                      0.15,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .deepPurple),
                                                              ),
                                                              child: Text(
                                                                "",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              width:
                                                                  size.width *
                                                                      0.15,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .deepPurple),
                                                              ),
                                                              child: Text(
                                                                "",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              width:
                                                                  size.width *
                                                                      0.15,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .deepPurple),
                                                              ),
                                                              child: Text(
                                                                "",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              width:
                                                                  size.width *
                                                                      0.15,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .deepPurple),
                                                              ),
                                                              child: Text(
                                                                "",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              width:
                                                                  size.width *
                                                                      0.15,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .deepPurple),
                                                              ),
                                                              child: Text(
                                                                "",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
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
                                        width:
                                            MediaQuery.of(context).size.width /
                                                0.8, // Increased width
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.deepPurple),
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
                                              flex: 1,
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.deepPurple),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Balance '),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: size.height * 0.08,
                              margin: EdgeInsets.only(top: size.height * 0.02),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: pickerPrimaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    elevation: 15.0,
                                  ),
                                  child: Text(
                                    '200',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.05,
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
                        image: AssetImage('Assets/Images/bg.png'),
                        fit: BoxFit.fill),
                  ),
                  child: BottomDrawer(),
                ),
              );
            } else {
              return Scaffold(
                // key: _scaffoldKey,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(
                      MediaQuery.of(context).size.height * 0.20),
                  child: Appbar(
                    text: 'OutStanding',
                  ),
                ),
                drawer: const MenuDrawer(),
                // body: SingleChildScrollView(
                //   child: Container(
                //     color: Colors.white,
                //     child: Column(
                //       children: [
                //
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                //             Container(
                //               margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                //               height: size.height * 0.24,
                //               width: MediaQuery.of(context).size.width *
                //                   0.9, // Increased width
                //               child: ListView.builder(
                //                 itemCount: 1,
                //                 padding: EdgeInsets.zero,
                //                 scrollDirection: Axis.horizontal,
                //                 physics: const ClampingScrollPhysics(),
                //                 itemBuilder: (context, index) {
                //                   return Column(
                //                     children: [
                //                       Container(
                //                         margin: EdgeInsets.symmetric(
                //                             horizontal: size.width * 0.05),
                //                         height: size.height * 0.08,
                //                         width: MediaQuery.of(context).size.width /
                //                             0.8, // Increased width
                //                         child: Row(
                //                           children: [
                //                             Expanded(
                //                               child: Container(
                //                                 alignment: Alignment.center,
                //                                 decoration: BoxDecoration(
                //                                   border:
                //                                   Border.all(color: Colors.deepPurple),
                //                                 ),
                //                                 child: Text(
                //                                   " Sl No",
                //                                   style: TextStyle(
                //                                     color: Colors.deepPurple,
                //                                     fontWeight: FontWeight.bold,
                //                                   ),
                //                                 ),
                //                               ),
                //                             ),
                //                             Expanded(
                //                               child: Container(
                //                                 alignment: Alignment.center,
                //                                 decoration: BoxDecoration(
                //                                   border:
                //                                   Border.all(color: Colors.deepPurple),
                //                                 ),
                //                                 child: Text(
                //                                   "Customer Name",
                //                                   style: TextStyle(
                //                                     color: Colors.deepPurple,
                //                                     fontWeight: FontWeight.bold,
                //                                   ),
                //                                 ),
                //                               ),
                //                             ),
                //                             Expanded(
                //                               child: Container(
                //                                 alignment: Alignment.center,
                //                                 decoration: BoxDecoration(
                //                                   border:
                //                                   Border.all(color: Colors.deepPurple),
                //                                 ),
                //                                 child: Text(
                //                                   "Locality/Area",
                //                                   style: TextStyle(
                //                                     color: Colors.deepPurple,
                //                                     fontWeight: FontWeight.bold,
                //                                   ),
                //                                 ),
                //                               ),
                //                             ),
                //                             Expanded(
                //                               child: Container(
                //                                 alignment: Alignment.center,
                //                                 decoration: BoxDecoration(
                //                                   border:
                //                                   Border.all(color: Colors.deepPurple),
                //                                 ),
                //                                 child: Text(
                //                                   "Amount",
                //                                   style: TextStyle(
                //                                     color: Colors.deepPurple,
                //                                     fontWeight: FontWeight.bold,
                //                                   ),
                //                                 ),
                //                               ),
                //                             ),
                //                             Expanded(
                //                               child: Container(
                //                                 alignment: Alignment.center,
                //                                 decoration: BoxDecoration(
                //                                   border:
                //                                   Border.all(color: Colors.deepPurple),
                //                                 ),
                //                                 child: Text(
                //                                   "Balance amt",
                //                                   style: TextStyle(
                //                                     color: Colors.deepPurple,
                //                                     fontWeight: FontWeight.bold,
                //                                   ),
                //                                 ),
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                       Container(
                //                         height: size.height * 0.1,
                //                         width: MediaQuery.of(context).size.width * 1.35,
                //                         child: ListView.builder(
                //                           padding: EdgeInsets.zero,
                //                           scrollDirection: Axis.vertical,
                //                           physics: const ClampingScrollPhysics(),
                //                           itemCount: 2,
                //                           itemBuilder:
                //                               (BuildContext context, int rowIndex) {
                //                             return GestureDetector(
                //                               onTap: (){
                //                                 Navigator.push(context,
                //                                     MaterialPageRoute(builder:
                //                                         (context) =>  IndividualOutStandinDueScreen(),
                //                                     ));
                //                               },
                //                               child: SizedBox(
                //                                 height: size.height * 0.05,
                //                                 width:
                //                                 MediaQuery.of(context).size.width * 1.5,
                //                                 child: ListView.builder(
                //                                   itemCount: 1,
                //                                   scrollDirection: Axis.vertical,
                //                                   itemBuilder: (context, index) {
                //                                     return Container(
                //                                       margin: EdgeInsets.symmetric(
                //                                           horizontal: size.width * 0.05),
                //                                       height: size.height * 0.05,
                //                                       width:
                //                                       MediaQuery.of(context).size.width *
                //                                           1.5,
                //                                       // Increased width
                //                                       child: Row(
                //                                         children: [
                //                                           Expanded(
                //                                             child: Container(
                //                                               width: size.width * 0.15,
                //                                               alignment: Alignment.center,
                //                                               decoration: BoxDecoration(
                //                                                 border: Border.all(
                //                                                     color: Colors.deepPurple),
                //                                               ),
                //                                               child: Text(
                //                                                 "",
                //                                                 style: TextStyle(
                //                                                   color: Colors.black,
                //                                                 ),
                //                                               ),
                //                                             ),
                //                                           ),
                //                                           Expanded(
                //                                             child: Container(
                //                                               width: size.width * 0.15,
                //                                               alignment: Alignment.center,
                //                                               decoration: BoxDecoration(
                //                                                 border: Border.all(
                //                                                     color: Colors.deepPurple),
                //                                               ),
                //                                               child: Text(
                //                                                 "",
                //                                                 style: TextStyle(
                //                                                   color: Colors.black,
                //                                                 ),
                //                                               ),
                //                                             ),
                //                                           ),
                //                                           Expanded(
                //                                             child: Container(
                //                                               width: size.width * 0.15,
                //                                               alignment: Alignment.center,
                //                                               decoration: BoxDecoration(
                //                                                 border: Border.all(
                //                                                     color: Colors.deepPurple),
                //                                               ),
                //                                               child: Text(
                //                                                 "",
                //                                                 style: TextStyle(
                //                                                   color: Colors.black,
                //                                                 ),
                //                                               ),
                //                                             ),
                //                                           ),
                //                                           Expanded(
                //                                             child: Container(
                //                                               width: size.width * 0.15,
                //                                               alignment: Alignment.center,
                //                                               decoration: BoxDecoration(
                //                                                 border: Border.all(
                //                                                     color: Colors.deepPurple),
                //                                               ),
                //                                               child: Text(
                //                                                 "",
                //                                                 style: TextStyle(
                //                                                   color: Colors.black,
                //                                                 ),
                //                                               ),
                //                                             ),
                //                                           ),
                //                                           Expanded(
                //                                             child: Container(
                //                                               width: size.width * 0.15,
                //                                               alignment: Alignment.center,
                //                                               decoration: BoxDecoration(
                //                                                 border: Border.all(
                //                                                     color: Colors.deepPurple),
                //                                               ),
                //                                               child: Text(
                //                                                 "",
                //                                                 style: TextStyle(
                //                                                   color: Colors.black,
                //                                                 ),
                //                                               ),
                //                                             ),
                //                                           ),
                //                                         ],
                //                                       ),
                //                                     );
                //                                   },
                //                                 ),
                //                               ),
                //                             );
                //                           },
                //                         ),
                //                       ),
                //                       Container(
                //                         height: size.height * 0.05,
                //                         width: MediaQuery.of(context).size.width /
                //                             0.8, // Increased width
                //                         child: Row(
                //                           children: [
                //                             Expanded(
                //                               flex: 4,
                //                               child: Container(
                //                                 alignment: Alignment.center,
                //                                 decoration: BoxDecoration(
                //                                   border:
                //                                   Border.all(color: Colors.deepPurple),
                //                                 ),
                //                                 child: Text(
                //                                   " Total",
                //                                   style: TextStyle(
                //                                     color: Colors.deepPurple,
                //                                     fontWeight: FontWeight.bold,
                //                                   ),
                //                                 ),
                //                               ),
                //                             ),
                //                             Expanded(
                //                               flex: 1,
                //                               child: Container(
                //                                 alignment: Alignment.center,
                //                                 decoration: BoxDecoration(
                //                                   border:
                //                                   Border.all(color: Colors.deepPurple),
                //                                 ),
                //                                 child: Text(
                //                                   "100",
                //                                   style: TextStyle(
                //                                     color: Colors.deepPurple,
                //                                     fontWeight: FontWeight.bold,
                //                                   ),
                //                                 ),
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                     ],
                //                   );
                //                 },
                //               ),
                //             ),
                //           ],
                //         ),
                //         SizedBox(
                //           height: size.height * 0.01,
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.end,
                //           children: [
                //             Text('Balance '),
                //             SizedBox(
                //               width: size.width * 0.02,
                //             ),
                //             Container(
                //               width: MediaQuery.of(context).size.width * 0.2,
                //               height:  size.height * 0.08,
                //               margin: EdgeInsets.only(top: size.height * 0.02),
                //               child: Align(
                //                 alignment: Alignment.topCenter,
                //                 child: ElevatedButton(
                //                   onPressed: () {},
                //                   style: ElevatedButton.styleFrom(
                //                     primary: pickerPrimaryColor,
                //                     shape: RoundedRectangleBorder(
                //                       borderRadius: BorderRadius.circular(5),
                //                     ),
                //                     elevation: 15.0,
                //                   ),
                //                   child: Text(
                //                     '200',
                //                     style: TextStyle(fontSize: 14,color: Colors.white),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             SizedBox(
                //               width: size.width * 0.05,
                //             ),
                //           ],
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                body: Center(child: Text("No Data!")),
                bottomNavigationBar: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('Assets/Images/bg.png'),
                        fit: BoxFit.fill),
                  ),
                  child: BottomDrawer(),
                ),
              );
            }
          } else {
            return Scaffold(
              // key: _scaffoldKey,
              appBar: PreferredSize(
                preferredSize:
                    Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
                child: Appbar(
                  text: 'OutStanding',
                ),
              ),
              drawer: const MenuDrawer(),
              // body: SingleChildScrollView(
              //   child: Container(
              //     color: Colors.white,
              //     child: Column(
              //       children: [
              //
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           children: [
              //             Container(
              //               margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              //               height: size.height * 0.24,
              //               width: MediaQuery.of(context).size.width *
              //                   0.9, // Increased width
              //               child: ListView.builder(
              //                 itemCount: 1,
              //                 padding: EdgeInsets.zero,
              //                 scrollDirection: Axis.horizontal,
              //                 physics: const ClampingScrollPhysics(),
              //                 itemBuilder: (context, index) {
              //                   return Column(
              //                     children: [
              //                       Container(
              //                         margin: EdgeInsets.symmetric(
              //                             horizontal: size.width * 0.05),
              //                         height: size.height * 0.08,
              //                         width: MediaQuery.of(context).size.width /
              //                             0.8, // Increased width
              //                         child: Row(
              //                           children: [
              //                             Expanded(
              //                               child: Container(
              //                                 alignment: Alignment.center,
              //                                 decoration: BoxDecoration(
              //                                   border:
              //                                   Border.all(color: Colors.deepPurple),
              //                                 ),
              //                                 child: Text(
              //                                   " Sl No",
              //                                   style: TextStyle(
              //                                     color: Colors.deepPurple,
              //                                     fontWeight: FontWeight.bold,
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                             Expanded(
              //                               child: Container(
              //                                 alignment: Alignment.center,
              //                                 decoration: BoxDecoration(
              //                                   border:
              //                                   Border.all(color: Colors.deepPurple),
              //                                 ),
              //                                 child: Text(
              //                                   "Customer Name",
              //                                   style: TextStyle(
              //                                     color: Colors.deepPurple,
              //                                     fontWeight: FontWeight.bold,
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                             Expanded(
              //                               child: Container(
              //                                 alignment: Alignment.center,
              //                                 decoration: BoxDecoration(
              //                                   border:
              //                                   Border.all(color: Colors.deepPurple),
              //                                 ),
              //                                 child: Text(
              //                                   "Locality/Area",
              //                                   style: TextStyle(
              //                                     color: Colors.deepPurple,
              //                                     fontWeight: FontWeight.bold,
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                             Expanded(
              //                               child: Container(
              //                                 alignment: Alignment.center,
              //                                 decoration: BoxDecoration(
              //                                   border:
              //                                   Border.all(color: Colors.deepPurple),
              //                                 ),
              //                                 child: Text(
              //                                   "Amount",
              //                                   style: TextStyle(
              //                                     color: Colors.deepPurple,
              //                                     fontWeight: FontWeight.bold,
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                             Expanded(
              //                               child: Container(
              //                                 alignment: Alignment.center,
              //                                 decoration: BoxDecoration(
              //                                   border:
              //                                   Border.all(color: Colors.deepPurple),
              //                                 ),
              //                                 child: Text(
              //                                   "Balance amt",
              //                                   style: TextStyle(
              //                                     color: Colors.deepPurple,
              //                                     fontWeight: FontWeight.bold,
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                       Container(
              //                         height: size.height * 0.1,
              //                         width: MediaQuery.of(context).size.width * 1.35,
              //                         child: ListView.builder(
              //                           padding: EdgeInsets.zero,
              //                           scrollDirection: Axis.vertical,
              //                           physics: const ClampingScrollPhysics(),
              //                           itemCount: 2,
              //                           itemBuilder:
              //                               (BuildContext context, int rowIndex) {
              //                             return GestureDetector(
              //                               onTap: (){
              //                                 Navigator.push(context,
              //                                     MaterialPageRoute(builder:
              //                                         (context) =>  IndividualOutStandinDueScreen(),
              //                                     ));
              //                               },
              //                               child: SizedBox(
              //                                 height: size.height * 0.05,
              //                                 width:
              //                                 MediaQuery.of(context).size.width * 1.5,
              //                                 child: ListView.builder(
              //                                   itemCount: 1,
              //                                   scrollDirection: Axis.vertical,
              //                                   itemBuilder: (context, index) {
              //                                     return Container(
              //                                       margin: EdgeInsets.symmetric(
              //                                           horizontal: size.width * 0.05),
              //                                       height: size.height * 0.05,
              //                                       width:
              //                                       MediaQuery.of(context).size.width *
              //                                           1.5,
              //                                       // Increased width
              //                                       child: Row(
              //                                         children: [
              //                                           Expanded(
              //                                             child: Container(
              //                                               width: size.width * 0.15,
              //                                               alignment: Alignment.center,
              //                                               decoration: BoxDecoration(
              //                                                 border: Border.all(
              //                                                     color: Colors.deepPurple),
              //                                               ),
              //                                               child: Text(
              //                                                 "",
              //                                                 style: TextStyle(
              //                                                   color: Colors.black,
              //                                                 ),
              //                                               ),
              //                                             ),
              //                                           ),
              //                                           Expanded(
              //                                             child: Container(
              //                                               width: size.width * 0.15,
              //                                               alignment: Alignment.center,
              //                                               decoration: BoxDecoration(
              //                                                 border: Border.all(
              //                                                     color: Colors.deepPurple),
              //                                               ),
              //                                               child: Text(
              //                                                 "",
              //                                                 style: TextStyle(
              //                                                   color: Colors.black,
              //                                                 ),
              //                                               ),
              //                                             ),
              //                                           ),
              //                                           Expanded(
              //                                             child: Container(
              //                                               width: size.width * 0.15,
              //                                               alignment: Alignment.center,
              //                                               decoration: BoxDecoration(
              //                                                 border: Border.all(
              //                                                     color: Colors.deepPurple),
              //                                               ),
              //                                               child: Text(
              //                                                 "",
              //                                                 style: TextStyle(
              //                                                   color: Colors.black,
              //                                                 ),
              //                                               ),
              //                                             ),
              //                                           ),
              //                                           Expanded(
              //                                             child: Container(
              //                                               width: size.width * 0.15,
              //                                               alignment: Alignment.center,
              //                                               decoration: BoxDecoration(
              //                                                 border: Border.all(
              //                                                     color: Colors.deepPurple),
              //                                               ),
              //                                               child: Text(
              //                                                 "",
              //                                                 style: TextStyle(
              //                                                   color: Colors.black,
              //                                                 ),
              //                                               ),
              //                                             ),
              //                                           ),
              //                                           Expanded(
              //                                             child: Container(
              //                                               width: size.width * 0.15,
              //                                               alignment: Alignment.center,
              //                                               decoration: BoxDecoration(
              //                                                 border: Border.all(
              //                                                     color: Colors.deepPurple),
              //                                               ),
              //                                               child: Text(
              //                                                 "",
              //                                                 style: TextStyle(
              //                                                   color: Colors.black,
              //                                                 ),
              //                                               ),
              //                                             ),
              //                                           ),
              //                                         ],
              //                                       ),
              //                                     );
              //                                   },
              //                                 ),
              //                               ),
              //                             );
              //                           },
              //                         ),
              //                       ),
              //                       Container(
              //                         height: size.height * 0.05,
              //                         width: MediaQuery.of(context).size.width /
              //                             0.8, // Increased width
              //                         child: Row(
              //                           children: [
              //                             Expanded(
              //                               flex: 4,
              //                               child: Container(
              //                                 alignment: Alignment.center,
              //                                 decoration: BoxDecoration(
              //                                   border:
              //                                   Border.all(color: Colors.deepPurple),
              //                                 ),
              //                                 child: Text(
              //                                   " Total",
              //                                   style: TextStyle(
              //                                     color: Colors.deepPurple,
              //                                     fontWeight: FontWeight.bold,
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                             Expanded(
              //                               flex: 1,
              //                               child: Container(
              //                                 alignment: Alignment.center,
              //                                 decoration: BoxDecoration(
              //                                   border:
              //                                   Border.all(color: Colors.deepPurple),
              //                                 ),
              //                                 child: Text(
              //                                   "100",
              //                                   style: TextStyle(
              //                                     color: Colors.deepPurple,
              //                                     fontWeight: FontWeight.bold,
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ],
              //                   );
              //                 },
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: size.height * 0.01,
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.end,
              //           children: [
              //             Text('Balance '),
              //             SizedBox(
              //               width: size.width * 0.02,
              //             ),
              //             Container(
              //               width: MediaQuery.of(context).size.width * 0.2,
              //               height:  size.height * 0.08,
              //               margin: EdgeInsets.only(top: size.height * 0.02),
              //               child: Align(
              //                 alignment: Alignment.topCenter,
              //                 child: ElevatedButton(
              //                   onPressed: () {},
              //                   style: ElevatedButton.styleFrom(
              //                     primary: pickerPrimaryColor,
              //                     shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(5),
              //                     ),
              //                     elevation: 15.0,
              //                   ),
              //                   child: Text(
              //                     '200',
              //                     style: TextStyle(fontSize: 14,color: Colors.white),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //             SizedBox(
              //               width: size.width * 0.05,
              //             ),
              //           ],
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              body: Center(child: Text("No Data!")),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Assets/Images/bg.png'),
                      fit: BoxFit.fill),
                ),
                child: BottomDrawer(),
              ),
            );
          }
        },
      ),
    );
  }
}
