import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Customers/Customer_Home.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/src/Color.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Customers/choose_account_type.dart';
import 'Customers/forget_password.dart';
import 'components/common_methods.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthRepository authRepository = AuthRepository();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passwordVisible = true;
  String? deviceToken;

  Future<String?> handleAsync() async {
    String? token = await FirebaseMessaging.instance.getToken();
    debugPrint('Firebase Messaging token: $token');
    return token;
  }

  @override
  void initState() {
    super.initState();
    handleAsync().then((token) {
      setState(() {
        deviceToken = token;
      });
    });
  }

  void closeAppUsingExit() {
    exit(0);
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        elevation: 0,
        actionsAlignment: MainAxisAlignment.center,
        title: const Padding(
          padding: EdgeInsets.only(top: 18),
          child: Text('Exit App', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: textgrey, fontWeight: FontWeight.w600)),
        ),
        content: const Text('Do you really want to exit?', textAlign: TextAlign.center,  style: TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w400)),
        actions:[
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  height: 42, width: 120,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, surfaceTintColor: Colors.white, elevation: 0,
                      side: const BorderSide(width: 1.6, color: primaryColor),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    ),
                    child: const Text('Cancel', style: TextStyle(fontSize: 14, color: textgrey)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 42, width: 120,
                  child: ElevatedButton(
                    onPressed: () {
                      closeAppUsingExit();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor, surfaceTintColor: Colors.white, elevation: 0,
                      side: const BorderSide(width: 1.6, color: primaryColor),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    ),
                    child: const Text('Yes', style: TextStyle(fontSize: 14, color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
        ],
      ),
    )??false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Sign In", style: TextStyle(color: textgrey, fontWeight: FontWeight.w500, fontSize: 36)),
          const SizedBox(height: 32),
          SizedBox(
            height: 64,
            child: TextFormField(
              controller: usernameController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'User Name',
                labelStyle: const TextStyle(color: textgrey, fontSize: 12, fontWeight: FontWeight.w500),
                prefixIcon: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.account_circle_rounded, color: primaryColor)
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17.0),
                  borderSide: const BorderSide(color: primaryColor, width: 1.4),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17.0),
                  borderSide: const BorderSide(color: primaryColor, width: 1.4),
                ),
              ),
              style: const TextStyle(color: textgrey, fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 26),
          SizedBox(
            height: 64,
            child: TextFormField(
              controller: passwordController,
              obscureText: passwordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(color: textgrey, fontSize: 12, fontWeight: FontWeight.w500),
                prefixIcon: IconButton(
                    icon: Icon(
                      passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: primaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    }),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17.0),
                  borderSide: const BorderSide(color: primaryColor, width: 1.4),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17.0),
                  borderSide: const BorderSide(color: primaryColor, width: 1.4),
                ),
              ),
              style: const TextStyle(color: textgrey, fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 38),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: () async {
                if (usernameController.text.isEmpty) {
                  snackBar(context, message: 'Please enter phone number');
                }
                if (usernameController.text.length != 10) {
                  snackBar(context, message: 'Please enter valid phone number');
                }
                else if (passwordController.text.isEmpty) {
                  snackBar(context, message: 'Please enter password');
                }
                else {
                  showLoaderDialog(context);
                  var response = await authRepository.loginUser(username: usernameController.text, password: passwordController.text, deviceToken: deviceToken!);
                  Navigator.pop(context);
                  if(response.status == true) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => CustomerHomeScreen()),
                    );
                  }
                  else {
                    snackBar(context, message: response.message.toString());
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor, elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Login', style: TextStyle(fontSize: 16, color: White, fontWeight: FontWeight.w600)),
            ),
          ),
          const SizedBox(height: 32),
          InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgetPassword())),
              child: const Text('Forget Password ?', style: TextStyle(color: textgrey, fontWeight: FontWeight.w600, fontSize: 12))),
          const SizedBox(height: 22),
          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ChooseAccountType())),
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?", style: TextStyle(color: textgray, fontSize: 12)),
                  SizedBox(width: 4),
                  Text("Register Now", style: TextStyle(fontWeight: FontWeight.w600, color: textgrey, fontSize: 12))
                ]),
          ),
          const SizedBox(height: 62),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Powered by", style: TextStyle(color: textgray, fontSize: 14)),
                const SizedBox(width: 4),
                GestureDetector(
                    onTap: () {
                      launchURLApp();
                    },
                    child: const Text('Mobiz', style: TextStyle(fontSize: 14.0, color: textgrey,
                        fontWeight: FontWeight.w600, decoration: TextDecoration.underline)))
              ]),
        ],
      ),
      ),
    );
  }

  launchURLApp() async {
    var url = Uri.parse("https://www.mobiztechnologies.com/");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}


