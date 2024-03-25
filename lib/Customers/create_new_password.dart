import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Loginscreen.dart';

import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Utils/ScreenAppbar.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';

class CreateNewPassword extends StatefulWidget {
  String mobileNumber = '';
  CreateNewPassword({Key? key, required this.mobileNumber}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BgGrey,
        appBar: ScreenAppbar(text: "Create New Password", imagepath: "Assets/Images/new_password.png"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("New Password must be different from previous used password",
                    style: TextStyle(color: textgrey, fontSize: 12)),
                const SizedBox(height: 32),
                const Text("New Password", style: TextStyle(color: textgrey, fontWeight: FontWeight.w500, fontSize: 14)),
                const SizedBox(height: 8),
                SizedBox(
                  height: 58,
                  child: TextFormField(
                    controller: newPasswordController,
                    //obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                    style: const TextStyle(color: textgrey, fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 16),
                const Text("Confirm Password", style: TextStyle(color: textgrey, fontWeight: FontWeight.w500, fontSize: 14)),
                const SizedBox(height: 8),
                SizedBox(
                  height: 58,
                  child: TextFormField(
                    controller: confirmPasswordController,
                    //obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: textgrey, fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      if (newPasswordController.text.isEmpty) {
                        snackBar(context, message: 'Please enter new password');
                      } else if (confirmPasswordController.text.isEmpty) {
                        snackBar(context, message: 'Please enter confirm password');
                      }
                      else {
                        BlocProvider.of<CustomerBloc>(context).add(GetResetPasswordEvent(widget.mobileNumber, newPasswordController.text, confirmPasswordController.text));
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: const Text('RESET PASSWORD', style: TextStyle(fontSize: 16.0, color: White, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}