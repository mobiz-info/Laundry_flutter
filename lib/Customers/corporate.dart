import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Customers/add_picking_address.dart';
import 'package:golden_falcon/components/common_methods.dart';
import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../src/Color.dart';

class Corporate extends StatefulWidget {
  const Corporate({Key? key}) : super(key: key);

  @override
  State<Corporate> createState() => _CorporateState();
}

class _CorporateState extends State<Corporate> {

  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController trnNoController = TextEditingController();
  final TextEditingController billingAddressController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailIDController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController altMobileController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController emailRegController = TextEditingController();
  final TextEditingController whatsAppController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController customerTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      CustomerBloc(RepositoryProvider.of<CustomerRepository>(context)),
          //..add(GetCorporateSaveEvent()),
      child: BlocBuilder<CustomerBloc, CustomerState>(
        builder: (context, state) {
          if (state is CorporateSaveFetching) {
            return Container(color: Colors.white, child: const Center(child: CircularProgressIndicator()));
          } else if (state is CorporateSaveError){
            snackBar(context, message: state.message.toString());
            return Container(color: Colors.white, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
          }
          return Scaffold(
            backgroundColor: BgGrey,
            appBar: ScreenAppbar(
                text: "Corporate",
                svgNeed: true,
                imagepath: "Assets/Images/corporate_icon.svg",
                colorChange: true),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RegisterTextFormField(
                        getController: companyNameController,
                        labelText: 'Company Name',
                        imagePaths: 'Assets/Images/building_icon.svg',
                      ),
                      const SizedBox(height: 16),
                      RegisterTextFormField(
                        getController: trnNoController,
                        labelText: 'TRN',
                        imagePaths: 'Assets/Images/cor_trn_icon.png',
                        inputFormat: [FilteringTextInputFormatter.digitsOnly],
                        keyboardType: TextInputType.number
                      ),
                      const SizedBox(height: 16),
                      RegisterTextFormField(
                        getController: billingAddressController,
                        labelText: 'Billing Address',
                        imagePaths: 'Assets/Images/cor_building_icon.png',
                      ),
                      const SizedBox(height: 16),
                      RegisterTextFormField(
                        getController: mobileController,
                        labelText: 'Phone Number',
                        imagePaths: 'Assets/Images/mobile_icon.svg',
                        inputFormat: [FilteringTextInputFormatter.digitsOnly],
                        keyboardType: TextInputType.number
                      ),
                      const SizedBox(height: 16),
                      RegisterTextFormField(
                        getController: emailIDController,
                        labelText: 'Email Id',
                        imagePaths: 'Assets/Images/cor_email_icon.png',
                      ),
                      const SizedBox(height: 26),
                      const Divider(
                       color: DividerGrey,
                      ),
                      const SizedBox(height: 12),
                      const Text('Registrant Details', style: TextStyle(color: textgrey, fontSize: 16, fontWeight: FontWeight.w600),),
                      const SizedBox(height: 20),
                      RegisterTextFormField(
                        getController: nameController,
                        labelText: 'Name',
                        imagePaths: 'Assets/Images/username_icon.svg',
                      ),
                      const SizedBox(height: 16),
                      RegisterTextFormField(
                        getController: altMobileController,
                        labelText: 'Phone Number',
                        imagePaths: 'Assets/Images/mobile_icon.svg',
                        inputFormat: [FilteringTextInputFormatter.digitsOnly],
                        keyboardType: TextInputType.number
                      ),
                      const SizedBox(height: 16),
                      RegisterTextFormField(
                        getController: designationController,
                        labelText: 'Designation',
                        imagePaths: 'Assets/Images/cor_desig_icon.png',
                      ),
                      const SizedBox(height: 16),
                      RegisterTextFormField(
                        getController: emailRegController,
                        labelText: 'Email Id',
                        imagePaths: 'Assets/Images/cor_email_icon.png',
                      ),
                      const SizedBox(height: 16),
                      RegisterTextFormField(
                        getController: whatsAppController,
                        labelText: 'Whatsapp No:',
                        imagePaths: 'Assets/Images/whatsapp_icon.svg',
                        inputFormat: [FilteringTextInputFormatter.digitsOnly],
                        keyboardType: TextInputType.number
                      ),
                      const SizedBox(height: 16),
                      RegisterTextFormField(
                        getController: altMobileController,
                        labelText: 'User Name',
                        imagePaths: 'Assets/Images/user_name_icon.svg',
                        keyboardType: TextInputType.none,
                      ),
                      const SizedBox(height: 16),
                      RegisterTextFormField(
                        getController: passwordController,
                        labelText: 'Password',
                        imagePaths: 'Assets/Images/password_icon.svg',
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () {
                            if (companyNameController.text.isEmpty) {
                              snackBar(context, message: 'Please enter company name');
                            } else if (trnNoController.text.isEmpty) {
                              snackBar(context, message: 'Please enter trn number');
                            } else if (trnNoController.text.length != 15) {
                              snackBar(context, message: 'Please enter valid trn number');
                            } else if (billingAddressController.text.isEmpty) {
                              snackBar(context, message: 'Please enter billing address');
                            } else if (mobileController.text.isEmpty) {
                              snackBar(context, message: 'Please enter phone number');
                            } else if (mobileController.text.length != 10) {
                              snackBar(context, message: 'Please enter valid phone number');
                            } else if (emailIDController.text.isEmpty) {
                              snackBar(context, message: 'Please enter email id');
                            } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailIDController.text) &&
                                emailIDController.text.endsWith('.com')) {
                              snackBar(context, message: 'Please enter valid email id');
                            } else if (nameController.text.isEmpty) {
                              snackBar(context, message: 'Please enter name');
                            } else if (altMobileController.text.isEmpty) {
                              snackBar(context, message: 'Please enter phone number');
                            } else if (altMobileController.text.length != 10) {
                              snackBar(context, message: 'Please enter valid phone number');
                            } else if (designationController.text.isEmpty) {
                              snackBar(context, message: 'Please enter designation');
                            } else if (emailRegController.text.isEmpty) {
                              snackBar(context, message: 'Please enter email id');
                            } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailIDController.text) &&
                                emailRegController.text.endsWith('.com')) {
                              snackBar(context, message: 'Please enter valid email id');
                            }
                            // else if (whatsAppController.text.isEmpty) {
                            //   snackBar(context, message: 'Please enter whats app number');
                            // } else if (whatsAppController.text.length != 10) {
                            //   snackBar(context, message: 'Please enter valid whats app number');
                            // }
                            else if (passwordController.text.isEmpty) {
                              snackBar(context, message: 'Please enter password');
                            }
                            else {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)
                              => AddPickingAddress(
                                  companyName: companyNameController.text,
                                  trn: trnNoController.text,
                                  billingAddress: billingAddressController.text,
                                  customerType: 'Co-operate',
                                  mobileNumber: int.parse(mobileController.text),
                                  emailId: emailIDController.text,
                                  name: nameController.text,
                                  altMobile: int.parse(altMobileController.text),
                                  designation: designationController.text,
                                  altEmail: emailRegController.text,
                                  whatsApp: int.parse(whatsAppController.text),
                                  userName: altMobileController.text,
                                  password: passwordController.text
                              )
                              ));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: const Text('ADD PICKING ADDRESS',
                            style: TextStyle(fontSize: 16.0, color: White, fontWeight: FontWeight.w600),
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
      ),
    );
  }
}
