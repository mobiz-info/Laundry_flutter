import 'dart:ffi';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/AuthBloc/auth_bloc.dart';
import 'package:golden_falcon/Owners/Dashboard/Navigation.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/push_notification.dart';
import 'package:golden_falcon/src/Color.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Customers/Customer_Home.dart';
import 'Customers/choose_account_type.dart';
import 'Customers/forget_password.dart';
import 'Owners/Dashboard/Owner_dashboard.dart';
import 'Picker_App/screens/homepage.dart';
import 'Repositories/CustomerRepo/customer_repository.dart';
import 'Service_Branch/service_dashboad.dart';
import 'Service_Staff/Service_staff_dashboard_75.dart';
import 'components/common_methods.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthRepository authRepository = AuthRepository();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';
  bool passwordVisible = true;
  String? deviceToken;

  Future<String?> handleAsync() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print('Firebase Messaging token: $token');
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
        content: const SizedBox(
            height: 50,
            child: Center(
              child: Padding(padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Text('Do you Really Want to', textAlign: TextAlign.center,  style: TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w400)),
                    Text('Close the App ?', textAlign: TextAlign.center,  style: TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w400))
                  ],
                ),
              ),
            )),
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
                    onPressed: () async {
                      authData.user_id = null ;
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage(),),(route) => false);
                      //Navigator.of(context).pop(true);
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

  // Future<bool> showExitPopup() async {
  //   return await showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           actionsAlignment: MainAxisAlignment.center,
  //           title: Center(
  //               child: Text(
  //             'Exit App !',
  //             style: TextStyle(color: Colors.pinkAccent[400]),
  //           )),
  //           content: SizedBox(
  //               height: 50,
  //               child: Center(
  //                 child: Padding(
  //                   padding: const EdgeInsets.only(top: 10),
  //                   child: Column(
  //                     children: [
  //                       const Text('Do you Really Want to'),
  //                       const Text('Close the App ?')
  //                     ],
  //                   ),
  //                 ),
  //               )),
  //           actions: [
  //             Padding(
  //               padding: const EdgeInsets.all(10),
  //               child: ElevatedButton(
  //                 onPressed: () => Navigator.of(context).pop(false),
  //                 child: Text(
  //                   'No',
  //                   style: TextStyle(color: Colors.green[700]),
  //                 ),
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(10),
  //               child: ElevatedButton(
  //                 onPressed: () => Navigator.of(context).pop(true),
  //                 child: Text(
  //                   'Yes',
  //                   style: TextStyle(color: Colors.pinkAccent[400]),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ) ??
  //       false;
  // }

  void _login() {
    print("Enter");
    String username = _usernameController.text;
    String password = _passwordController.text;

    BlocProvider.of<AuthBloc>(context).add(UserLoginEvent(username, password, deviceToken!));
    // if (username.isEmpty) {
    //   snackBar(context, message: 'Please enter User Name');
    // }
    // else if (password.isEmpty) {
    //   snackBar(context, message: 'Please enter Password');
    // }
    // else {
    //   _errorMessage = 'Invalid username or password';
    // }
    // if (username == '111' && password == '111') {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => CustomerHomeScreen()),
    //   );
    // } else if (username == '222' && password == '222') {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => StaffServiceDashboard()),
    //   );
    // } else if (username == '333' && password == '333') {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => Navigation()),
    //   );
    // } else if (username == '444' && password == '444') {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => MyHomePage()),
    //   );
    // } else {
    //   setState(() {
    //     _errorMessage = 'Invalid username or password';
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) =>
          AuthBloc(RepositoryProvider.of<AuthRepository>(context)),
      child: Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              switch (state.usertype) {
                case "Customer":
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomerHomeScreen()),
                  );
                  break;

                case "Branch":
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ServiceDashboard()),
                  );
                  break;

                case "Staff":
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StaffServiceDashboard()),
                  );
                  break;

                case "Picker":
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>  HomePage()),
                  );
                  break;

                case "Admin":
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Navigation()),
                  );
                  break;
              }
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is LoginInitialState) {
                return Container(
                  //color: BgGrey,
                  // decoration: BoxDecoration(
                  //   gradient: LinearGradient(
                  //     begin: Alignment.topCenter,
                  //     end: Alignment.bottomCenter,
                  //     colors: [
                  //       Color(0xFF48a3c2),
                  //       Color(0xFF1A344F),
                  //     ],
                  //   ),
                  // ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sign In",
                            style: TextStyle(
                                color: textgrey,
                                fontWeight: FontWeight.w500,
                                fontSize: 36)),
                        SizedBox(
                          height: 32,
                        ),
                        SizedBox(
                          height: 64,
                          child: TextFormField(
                            controller: _usernameController,
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
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                    width: 2.0,
                                  ),
                                ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17.0),
                                borderSide: BorderSide(
                                  color: primaryColor,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            style: TextStyle(color: textgrey, fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: 26.0),
                        SizedBox(
                          height: 64,
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: textgrey, fontSize: 12, fontWeight: FontWeight.w500),
                              // prefixIcon: Padding(
                              //   padding: const EdgeInsets.all(10.0),
                              //   child: Image.asset(
                              //     'Assets/Images/password_icon.png',
                              //   ),
                              // ),
                              prefixIcon: IconButton(
                                icon: Icon(
                                  passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: primaryColor,
                                ), onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17.0),
                                borderSide: BorderSide(
                                  color: primaryColor,
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17.0),
                                borderSide: BorderSide(
                                  color: primaryColor,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            style: TextStyle(color: textgrey, fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          _errorMessage,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 24.0),
                        // ElevatedButton(
                        //   onPressed: () {},
                        //   child: Row(
                        //     children: [
                        //       Text(
                        //         'Signing In',
                        //         style: TextStyle(fontSize: 18.0),
                        //       ),
                        //       CircularProgressIndicator()
                        //     ],
                        //   ),
                        //   style: ElevatedButton.styleFrom(
                        //     primary: Colors.white,
                        //     onPrimary: Color(0xFF2B4C6F),
                        //     padding: EdgeInsets.symmetric(horizontal: 64.0),
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(32.0),
                        //     ),
                        //   ),
                        // ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: CircularProgressIndicator(
                            color: Colors.greenAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              // else if (state is LoginErrorState) {
              //   snackBar(context, message: state.message.toString());
              //   return Container(color: BgGrey, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
              // }
              else {
                print(state.toString());
                return Container(
                  //color: BgGrey,
                  // decoration: BoxDecoration(
                  //   gradient: LinearGradient(
                  //     begin: Alignment.topCenter,
                  //     end: Alignment.bottomCenter,
                  //     colors: [
                  //       Color(0xFF48a3c2),
                  //       Color(0xFF1A344F),
                  //     ],
                  //   ),
                  // ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sign In",
                            style: TextStyle(
                                color: textgrey,
                                fontWeight: FontWeight.w500,
                                fontSize: 36)),
                        SizedBox(
                          height: 32,
                        ),
                        SizedBox(
                          height: 64,
                          child: TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'User Name',
                              labelStyle: const TextStyle(color: textgrey, fontSize: 12, fontWeight: FontWeight.w500),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(Icons.account_circle_rounded, color: primaryColor)
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17.0),
                                borderSide: BorderSide.none,
                              ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(17.0),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                    width: 1.4,
                                  ),
                                ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17.0),
                                borderSide: const BorderSide(
                                  color: primaryColor,
                                  width: 1.4,
                                ),
                              ),
                            ),
                            style: const TextStyle(color: textgrey, fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(height: 26.0),
                        SizedBox(
                          height: 64,
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: const TextStyle(color: textgrey, fontSize: 12, fontWeight: FontWeight.w500),
                              // prefixIcon: Padding(
                              //   padding: const EdgeInsets.all(10.0),
                              //   child: Image.asset(
                              //     'Assets/Images/password_icon.png',
                              //   ),
                              // ),
                              prefixIcon: IconButton(
                                  icon: Icon(
                                    passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: primaryColor,
                                  ), onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17.0),
                                borderSide: const BorderSide(
                                  color: primaryColor,
                                  width: 1.4,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17.0),
                                borderSide: BorderSide(
                                  color: primaryColor,
                                  width: 1.4,
                                ),
                              ),
                            ),
                            style: TextStyle(color: textgrey, fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          _errorMessage,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(height: 2.0),
                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_usernameController.text.isEmpty) {
                                snackBar(context, message: 'Please enter User Name');
                              }
                              else if (_passwordController.text.isEmpty) {
                                snackBar(context, message: 'Please enter Password');
                              }
                              else {
                                BlocProvider.of<AuthBloc>(context).add(UserLoginEvent(_usernameController.text, _passwordController.text, deviceToken!));
                              }
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(fontSize: 16, color: White, fontWeight: FontWeight.w600),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor, elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ForgetPassword()),
                          ),
                            child: const Text('Forget Password ?', style: TextStyle(color: textgrey, fontWeight: FontWeight.w600, fontSize: 12))),
                        const SizedBox(height: 22),
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ChooseAccountType()),
                          ),
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
            },
          ),
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
