import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Loginscreen.dart';
import 'package:golden_falcon/Utils/common.dart';

import '../src/colors.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  // Push the page and remove everything else
  navigateToPage(BuildContext context, String page) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(page, (Route<dynamic> route) => false);
  }

  Widget divider() {
    return Divider(
      indent: 20,
      endIndent: 20,
      height: 0.2,
      thickness: 0.2,
      color: Colors.grey,
    );
  }

  Widget listItem(BuildContext context, String text, IconData icon) {
    return ListTile(
      leading: Icon(icon), //Image.asset('assets/images/home.png'),
      title: Text(text),
      onTap: () => navigateToPage(context, text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  //padding: const EdgeInsets.symmetric(horizontal: 90),
                  decoration: const BoxDecoration(
                    color: pickerPrimaryColor,
                  ),
                  height: MediaQuery.of(context).size.height * 0.2,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 1,
                  child: const Text(
                    'Welcome',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                listItem(context, 'Home', Icons.home_outlined),
                divider(),
                listItem(context, 'Attendance', Icons.supervised_user_circle_outlined),
                divider(),
                listItem(context, 'Deposit', Icons.attach_money),
                divider(),
                listItem(context, 'Expense', Icons.cached_sharp),
                divider(),
                listItem(context, 'My Collection', Icons.collections_bookmark_outlined),
                divider(),
               // listItem(context, 'Dispatch Home', Icons.delivery_dining_outlined),
              //  divider(),
                listItem(context, 'OutStanding Dues', Icons.money),
                divider(),
                ExpansionTile(
                  title: Text("History"),
                  leading: Icon(Icons.history),
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.history_toggle_off), //Image.asset('assets/images/home.png'),
                      title: Text('Deposit History'),
                      onTap: () => navigateToPage(context, "Deposit History"),
                    ),
                    ListTile(
                      leading: Icon(Icons.menu_book), //Image.asset('assets/images/home.png'),
                      title: Text('Order History'),
                      onTap: () => navigateToPage(context, "Order History"),

                    ),
                  ],
                ),
                divider(),
                ExpansionTile(
                  title: Text("Report"),
                  leading: Icon(Icons.report_gmailerrorred),
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.auto_graph_sharp), //Image.asset('assets/images/home.png'),
                      title: Text('Order Statistics'),
                      onTap: () => navigateToPage(context, "Order Statistics"),
                    ),
                    ListTile(
                      leading: Icon(Icons.category_outlined), //Image.asset('assets/images/home.png'),
                      title: Text('Category Wise report'),
                      onTap: () => navigateToPage(context, "Category Wise report"),

                    ),
                    ListTile(
                      leading: Icon(Icons.label_important_outline), //Image.asset('assets/images/home.png'),
                      title: Text('Item Wise report'),
                      onTap: () => navigateToPage(context, "Item Wise report"),

                    ),
                  ],
                ),
                divider(),
                // listItem(context, 'Logout', Icons.logout_rounded),
                ListTile(
                  leading: Icon(Icons.logout_rounded), //Image.asset('assets/images/home.png'),
                  title: Text('Logout'),
                  onTap: () {
                    final authData = AuthData();
                    authData.logout();
                    if (authData.response ==  "Logged out Successfully!") {
                      authData.clearResponse();
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
                    }
                  },

                ),
              ],
            ),
          ),
        ));

  }
}
