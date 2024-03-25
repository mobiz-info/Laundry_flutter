import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/PickerBloc/picker_bloc.dart';
import 'package:golden_falcon/Owners/Dashboard/Navigation.dart';
import 'package:golden_falcon/Owners/Pages/Add_clients.dart';
import 'package:golden_falcon/Picker_App/screens/add_client.dart';
import 'package:golden_falcon/Picker_App/screens/deposit.dart';
import 'package:golden_falcon/Picker_App/screens/my_client.dart';
import 'package:golden_falcon/Picker_App/screens/my_order_list.dart';
import 'package:golden_falcon/Repositories/PickerRepo/picker_repo.dart';
import 'package:golden_falcon/Utils/row_shimmer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../src/colors.dart';
import '../src/dimen.dart';
import '../src/textString.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/drawer.dart';
import '../model/chart_data.dart';
import '../util/open_painter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool isCardView = false;
  TooltipBehavior? _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
        enable: true,
        canShowMarker: false,
        header: '',
        format: 'point.y marks in point.x');
    super.initState();
  }

  /// Get column series with tracker
  List<ColumnSeries<ChartSampleData, String>> _getTracker() {
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
          dataSource: <ChartSampleData>[
            ChartSampleData('Dry Clean', 71),
            ChartSampleData('Wash & Fold', 84),
            ChartSampleData('Press & Hang', 48),
            ChartSampleData('Carpet', 80),
          ],

          /// We can enable the track for column here.
          isTrackVisible: true,
          trackPadding: 1.5,
          spacing: 1.5,
          yAxisName: 'Count',
          borderWidth: 25,
          color: pickerPrimaryColor,
          trackColor: const Color.fromRGBO(198, 201, 207, 1),
          borderRadius: BorderRadius.circular(15),
          xValueMapper: (ChartSampleData sales, _) => sales.mode as String,
          yValueMapper: (ChartSampleData sales, _) => sales.count,
          name: 'Activity Log',
          dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              labelAlignment: ChartDataLabelAlignment.top,
              textStyle: TextStyle(fontSize: 10, color: Colors.white)))
    ];
  }

  @override
  Widget build(BuildContext context) {
    authData.callCount = 1;
    final scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
        child: Appbar(
          text: 'Welcome Back ${authData.username!.toUpperCase()}',
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/Images/bg.png'), fit: BoxFit.fill),
        ),
        child: BottomDrawer(),
      ),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(
                        color: pickerPrimaryColor,
                      ))),
              child: Center(
                child: Text(
                  'Field Staff Dashboard',
                  style: TextStyle(
                    fontSize: 20,
                    color: pickerPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        child: Text(
                          "New Order",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyOrderScreen()), (route) => false),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: pickerPrimaryColor,
                            fixedSize: Size.fromWidth(130)),
                      ),
                      ElevatedButton(
                        child: Text(
                          "Dispatch",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: pickerPrimaryColor,
                            fixedSize: Size.fromWidth(130)),
                      ),
                      ElevatedButton(
                        child: Text(
                          "Payment",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: pickerPrimaryColor,
                            fixedSize: Size.fromWidth(130)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        child: Text(
                          "Create Client",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => AddClientScreen(fromHome: true)), (route) => false),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: pickerPrimaryColor,
                            fixedSize: Size.fromWidth(130)),
                      ),
                      ElevatedButton(
                        child: Text(
                          "Add Complaint",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: pickerPrimaryColor,
                            fixedSize: Size.fromWidth(130)),
                      ),
                      ElevatedButton(
                        child: Text(
                          "Un Delivered",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: pickerPrimaryColor,
                            fixedSize: Size.fromWidth(130)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * .02),
            //   Counts
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: BlocProvider(
                create: (context) => PickerBloc(
                  RepositoryProvider.of<PickerRepository>(context),
                )..add(GetDashboardCountEvent(authData.user_token.toString(),
                    authData.user_id.toString())),
                child: BlocBuilder<PickerBloc, PickerState>(
                  // buildWhen: (previous, current) {
                  //   return authData.callCount == 1;
                  // },
                  builder: (context, state) {
                    if (state is DashboardCountGettingState) {
                      print(state.toString());
                      return Column(
                        children: [
                          ShimmerRow(),
                          ShimmerRow(),
                          ShimmerRow(),
                        ],
                      );
                    } else if (state is DashboardCountGotState) {
                      authData.callCount = 0;
                      print(state.toString());
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyOrderScreen()), (route) => false);
                                },
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      // margin: EdgeInsets.only(right: size.width * 0.03),
                                      child: TweenAnimationBuilder(
                                        duration: const Duration(seconds: 2),
                                        tween: Tween(begin: 0.0, end: 1.0),
                                        curve: Curves.easeOutCubic,
                                        builder: (BuildContext context,
                                            double value, Widget? child) {
                                          return MultipleColorCircle(
                                            colorOccurrences: {
                                              pickerGreenColor: 3,
                                              pickerCiyan2Color: 1
                                            },
                                            height: size.height * 0.035,
                                            child: Text(
                                              state.dashData.pickupPendingCount.toString(),
                                              style: TextStyle(
                                                  fontSize: circleText,
                                                  fontWeight: circleTextWeight),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: size.height * 0.03,
                                      margin: EdgeInsets.only(
                                          top: size.height * 0.03),
                                      child: Text(
                                        circleHeadText1,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: circleBottomText),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder:
                                  //         (context) =>  DepositScreen(),
                                  //     ));
                                },
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      //  margin: EdgeInsets.only(left: size.width * 0.06,right: size.width * 0.06),
                                      child: TweenAnimationBuilder(
                                        duration: const Duration(seconds: 2),
                                        tween: Tween(begin: 0.0, end: 1.0),
                                        curve: Curves.easeOutCubic,
                                        builder: (BuildContext context,
                                            double value, Widget? child) {
                                          return MultipleColorCircle(
                                            colorOccurrences: {
                                              pickerDarkRedColor: 3,
                                              pickerBlue2Color: 1
                                            },
                                            height: size.height * 0.035,
                                            child: Text(
                                              state.dashData.confirmedCount.toString(),
                                              style: TextStyle(
                                                  fontSize: circleText,
                                                  fontWeight: circleTextWeight),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: size.height * 0.03,
                                      margin: EdgeInsets.only(
                                          top: size.height * 0.03),
                                      child: Text(
                                        circleHeadText2,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: circleBottomText),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder:
                                  //         (context) =>  OutStandinDueScreen(),
                                  //     ));
                                },
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      // margin: EdgeInsets.only(left: size.width * 0.06,right: size.width * 0.03),
                                      child: TweenAnimationBuilder(
                                        duration: const Duration(seconds: 2),
                                        tween: Tween(begin: 0.0, end: 1.0),
                                        curve: Curves.easeOutCubic,
                                        builder: (BuildContext context,
                                            double value, Widget? child) {
                                          return MultipleColorCircle(
                                            colorOccurrences: {
                                              pickerDarkPinkColor: 3,
                                              pickerLightPinkColor: 1
                                            },
                                            height: size.height * 0.035,
                                            child: Text(
                                              state.dashData.readyForDispatchCount.toString(),
                                              style: TextStyle(
                                                  fontSize: circleText,
                                                  fontWeight: circleTextWeight),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(
                                          top: size.height * 0.03),
                                      height: size.height * 0.03,
                                      child: Text(
                                        circleHeadText3,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: circleBottomText),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  /*Navigator.push(context,
                            MaterialPageRoute(builder:
                                (context) =>  EditClientScreen(),
                            ));*/
                                },
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      //  margin: EdgeInsets.only(left: size.width * 0.05),
                                      child: TweenAnimationBuilder(
                                        duration: const Duration(seconds: 2),
                                        tween: Tween(begin: 0.0, end: 1.0),
                                        curve: Curves.easeOutCubic,
                                        builder: (BuildContext context,
                                            double value, Widget? child) {
                                          return MultipleColorCircle(
                                            colorOccurrences: {
                                              pickerYellowColor: 3,
                                              pickerLightOrangeColor: 1
                                            },
                                            height: size.height * 0.035,
                                            child: Text(
                                              state.dashData.deliveredCount.toString(),
                                              style: TextStyle(
                                                  fontSize: circleText,
                                                  fontWeight: circleTextWeight),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: size.height * 0.03,
                                      margin: EdgeInsets.only(
                                          top: size.height * 0.03),
                                      child: Text(
                                        circleHeadText4,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: circleBottomText),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder:
                                  //         (context) =>  MyCollectionScreen(),
                                  //     ));
                                },
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      // margin: EdgeInsets.only(right: size.width * 0.03),
                                      child: TweenAnimationBuilder(
                                        duration: const Duration(seconds: 2),
                                        tween: Tween(begin: 0.0, end: 1.0),
                                        curve: Curves.easeOutCubic,
                                        builder: (BuildContext context,
                                            double value, Widget? child) {
                                          return MultipleColorCircle(
                                            colorOccurrences: {
                                              pickerCiyanColor: 3,
                                              pickerCiyan2Color: 1
                                            },
                                            height: size.height * 0.035,
                                            child: Text(
                                              '50',
                                              style: TextStyle(
                                                  fontSize: circleText,
                                                  fontWeight: circleTextWeight),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: size.height * 0.03,
                                      margin: EdgeInsets.only(
                                          top: size.height * 0.03),
                                      child: Text(
                                        circleHeadText5,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: circleBottomText),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder:
                                          (context) =>  DepositScreen(),
                                      ));
                                },
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      //  margin: EdgeInsets.only(left: size.width * 0.06,right: size.width * 0.06),
                                      child: TweenAnimationBuilder(
                                        duration: const Duration(seconds: 2),
                                        tween: Tween(begin: 0.0, end: 1.0),
                                        curve: Curves.easeOutCubic,
                                        builder: (BuildContext context,
                                            double value, Widget? child) {
                                          return MultipleColorCircle(
                                            colorOccurrences: {
                                              pickerBlueColor: 3,
                                              pickerBlue2Color: 1
                                            },
                                            height: size.height * 0.035,
                                            child: Text(
                                              state.dashData.depositAmount.toString(),
                                              style: TextStyle(
                                                  fontSize: circleText,
                                                  fontWeight: circleTextWeight),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: size.height * 0.03,
                                      margin: EdgeInsets.only(
                                          top: size.height * 0.03),
                                      child: Text(
                                        circleHeadText6,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: circleBottomText),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder:
                                  //         (context) =>  OutStandinDueScreen(),
                                  //     ));
                                },
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      // margin: EdgeInsets.only(left: size.width * 0.06,right: size.width * 0.03),
                                      child: TweenAnimationBuilder(
                                        duration: const Duration(seconds: 2),
                                        tween: Tween(begin: 0.0, end: 1.0),
                                        curve: Curves.easeOutCubic,
                                        builder: (BuildContext context,
                                            double value, Widget? child) {
                                          return MultipleColorCircle(
                                            colorOccurrences: {
                                              pickerPurpleColor: 3,
                                              pickerLightPinkColor: 1
                                            },
                                            height: size.height * 0.035,
                                            child: Text(
                                              '0',
                                              style: TextStyle(
                                                  fontSize: circleText,
                                                  fontWeight: circleTextWeight),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(
                                          top: size.height * 0.03),
                                      height: size.height * 0.03,
                                      child: Text(
                                        circleHeadText7,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: circleBottomText),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  /*Navigator.push(context,
                            MaterialPageRoute(builder:
                                (context) =>  EditClientScreen(),
                            ));*/
                                },
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      //  margin: EdgeInsets.only(left: size.width * 0.05),
                                      child: TweenAnimationBuilder(
                                        duration: const Duration(seconds: 2),
                                        tween: Tween(begin: 0.0, end: 1.0),
                                        curve: Curves.easeOutCubic,
                                        builder: (BuildContext context,
                                            double value, Widget? child) {
                                          return MultipleColorCircle(
                                            colorOccurrences: {
                                              pickerDarkRedColor: 3,
                                              pickerLightOrangeColor: 1
                                            },
                                            height: size.height * 0.035,
                                            child: Text(
                                              state.dashData.notProcessedCount.toString(),
                                              style: TextStyle(
                                                  fontSize: circleText,
                                                  fontWeight: circleTextWeight),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: size.height * 0.03,
                                      margin: EdgeInsets.only(
                                          top: size.height * 0.03),
                                      child: Text(
                                        circleHeadText8,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: circleBottomText),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  /* Navigator.push(context,
                            MaterialPageRoute(builder:
                                (context) =>  EditClientScreen(),
                            ));*/
                                },
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      // margin: EdgeInsets.only(left: size.width * 0.09),
                                      child: TweenAnimationBuilder(
                                        duration: const Duration(seconds: 2),
                                        tween: Tween(begin: 0.0, end: 1.0),
                                        curve: Curves.easeOutCubic,
                                        builder: (BuildContext context,
                                            double value, Widget? child) {
                                          return MultipleColorCircle(
                                            colorOccurrences: {
                                              pickerDarkPinkColor: 3,
                                              pickerPinkColor: 1
                                            },
                                            height: size.height * 0.035,
                                            child: Text(
                                              '25',
                                              style: TextStyle(
                                                  fontSize: circleText,
                                                  fontWeight: circleTextWeight),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: size.height * 0.03,
                                      margin: EdgeInsets.only(
                                          top: size.height * 0.03),
                                      child: Text(
                                        circleHeadText9,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: circleBottomText),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      print(state.toString());
                      return Column(
                        children: [
                          ShimmerRow(),
                          ShimmerRow(),
                          ShimmerRow(),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
            // SizedBox(height: size.height *0.02),
            //   Clients
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyClientScreen(),), (route) => false),
              style: ElevatedButton.styleFrom(
                  backgroundColor: pickerPrimaryColor,
                  elevation: 15.0,
                  fixedSize: Size.fromWidth(size.width * 0.75)),
              child: Text(
                dashboardButton2Text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ),
            //   My Orders
            SizedBox(height: size.height * 0.05),
            TextButton(
              child: Text(
                "My Orders",
                style: TextStyle(
                    color: pickerPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: dashboardHeaderText2),
              ),
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyOrderScreen(),), (route) => false),
            ),
            SizedBox(height: size.height * 0.05),
          ],
        ),
      ),
    );

  }
}
