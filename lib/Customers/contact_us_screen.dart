import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_falcon/Customers/Customer_Home.dart';
import 'package:golden_falcon/Loginscreen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Models/CustomerModel/call_support_model.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';
import 'Edit.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {

  final CustomerRepository customerRepository = CustomerRepository();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

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

    int currentIndex = 0;

    return Scaffold(
      backgroundColor: BgGrey,
      appBar: ScreenAppbar(
        text: 'Contact Us',
        imagepath: "Assets/Images/contact_us_img.svg",
        svgNeed: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        iconSize: 20,
        currentIndex: currentIndex,
        showUnselectedLabels: true,
        unselectedItemColor: textgrey,
        selectedItemColor: Colors.transparent,
        selectedLabelStyle: const TextStyle(fontSize: 10, color: textgrey),
        unselectedLabelStyle: const TextStyle(fontSize: 10, color: textgrey),
        onTap: (int index) {
          debugPrint('index $index');
          setState(() {
            currentIndex = index;
          });
          switch(index) {
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerHomeScreen()));
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactUsScreen()));
              break;
            case 2:
              showExitPopup();
              break;
          }
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('Assets/Images/home_bottombar_icon.png'),
            label: 'Home',
            activeIcon: Container(
              decoration: const BoxDecoration(
                  color: primaryColor, shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset('Assets/Images/home_bottombar_icon.png'),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('Assets/Images/contact_us_icon.svg'),
            label: 'Contact Us',
            activeIcon: Container(
              decoration: const BoxDecoration(
                  color: primaryColor, shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset('Assets/Images/contact_us_icon.svg'),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('Assets/Images/exit_icon.svg'),
            label: 'Exit',
            activeIcon: Container(
              decoration: const BoxDecoration(
                  color: primaryColor, shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset('Assets/Images/exit_icon.svg'),
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<CallSupportModel>(
          future: customerRepository.getCallSupportData(token: authData.user_token!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(color: primaryColor));
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.data == null || snapshot.data!.data!.isEmpty) {
              return const Text('No delivery address available');
            } else {
              final phoneNumber = snapshot.data!.data?.first.branchPhone;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: ListView(
                  children: [
                    const Text('Need to get in touch ?', style: TextStyle(fontSize: 16, color: textgrey, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    const Text('We are here to help you', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                    const SizedBox(height: 24),
                    InkWell(
                      onTap: () {
                        //launchPhone(phoneNumber!);
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: SingleChildScrollView(
                                child: AlertDialog(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  title: Column(
                                    children: [
                                      const SizedBox(height: 12),
                                      SvgPicture.asset('Assets/Images/call_icon.svg'),
                                      const SizedBox(height: 32),
                                      Text(phoneNumber ?? '--', textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, color: textgrey, fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                  actions: [
                                    const SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            height: 42, width: 120,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white, surfaceTintColor: Colors.white,
                                                elevation: 0,
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
                                                launchPhone(phoneNumber!);
                                                Navigator.pop(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: primaryColor, surfaceTintColor: Colors.white,
                                                elevation: 0,
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
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 39,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: primaryColor),
                          borderRadius: const BorderRadius.all(Radius.circular(6)),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.phone, color: primaryColor),
                              SizedBox(width: 8),
                              Text('Call Customer Support', textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    const Text('Send us an Email', style: TextStyle(fontSize: 16, color: textgrey, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 12),
                    RegisterTextFormField(
                      getController: nameController,
                      labelText: 'Name',
                    ),
                    const SizedBox(height: 16),
                    RegisterTextFormField(
                      getController: emailController,
                      labelText: 'E-mail',
                    ),
                    const SizedBox(height: 16),
                    RegisterTextFormField(
                      getController: phoneController,
                      labelText: 'Phone',
                      inputFormat: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      hintText: 'We would love to hear from you',
                      controllerName: messageController,
                      needPadding: true,
                      boxHeight: 192,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 120),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity, height: 54,
                      child: ElevatedButton(
                        onPressed: () {
                          if (nameController.text.isEmpty) {
                            snackBar(context, message: 'Please enter name');
                          } else if (emailController.text.isEmpty) {
                            snackBar(context, message: 'Please enter email id');
                          } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailController.text) &&
                              emailController.text.endsWith('.com')) {
                            snackBar(context, message: 'Please enter valid email id');
                          } else if (phoneController.text.isEmpty) {
                            snackBar(context, message: 'Please enter phone number');
                          } else if (phoneController.text.length != 10) {
                            snackBar(context, message: 'Please enter valid phone number');
                          } else if (messageController.text.isEmpty) {
                            snackBar(context, message: 'Please enter message');
                          } else {
                            BlocProvider.of<CustomerBloc>(context).add(GetEmailSupportEvent(
                              authData.user_token!,
                              nameController.text,
                              emailController.text,
                              phoneController.text,
                              messageController.text
                            ));
                            snackBar(context, message: 'Your message sent successfully', type: MessageType.success);
                            Future.delayed(Duration(seconds: 2), () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CustomerHomeScreen()));
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: primaryColor, shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        ),
                        child: const Text('Submit', style: TextStyle(fontSize: 16.0, color: White, fontWeight: FontWeight.w600)),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            }
        }
      ),
    );
  }

  launchPhone(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

}

class RegisterTextFormField extends StatelessWidget {
  final TextEditingController getController;
  final String labelText;
  void Function()? onTap;
  final List<TextInputFormatter>? inputFormat;
  final TextInputType? keyboardType;

  RegisterTextFormField({required this.getController, required this.labelText, this.onTap, this.inputFormat, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: TextFormField(
        inputFormatters: inputFormat,
        keyboardType: keyboardType,
        onTap: onTap,
        controller: getController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          filled: true,
          fillColor: Colors.white,
          labelText: labelText,
          labelStyle: const TextStyle(color: textgrey, fontSize: 12, fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(color: textgrey, fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}
