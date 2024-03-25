import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Owners/Pages/Complaint.dart';
import 'package:golden_falcon/Owners/Pages/Track_staff.dart';
import 'Owner_dashboard.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    OwnerDashboard(),Track(),Complaint()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(50))),
              child: BottomNavigationBar(
                elevation: 0,

                backgroundColor: Colors.blue,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.location_on),
                    label: 'Track',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings_suggest_outlined),
                    label: 'Complaint',
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.white,
                unselectedItemColor: CupertinoColors.white,
                onTap: _onItemTapped,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 20,
              height: 70,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(),color: Colors.white),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('14 Days',style: TextStyle(color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                  ),),
                  Text('More',style: TextStyle(color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                  ),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
