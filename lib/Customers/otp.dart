import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_falcon/Customers/create_new_password.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';

class Otp extends StatefulWidget {
  String mobileNumber = '';
  Otp({Key? key, required this.mobileNumber}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SvgPicture.asset('Assets/Images/otp_img.svg'),
                  const SizedBox(height: 32),
                  const Text("Verify OTP",
                      style: TextStyle(
                          color: textgrey,
                          fontWeight: FontWeight.w500,
                          fontSize: 30)),
                  const SizedBox(height: 28),
                  const Text("Please enter 4 digit code send to your Phone number",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: textgrey,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                  const SizedBox(height: 28),
                  AppOtpTextField(controller: otpController),
                  const SizedBox(height: 18),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("If you don't receive the code?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                              color: textgrey)),
                      SizedBox(width: 4),
                      Text("Resend",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: textgrey,fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        if (otpController.text.isEmpty) {
                          snackBar(context, message: 'Please enter otp');
                        }
                        else {
                          BlocProvider.of<CustomerBloc>(context).add(GetOtpEvent(widget.mobileNumber, otpController.text));
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewPassword(mobileNumber: widget.mobileNumber)));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17.0),
                        ),
                      ),
                      child: const Text(
                        'VERIFY',
                        style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      )
  );
  }
}

class AppOtpTextField extends StatelessWidget {
  final TextEditingController? controller;

  const AppOtpTextField({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
          controller: controller,
          appContext: context,
          obscureText: true,
          obscuringCharacter: '*',
          blinkWhenObscuring: true,
          pastedTextStyle: const TextStyle(color: Colors.black),
          length: 4,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
              borderRadius: BorderRadius.circular(12),
              shape: PinCodeFieldShape.box,
              fieldHeight: 50,
              fieldWidth: 50,
              borderWidth: 1,
              selectedColor: primaryColor,
              inactiveColor: Colors.transparent,
              activeFillColor: Colors.white,
              inactiveFillColor: emailBoxColor.withOpacity(0.6),
              selectedFillColor: emailBoxColor.withOpacity(0.6)),
          cursorColor: textgrey,
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly], onChanged: (String value) {}),
    );
  }
}