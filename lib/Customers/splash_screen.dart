import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_falcon/Customers/Customer_Home.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Loginscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    navigateToLogin();
  }

  // void navigateToLogin() async {
  //   SharedPreferences a = await  SharedPreferences.getInstance();
  //   authData.user_id = int.parse(a.getString('userId').toString());
  //   authData.user_token =   a.getString('userToken');
  //   Future.delayed(const Duration(seconds: 3), () {
  //     //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  //     if(authData.user_id != null){
  //       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CustomerHomeScreen(),
  //       ));
  //     }
  //     else{
  //       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage(),
  //       ));
  //     }
  //   });
  // }

  void navigateToLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userIdString = prefs.getString('userId');
    String? userToken = prefs.getString('userToken');

    if (userIdString != null && userToken != null) {
      // If both userId and userToken are not null, proceed with navigation
      int userId = int.tryParse(userIdString) ?? -1; // Provide a default value if parsing fails
      authData.user_id = userId;
      authData.user_token = userToken;

      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => CustomerHomeScreen()),
        );
      });
    } else {
      // If userId or userToken is null, navigate to LoginPage
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Opacity(
              opacity: 0.2,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('Assets/Images/splash_bg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(child: Image.asset('Assets/Images/golden_falcon_logo_splash.png')),
          ],
        ),
      ),
    );
  }
}

