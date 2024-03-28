import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:golden_falcon/Customers/Customer_Home.dart';

import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Models/CustomerModel/area_list_model.dart';
import '../Models/CustomerModel/edit_profile_get_model.dart';
import '../Models/CustomerModel/emirates_list_model.dart';
import '../Models/CustomerModel/location_list_model.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';
import 'add_address.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController whatsAppController = TextEditingController();
  final TextEditingController buildingNoController = TextEditingController();
  final TextEditingController buildingNameController = TextEditingController();
  final TextEditingController floorNoController = TextEditingController();
  final TextEditingController flatNoController = TextEditingController();
  final TextEditingController emiratesController = TextEditingController();
  final TextEditingController emiratesIDController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController areaIDController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController locationIDController = TextEditingController();
  final TextEditingController gpseController = TextEditingController();
  final TextEditingController gpsnController = TextEditingController();
  final CustomerRepository customerRepository = CustomerRepository();
  Position? currentPosition;
  var emirateResponse;
  var areaResponse;
  var locationResponse;
  var personalSaveResponse;
  bool isFetchingGPS = false;

  getProfileData() async {
    var response = await customerRepository.getEditProfileData(token: authData.user_token!);
    EditProfileGetData? data = response.data;
    emiratesController.text = data?.location?.emirateName ?? '--';
    areaController.text = data?.location?.areaName ?? '--';
    locationController.text = data?.location?.name ?? '--';
    gpseController.text = data?.gpse ?? '--';
    gpsnController.text = data?.gpsn ?? '--';
    nameController.text = data?.name ?? '--';
    phoneController.text = data?.mobile ?? '--';
    whatsAppController.text = data?.whatsApp ?? '--';
    buildingNoController.text = data?.buildingNo ?? '--';
    buildingNameController.text = data?.buildingName ?? '--';
    floorNoController.text = data?.floorNumber ?? '--';
    flatNoController.text = data?.flatNumber ?? '--';
    emiratesIDController.text = data?.location?.emirateId ?? '--';
    areaIDController.text = data?.location?.areaId ?? '--';
    if (emiratesIDController.text.isNotEmpty) {
      print('emirates Id vvv ${emiratesIDController.text}');
      var areaRes = await customerRepository.getAreaData(emirateID: emiratesIDController.text);
      if (areaRes is AreaListModel) {
        areaResponse = areaRes.data;
      }
    }
    if (areaIDController.text.isNotEmpty) {
      print('area Id vvv ${areaIDController.text}');
      var locationRes = await customerRepository.getLocationData(areaID: areaIDController.text);
      if (locationRes is LocationListModel) {
        locationResponse = locationRes.data?.locationList;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BgGrey,
      appBar: ScreenAppbar(
        text: "Edit Profile",
        imagepath: "Assets/Images/edit_img.svg",
        needAction: true,
        svgNeed: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: BlocProvider(
              create: (context) =>
              CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
                ..add(GetEmiratesEvent()),
              child: BlocBuilder<CustomerBloc, CustomerState>(
                builder: (context, state) {
                  print('state ${state}');
                  if (state is EmiratesFetching || state is AreaFetching || state is LocationFetching) {
                    return const Center(child: CircularProgressIndicator(color: primaryColor));
                  } else if (state is EmiratesFetched) {
                    emirateResponse = state.emiratesData;
                  } else if (state is AreaFetched) {
                    areaResponse = state.areaData;
                  } else if (state is LocationFetched) {
                    locationResponse = state.locationData?.locationList;
                  } else if (state is LocationError) {
                    locationResponse = [];
                  }
                  else if (state is EditProfileError) {
                    snackBar(context, message: state.message.toString());
                    return Container(color: BgGrey, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
                  }
                  else {
                    return Container(color: Colors.white, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropDownTextFormField(
                        controller: emiratesController,
                        labelText: 'Choose Emirates',
                        onTap: () {
                          // print('eid ${emiratesIDController.text}');
                            if(emirateResponse != null) {
                              showEmiratesListDialog(context, emirateResponse!.emiratesList!, (value) {
                                BlocProvider.of<CustomerBloc>(context).add(GetAreaEvent(value));
                              });
                            }
                          },
                      ),
                      const SizedBox(height: 18),
                      DropDownTextFormField(
                        controller: areaController,
                        labelText: 'Choose Area',
                        onTap: () {
                          // print('aid ${areaIDController.text}');
                          setState(() {
                            if (emiratesController.text.isEmpty) {
                              snackBar(context, message: 'Please select emirates');
                            } else {
                              if(areaResponse != null) {
                                showAreaListDialog(context, areaResponse.areaList!, (value) {
                                  BlocProvider.of<CustomerBloc>(context).add(GetLocationEvent(value));
                                });
                              }
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 18),
                      DropDownTextFormField(
                        controller: locationController,
                        labelText: 'Choose Locality',
                        onTap: () {
                          setState(() {
                            if (emiratesController.text.isEmpty) {
                              snackBar(context, message: 'Please select emirates');
                            } else if (areaController.text.isEmpty) {
                              snackBar(context, message: 'Please select area');
                            } else {
                              if(locationResponse != null) {
                                showLocationListDialog(context, locationResponse);
                              }
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 18),
                      Container(
                        width: double.infinity,
                        height: 52,
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isFetchingGPS = true;
                            });
                            getCurrentLocation();
                          },
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Fetch GPS', style: TextStyle(color: textgrey, fontSize: 12, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: RegisterTextFormField(
                                getController: gpseController,
                                labelText: 'Latitude',
                                keyboardType: TextInputType.none,
                                inputFormat: [FilteringTextInputFormatter.digitsOnly],
                                readOnly: true,
                                onTap: () {
                                  getCurrentLocation();
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: RegisterTextFormField(
                                getController: gpsnController,
                                labelText: 'Longitude',
                                keyboardType: TextInputType.none,
                                inputFormat: [FilteringTextInputFormatter.digitsOnly],
                                readOnly: true,
                                onTap: () {
                                  getCurrentLocation();
                                },
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 18),
                      RegisterTextFormField(
                          labelText: 'Name',
                          getController: nameController),
                      const SizedBox(height: 18),
                      RegisterTextFormField(
                          labelText: 'Phone',
                          getController: phoneController,
                          inputFormat: [FilteringTextInputFormatter.digitsOnly],
                          keyboardType: TextInputType.number
                      ),
                      const SizedBox(height: 18),
                      RegisterTextFormField(
                          labelText: 'Whatsapp No',
                          getController: whatsAppController,
                          inputFormat: [FilteringTextInputFormatter.digitsOnly],
                          keyboardType: TextInputType.number
                      ),
                      const SizedBox(height: 18),
                      RegisterTextFormField(
                          labelText: 'Building No',
                          getController: buildingNoController,
                          inputFormat: [FilteringTextInputFormatter.digitsOnly],
                          keyboardType: TextInputType.number
                      ),
                      const SizedBox(height: 18),
                      RegisterTextFormField(
                          labelText: 'Building Name',
                          getController: buildingNameController,
                      ),
                      const SizedBox(height: 18),
                      RegisterTextFormField(
                          labelText: 'Floor No',
                          getController: floorNoController,
                          inputFormat: [FilteringTextInputFormatter.digitsOnly],
                          keyboardType: TextInputType.number
                      ),
                      const SizedBox(height: 18),
                      RegisterTextFormField(
                          labelText: 'Flat No',
                          getController: flatNoController,
                          inputFormat: [FilteringTextInputFormatter.digitsOnly],
                          keyboardType: TextInputType.number
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () {
                            if (emiratesController.text.isEmpty) {
                              snackBar(context, message: 'Please select emirates');
                            } else if (areaController.text.isEmpty) {
                              snackBar(context, message: 'Please select area');
                            } else if (locationController.text.isEmpty) {
                              snackBar(context, message: 'Please select locality');
                            } else if (gpseController.text.isEmpty) {
                              snackBar(context, message: 'Please click fetch GPS');
                            } else if (gpsnController.text.isEmpty) {
                              snackBar(context, message: 'Please click fetch GPS');
                            } else if (nameController.text.isEmpty) {
                              snackBar(context, message: 'Please enter name');
                            } else if (phoneController.text.isEmpty) {
                              snackBar(context, message: 'Please enter phone number');
                            } else if (phoneController.text.length != 10) {
                              snackBar(context, message: 'Please enter valid phone number');
                            } else if (whatsAppController.text.isEmpty) {
                              snackBar(context, message: 'Please enter whats app number');
                            } else if (whatsAppController.text.length != 10) {
                              snackBar(context, message: 'Please enter valid whats app number');
                            } else if (buildingNoController.text.isEmpty) {
                              snackBar(context, message: 'Please enter building no:');
                            } else if (buildingNameController.text.isEmpty) {
                              snackBar(context, message: 'Please enter building name');
                            } else if (floorNoController.text.isEmpty) {
                              snackBar(context, message: 'Please enter floor number');
                            } else if (flatNoController.text.isEmpty) {
                              snackBar(context, message: 'Please enter flat number');
                            } else {
                              BlocProvider.of<CustomerBloc>(context).add(GetEditingProfileEvent(
                                  authData.user_token!,
                                  gpseController.text,
                                  gpsnController.text,
                                  locationIDController.text,
                                  nameController.text,
                                  phoneController.text,
                                  whatsAppController.text,
                                  buildingNoController.text,
                                  buildingNameController.text,
                                  floorNoController.text,
                                  flatNoController.text));
                              snackBar(context, message: 'Profile updated successfully', type: MessageType.success);
                              Future.delayed(Duration(seconds: 2), () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CustomerHomeScreen()));
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor, elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: const Text('SAVE CHANGES', style: TextStyle(fontSize: 16.0, color: White)),
                        ),
                      ),
                    ],
                  );
                }
              ),
            ),
          )
      ),
    );
  }

  getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        const Text('Location permissions are denied, allow from settings');
        return null;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      const Text('Location permissions are denied, allow from settings');
      return null;
    }
    Position location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    debugPrint('longitude: ${location.longitude}, Latitude: ${location.latitude}');
    currentPosition = location;
    gpseController.text = '${location.latitude}';
    gpsnController.text =' ${location.longitude}';
  }

  showEmiratesListDialog(BuildContext context, List<EmiratesList> emirateList, Function(String) callback) {
    return showCustomBottomSheet(
        context,
        title: 'Please choose a Emirate',
        ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => const Divider(color: Colors.transparent),
            itemCount: emirateList.length ?? 0,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                emiratesController.text = emirateList[index].name!;
                emiratesIDController.text = emirateList[index].emirateId!;
                Navigator.pop(context);
                callback(emiratesIDController.text);
                areaController.clear();
                areaIDController.clear();
                locationController.clear();
                locationIDController.clear();
              } ,
              child: Text((emirateList[index].name)!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w600)),
            )));
  }

  showAreaListDialog(BuildContext context, List<AreaList> areaList, Function(String) callback) {
    return showCustomBottomSheet(
        context,
        title: 'Please choose a Area',
        areaList.isEmpty == true ?
        const Center(
            child: Text('No Areas found', style: TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w600))
        ) :
        ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => const Divider(color: Colors.transparent),
            itemCount: areaList.length ?? 0,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                areaController.text = areaList[index].name!;
                areaIDController.text = areaList[index].areaId!;
                Navigator.pop(context);
                callback(areaIDController.text);
                locationController.clear();
                locationIDController.clear();
              } ,
              child: Text((areaList[index].name)!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w600)),
            )));
  }

  showLocationListDialog(BuildContext context, List<dynamic> locationList) {
    return showCustomBottomSheet(
        context,
        title: 'Please choose a Locality',
        locationList.isEmpty == true ?
        const Center(
            child: Text('No Locations found', style: TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w600))
        ) :
        ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => const Divider(color: Colors.transparent),
            itemCount: locationList.length ?? 0,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                locationController.text = locationList[index].name!;
                locationIDController.text = locationList[index].locationId!;
                Navigator.pop(context);
                //callback(locationIDController.text);
              } ,
              child: Text((locationList[index].name)!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w600)),
            )));
  }

}

