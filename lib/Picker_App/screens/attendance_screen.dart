
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../src/colors.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/drawer.dart';

class AttendanceScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => AttendanceScreenState();

}
class AttendanceScreenState extends State<AttendanceScreen>
{
  bool isCheckedIn = true;
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
        child: Appbar(text: 'Attendance'),
      ),
      drawer: const MenuDrawer(),
      body: Container(
        width: size.width,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: size.height * 0.08,
              margin: EdgeInsets.only(top: size.height * 0.02),
              child: Align(
                alignment: Alignment.topCenter,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isCheckedIn = !isCheckedIn;
                    });
                    BlocProvider.of<PickerBloc>(context)
                        .add(PickerPunchInOutEvent(
                      authData.user_token.toString(),
                      authData.user_id.toString(),
                      isCheckedIn ? 'punch_out' : 'punch_in',
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: pickerPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 15.0,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      !isCheckedIn ? 'Punch Out' : 'Punch In',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<PickerBloc, PickerState>(
              builder: (context, state) {
                if (state is PickerPunchedInOutState) {
                  print(state.toString());
                  return Container(
                    width: size.width / 2,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: pickerPrimaryColor, width: 1.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                if (!isCheckedIn)
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        color: pickerGreenColor,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                Text("Punch-In Time:")
                              ],
                            ),
                            Text(
                              state.punchIn_time,
                              style: TextStyle(
                                color: pickerGreenColor,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                if(isCheckedIn)
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        color: pickerRedColor,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                Text("Punch-Out Time:"),
                              ],
                            ),
                            Text(
                              state.punchOut_time,
                              style: TextStyle(color: pickerRedColor),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  print(state.toString());
                  return Container();
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
    );
  }

}