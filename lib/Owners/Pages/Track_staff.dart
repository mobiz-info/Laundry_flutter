import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Track extends StatefulWidget {
  const Track({Key? key}) : super(key: key);

  @override
  State<Track> createState() => _TrackState();
}

class _TrackState extends State<Track> {

  List<StepperData> stepperData = [
    StepperData(
      title: StepperText(
        "09:10",
      ),
    ),
    StepperData(
      title: StepperText("09:55"),
    ),
    StepperData(
      title: StepperText("10:00",)
    ),
    StepperData(
      title: StepperText("",
          textStyle: const TextStyle(
            color: Colors.grey,
          )),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu,),
        iconTheme: IconThemeData(color: Colors.blue,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("TRACK STAFF",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.refresh_outlined,
              color: Colors.blue,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 100,top: 40),
              child: AnotherStepper(
                stepperList: stepperData,
                stepperDirection: Axis.vertical,
                verticalGap: 40,
                iconWidth: 18,
                iconHeight: 19,
                activeBarColor: Colors.blue,
                inActiveBarColor: Colors.grey,
                activeIndex: 2,
                barThickness: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
