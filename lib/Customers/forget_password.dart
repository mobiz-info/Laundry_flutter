import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_falcon/Customers/otp.dart';

import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';
import 'create_new_password.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('Assets/Images/forgot_password_img.svg'),
                const SizedBox(height: 32),
                const Text("Forget Password ?", style: TextStyle(color: textgrey, fontWeight: FontWeight.w500, fontSize: 24)),
                const SizedBox(height: 18),
                const Text("Please enter your Phone number to receive a verification code",
                    textAlign: TextAlign.center, style: TextStyle(color: textgrey, fontSize: 12)),
                const SizedBox(height: 48),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text("Phone number", style: TextStyle(color: textgrey, fontWeight: FontWeight.w500, fontSize: 14)),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 58,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: phoneController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: emailBoxColor.withOpacity(0.6),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: textgrey, fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      if (phoneController.text.isEmpty) {
                        snackBar(context, message: 'Please enter phone number');
                      }
                      else {
                        BlocProvider.of<CustomerBloc>(context).add(GetForgotPasswordEvent(phoneController.text));
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Otp(mobileNumber: phoneController.text)));
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewPassword(mobileNumber: phoneController.text)));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    child: const Text('SEND',
                      style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}