class RegisterTextFormField extends StatelessWidget {
  final TextEditingController getController;
  final String labelText;
  void Function()? onTap;
  final List<TextInputFormatter>? inputFormat;
  final TextInputType? keyboardType;
  final bool readOnly;

  RegisterTextFormField({required this.getController, required this.labelText, this.inputFormat, this.keyboardType, this.readOnly=false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: TextFormField(
        readOnly: readOnly,
        inputFormatters: inputFormat,
        keyboardType: keyboardType,
        onTap: onTap,
        controller: getController,
        decoration: InputDecoration(
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

class DropDownTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? text;
  final IconData? suffixIcon;
  final Function()? onTap;
  final TextInputType inputType;
  final String? hintText;
  final int maxLines;

  const DropDownTextFormField(
      {Key? key,
        required this.controller,
        this.labelText,
        this.suffixIcon,
        this.text,
        this.onTap,
        this.inputType = TextInputType.text,
        this.hintText, this.maxLines=1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: TextFormField(
        readOnly: true,
        keyboardType: inputType,
        onTap: onTap,
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: labelText,
          labelStyle: const TextStyle(color: textgrey, fontSize: 12, fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
          suffixIcon: const Icon(Icons.arrow_drop_down, color: primaryColor, size: 28),
        ),
        style: const TextStyle(color: textgrey, fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controllerName;
  final bool? needPadding;
  final bool? needSuffix;
  final double? boxHeight;
  final EdgeInsetsGeometry? padding;

  const CustomTextField({super.key, required this.hintText, required this.controllerName, this.needPadding, this.needSuffix, this.boxHeight, this.padding});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: needPadding == true ? boxHeight : 48,
      child: TextFormField(
        controller: controllerName,
        decoration: InputDecoration(
          contentPadding: needPadding == true ?
          padding : const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: textgrey, fontSize: 12, fontWeight: FontWeight.w500),
          suffixIcon: needSuffix == true ? const Icon(Icons.arrow_forward_ios_rounded, color: primaryColor, size: 16,) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
        style: const TextStyle(color: textgrey, fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}


