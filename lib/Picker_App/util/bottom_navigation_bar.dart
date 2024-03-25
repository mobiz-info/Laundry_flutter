import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/Complaint.dart';
import '../screens/homepage.dart';
import '../screens/navigation.dart';
import '../src/colors.dart';

class BottomDrawer extends StatelessWidget {
  const BottomDrawer({super.key});

  // Push the page and remove everything else
  navigateToPage(BuildContext context, String page) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(page, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      child: Row(
        children: [
        IconButton(
        enableFeedback: false,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder:
                  (context) =>  HomePage(),
              ));
        },
        icon: const Icon(
          Icons.home_filled,
          color: Colors.white,
          size: 30,
        ),
          ),
          Spacer(),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder:
                      (context) =>  NavigationScreen(),
                  ));
            },
            icon: const Icon(
              Icons.location_on_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
          Spacer(),
          IconButton(
            enableFeedback: false,
            onPressed: () {

              Navigator.push(context,
                  MaterialPageRoute(builder:
                      (context) =>  ComplaintScreen(),
                  ));
            },
            icon: const Icon(
              Icons.settings_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
          Spacer(),
          Flexible(child:   Text('14 Days More',style: TextStyle(color: pickerPrimaryColor,fontSize: 19,fontWeight: FontWeight.w600),)
          )
        ],
      ),
      );
  }

}
