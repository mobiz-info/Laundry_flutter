import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:golden_falcon/BLoCs/PickerBloc/picker_bloc.dart';
import 'package:golden_falcon/Models/PickerModel/location_price_model.dart';
import 'package:golden_falcon/Picker_App/screens/homepage.dart';
import 'package:golden_falcon/Picker_App/screens/my_client.dart';
import 'package:golden_falcon/Picker_App/src/colors.dart';
import 'package:golden_falcon/Picker_App/src/dimen.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Repositories/PickerRepo/picker_repo.dart';

import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/drawer.dart';

class AddClientScreen extends StatefulWidget {
  final bool fromHome;
  const AddClientScreen({super.key, required this.fromHome});

  @override
  State<AddClientScreen> createState() => _AddClientScreenState();
}
enum CustomerType { Home, Corporate }
class _AddClientScreenState extends State<AddClientScreen> {
  CustomerType? _animal = CustomerType.Home;
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController buildController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController whatsappController = TextEditingController();
  TextEditingController altController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController longController = TextEditingController();
  TextEditingController credLmtController = TextEditingController();
  TextEditingController credDaysController = TextEditingController();
  TextEditingController credInvController = TextEditingController();
  String? selectedOption;
  List<String> priceList = [];
  String selectedValue = "Select Group";
  String pgId = "";
  bool isVisible = false;
  String custmType = "";
  @override
  Widget build(BuildContext context) {
    CustomerTypeList csType;
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => PickerBloc(
        RepositoryProvider.of<PickerRepository>(context),
      )..add(FetchLocationPriceEvent(authData.user_token.toString())),
      child: BlocBuilder<PickerBloc, PickerState>(
        builder: (context, state) {
          if (state is LocationPriceFetching) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: pickerPrimaryColor,
                leading: IconButton(
                  onPressed: () {
                    widget.fromHome
                        ? Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false)
                        : Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => MyClientScreen()),
                            (route) => false);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  "Add Customer",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
              ),
              body: const Center(
                child: CircularProgressIndicator(
                  color: pickerPrimaryColor,
                ),
              ),
            );
          } else if (state is LocationPriceFetched) {
            csType = state.ctList;
            if (priceList.isEmpty) {
              priceList.add("Select Group");
              state.pgList.forEach((element) {
                priceList.add(element.name);
              });
            } else {
              priceList = [];
              priceList.add("Select Group");
              state.pgList.forEach((element) {
                priceList.add(element.name);
              });
            }
            return Scaffold(
              appBar: AppBar(
                backgroundColor: pickerPrimaryColor,
                leading: IconButton(
                  onPressed: () {
                    widget.fromHome
                        ? Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false)
                        : Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => MyClientScreen()),
                            (route) => false);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  "Add Customer",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          "Customer Details",
                          style: TextStyle(
                              color: pickerPrimaryColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: pickerPrimaryColor,
                              width: .5
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                             Row(
                              children: [
                                Expanded(
                                    child: TextField(
                                      controller: nameController,
                                      decoration: InputDecoration(
                                        hintText: "Name",
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    )
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                    child: TextField(
                                      controller: userNameController,
                                      decoration: InputDecoration(
                                        hintText: "Username",
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    )
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                             Row(
                              children: [
                                Expanded(
                                    child: TextField(
                                      controller: emailController,
                                      decoration: InputDecoration(
                                        hintText: "Email",
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    )
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                    child: TextField(
                                      controller: passwordController,
                                      obscureText: isVisible ? false : true,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(onPressed: (){
                                          if (isVisible) {
                                            setState(() {
                                              isVisible = false;
                                            });
                                          } else {
                                            setState(() {
                                              isVisible = true;
                                            });
                                          }
                                        }, icon: Icon(
                                          isVisible ? Icons.visibility_off : Icons.visibility,
                                          color: pickerPrimaryColor,
                                        ),
                                        ),
                                        hintText: "Password",
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    )
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                             Row(
                              children: [
                                Expanded(
                                    child: TextField(
                                      controller: buildController,
                                      decoration: InputDecoration(
                                        hintText: "Building.No",
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    )
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                    child: TextField(
                                      controller: roomController,
                                      decoration: InputDecoration(
                                        hintText: "Room No",
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    )
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                             Row(
                              children: [
                                Expanded(
                                    child: TextField(
                                      controller: mobileController,
                                      decoration: InputDecoration(
                                        hintText: "Mobile",
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    )
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                    child: TextField(
                                      controller: whatsappController,
                                      decoration: InputDecoration(
                                        hintText: "WhatsApp",
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    )
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                    child: TextField(
                                      controller: altController,
                                      decoration: InputDecoration(
                                        hintText: "Alt.Mobile",
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    )
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                 Expanded(
                                    child: TextField(
                                      controller: latController,
                                      decoration: InputDecoration(
                                        hintText: "GPSE",
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    )
                                ),
                                const SizedBox(width: 5),
                                 Expanded(
                                    child: TextField(
                                      controller: longController,
                                      decoration: InputDecoration(
                                        hintText: "GPSN",
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    )
                                ),
                                const SizedBox(width: 5),
                                IconButton(
                                  icon: const Icon(Icons.my_location, color: pickerPrimaryColor),
                                  onPressed: () {
                                    getLocation();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Center(
                        child: Text(
                          "Account Details",
                          style: TextStyle(
                              color: pickerPrimaryColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: pickerPrimaryColor,
                              width: .5
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.all(0),
                                      title: const Text('Home'),
                                      leading: Radio<CustomerType>(
                                        value: CustomerType.Home,
                                        groupValue: _animal,
                                        onChanged: (CustomerType? value) {
                                          setState(() {
                                            _animal = value;
                                            custmType = "Home";
                                          });
                                          debugPrint(_animal!.name);
                                        },
                                      ),
                                    )),
                                Expanded(
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.all(0),
                                    title: const Text('Corporate'),
                                    leading: Radio<CustomerType>(
                                      value: CustomerType.Corporate,
                                      groupValue: _animal,
                                      onChanged: (CustomerType? value) {
                                        setState(() {
                                          _animal = value;
                                          custmType = "Corporate";
                                        });
                                        debugPrint(_animal!.name);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                             Row(
                              children: [
                                Expanded(
                                    child: TextField(
                                      controller: credLmtController,
                                      decoration: InputDecoration(
                                        hintText: "Credit Limit",
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    )
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                    child: TextField(
                                      controller: credDaysController,
                                      decoration: InputDecoration(
                                        hintText: "Credit Days",
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    )
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                    child: TextField(
                                      controller: credInvController,
                                      decoration: InputDecoration(
                                        hintText: "Credit Invoice",
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: pickerPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    )
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Container(
                              width: size.width,
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                    color: pickerPrimaryColor, style: BorderStyle.solid, width: 0.80),
                              ),
                              child: DropdownButton(
                                items: priceList
                                    .map((value) => DropdownMenuItem(
                                  child: Text(value),
                                  value: value,
                                ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value!;
                                  });
                                  if (selectedValue != "") {
                                    state.pgList.forEach((element) {
                                      if (selectedValue == element.name) {
                                        setState(() {
                                          pgId = element.priceGroupId;
                                        });
                                        print('Name: ${element.name} PG_ID: $pgId');
                                      }
                                    });
                                  }
                                },
                                isExpanded: false,
                                value: selectedValue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: pickerPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                            onPressed: (){
                            print(priceList.toList());
                              Map<String, String> body = {
                                "id":authData.user_id.toString(),
                                "username":userNameController.text,
                                "name":nameController.text,
                                "email":emailController.text,
                                "password":passwordController.text,
                                "customer_type":custmType,
                                "building_no":buildController.text,
                                "room_no":roomController.text,
                                "mobile":mobileController.text,
                                "alt_mobile":altController.text,
                                "whats_app":whatsappController.text,
                                "credit_limit":credLmtController.text,
                                "credit_days":credDaysController.text,
                                "credit_invoices":credInvController.text,
                                "GPSE":latController.text,
                                "GPSN":longController.text,
                                "price_group_id":pgId
                              };
                              print(body);
                              BlocProvider.of<PickerBloc>(context).add(AddNewClientEvent(body, authData.user_token.toString()));
                              Future.delayed(
                                Duration(seconds: 1),
                                () => widget.fromHome ?
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage(),), (route) => false) :
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyClientScreen(),), (route) => false)
                              );
                            },
                            child: Text(
                                "Add Data",
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Scaffold (
              appBar: AppBar(
                backgroundColor: pickerPrimaryColor,
                leading: IconButton(
                  onPressed: () {
                    widget.fromHome
                        ? Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false)
                        : Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => MyClientScreen()),
                            (route) => false);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  "Add Customer",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
              ),
              body: const Center(
                child: Text("No Data"),
              ),
            );
          }
        },
      ),
    );
  }

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    setState(() {
      latController.text = position.latitude.toString();
      longController.text = position.longitude.toString();
    });
  }
}
