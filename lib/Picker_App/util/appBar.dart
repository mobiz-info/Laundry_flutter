
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/activity_monitor.dart';
import '../screens/notifications.dart';
import '../src/colors.dart';
import '../src/dimen.dart';
import 'custom_shape.dart';

class Appbar extends StatelessWidget{
  final String text;
  Function? pressed;
  Appbar({ Key? key,required this.text, this.pressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    void handleClick(String value) {
      switch (value) {
        case 'Activity Monitor':
          Navigator.push(context,
              MaterialPageRoute(builder:
                  (context) =>  Activity(),
              ));
          break;
        case 'Notification':
          Navigator.push(context,
              MaterialPageRoute(builder:
                  (context) =>  NotificationScreen(),
              ));
          break;
      }
    }
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: true,
      title: SizedBox(
        height: 250,
        width: 200,
        child: Image.network('http://68.183.94.11:772/static/images/golden.jpeg', fit: BoxFit.scaleDown,),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.refresh,color: Colors.white,)),
        PopupMenuButton<String>(
          color: Colors.white,
          onSelected: handleClick,
          itemBuilder: (BuildContext context) {
            return {'Notification', 'Activity Monitor'}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ],
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
      ),
      flexibleSpace: ClipPath(
        clipper: CustomShape(),
        child: Container(
            alignment: Alignment.topCenter,
            width: size.width,
            color: pickerPrimaryColor,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.16),
                Text(
                  text,
                  style: TextStyle(
                      color: Colors.white, fontSize: welcomeTextSize),
                ),
              ],
            )),
      ),

    );

  }

}