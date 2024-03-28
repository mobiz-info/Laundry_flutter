import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:golden_falcon/Customers/personal.dart';
import 'package:url_launcher/url_launcher.dart';
import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Loginscreen.dart';
import '../Models/CustomerModel/area_list_model.dart';
import '../Models/CustomerModel/corporate_save_model.dart';
import '../Models/CustomerModel/emirates_list_model.dart';
import '../Models/CustomerModel/location_list_model.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';

class AddPickingAddress extends StatefulWidget {
  final String companyName;
  final String trn;
  final String billingAddress;
  final String customerType;
  final int mobileNumber;
  final String emailId;
  final String name;
  final int altMobile;
  final String designation;
  final String altEmail;
  final int whatsApp;
  final String userName;
  final String password;

  const AddPickingAddress({Key? key,
    required this.companyName,
    required this.trn,
    required this.billingAddress,
    required this.customerType,
    required this.mobileNumber,
    required this.emailId,
    required this.name,
    required this.altMobile,
    required this.designation,
    required this.altEmail,
    required this.whatsApp,
    required this.userName,
    required this.password
  }) : super(key: key);

  @override
  State<AddPickingAddress> createState() => _AddPickingAddressState();
}

class _AddPickingAddressState extends State<AddPickingAddress> {

  final TextEditingController emiratesController = TextEditingController();
  final TextEditingController emiratesIDController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController areaIDController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController locationIDController = TextEditingController();
  final TextEditingController buildingNameNoController = TextEditingController();
  final TextEditingController floorNoController = TextEditingController();
  final TextEditingController flatNoController = TextEditingController();
  final TextEditingController inChargeMobileController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController roomNoController = TextEditingController();
  final TextEditingController locationNoController = TextEditingController();
  final TextEditingController gpsLatitudeController = TextEditingController();
  final TextEditingController gpsLongitudeController = TextEditingController();
  final TextEditingController latController = TextEditingController();
  final TextEditingController longController = TextEditingController();
  Position? currentPosition;
  var emirateResponse;
  var areaResponse;
  var locationResponse;
  var corporateSaveResponse;
  List<AddressList>? addressList = [];
  bool isFetchingGPS = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
        ..add(GetEmiratesEvent()),
      child: BlocBuilder<CustomerBloc, CustomerState>(
          builder: (context, state) {
            if (state is EmiratesFetching || state is CorporateSaveFetching) {
              return Container(color: Colors.white, child: const Center(child: CircularProgressIndicator()));
            }
            else if (state is EmiratesFetched) {
              emirateResponse = state.emiratesData;
            }
            else if (state is AreaFetched) {
              areaResponse = state.areaData;
            }
            else if (state is LocationFetched) {
              locationResponse = state.locationData;
            }
            else if (state is CorporateSaveFetched) {
              corporateSaveResponse = state.corporateSaveData;
            }
            else if (state is CorporateSaveError) {
              snackBar(context, message: state.message.toString());
            }
            else {
              return Container(color: Colors.white, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
            }
            return Scaffold(
              backgroundColor: BgGrey,
              appBar: ScreenAppbar(text: "Corporate", imagepath: "Assets/Images/corporate_img.png", colorChange: true),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Add Picking Address', style: TextStyle(color: textgrey, fontSize: 16, fontWeight: FontWeight.w600),),
                        const SizedBox(height: 20),
                        DropDownTextFormField(
                          controller: emiratesController,
                          imagePaths: 'Assets/Images/emirates_icon.svg',
                          labelText: 'Choose Emirates',
                          onTap: () {
                            if(emirateResponse != null) {
                              showEmiratesListDialog(context, emirateResponse!.emiratesList!, (value) {
                                BlocProvider.of<CustomerBloc>(context).add(GetAreaEvent(value));
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        DropDownTextFormField(
                          controller: areaController,
                          imagePaths: 'Assets/Images/area_icon.svg',
                          labelText: 'Choose Area',
                          onTap: () {
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
                        const SizedBox(height: 16),
                        DropDownTextFormField(
                          controller: locationController,
                          imagePaths: 'Assets/Images/locality_icon.svg',
                          labelText: 'Choose Locality',
                          onTap: () {
                            setState(() {
                              if (emiratesController.text.isEmpty) {
                                snackBar(context, message: 'Please select emirates');
                              } else if (areaController.text.isEmpty) {
                                snackBar(context, message: 'Please select area');
                              } else {
                                if(locationResponse != null) {
                                  showLocationListDialog(context, locationResponse.locationList!);
                                }
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        RegisterTextFormField(
                          getController: buildingNameNoController,
                          labelText: 'Building No / Name:',
                          imagePaths: 'Assets/Images/building_icon.svg',
                        ),
                        const SizedBox(height: 16),
                        RegisterTextFormField(
                          getController: floorNoController,
                          labelText: 'Floor No:',
                          imagePaths: 'Assets/Images/floor_icon.svg',
                          inputFormat: [FilteringTextInputFormatter.digitsOnly],
                          keyboardType: TextInputType.number
                        ),
                        const SizedBox(height: 16),
                        RegisterTextFormField(
                          getController: flatNoController,
                          labelText: 'Flat No: / House No:',
                          imagePaths: 'Assets/Images/building_icon.svg',
                          inputFormat: [FilteringTextInputFormatter.digitsOnly],
                          keyboardType: TextInputType.number
                        ),
                        const SizedBox(height: 16),
                        RegisterTextFormField(
                          getController: inChargeMobileController,
                          labelText: 'Person in charge Mob:',
                          imagePaths: 'Assets/Images/person_mob_icon.svg',
                          inputFormat: [FilteringTextInputFormatter.digitsOnly],
                          keyboardType: TextInputType.number
                        ),
                        const SizedBox(height: 16),
                        RegisterTextFormField(
                          getController: nameController,
                          labelText: 'Name',
                          imagePaths: 'Assets/Images/user_name_icon.svg',
                        ),
                        const SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset('Assets/Images/fetch_gps_icon.svg', width: 24, height: 24),
                                    const SizedBox(width: 24),
                                    const Text('Fetch GPS', style: TextStyle(color: textgrey, fontSize: 12, fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            if (isFetchingGPS)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: RegisterTextFormField(
                                      getController: gpsLatitudeController,
                                      labelText: 'Latitude',
                                      imagePaths: 'Assets/Images/locality_icon.svg',
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
                                      getController: gpsLongitudeController,
                                      labelText: 'Longitude',
                                      imagePaths: 'Assets/Images/locality_icon.svg',
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
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text('* For single address, fill the form one time and click SAVE button',
                            style: TextStyle(color: textgrey, fontSize: 10, fontWeight: FontWeight.w400)),
                        const SizedBox(height: 8),
                        const Text('* For multiple addresses, fill the form first time, click ADD MORE button for adding multiple addresses and finally click SAVE button',
                            style: TextStyle(color: textgrey, fontSize: 10, fontWeight: FontWeight.w400)),
                        const SizedBox(height: 30),
                        Center(
                          child: SizedBox(
                            width: double.infinity,
                            height: 42,
                            child: ElevatedButton(
                              onPressed: () {
                                addressList?.add(AddressList(
                                    emirateId: emiratesController.text,
                                    buildingName: buildingNameNoController.text,
                                    floorNumber: floorNoController.text,
                                    flatNo: flatNoController.text,
                                    mobile: inChargeMobileController.text,
                                    name: nameController.text,
                                    gpse: gpsLatitudeController.text,
                                    gpsn: gpsLongitudeController.text
                                ));
                                print('address Count ${addressList?.length}');
                                emiratesController.clear();
                                buildingNameNoController.clear();
                                floorNoController.clear();
                                flatNoController.clear();
                                inChargeMobileController.clear();
                                nameController.clear();
                                gpsLatitudeController.clear();
                                gpsLongitudeController.clear();
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: primaryColor),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: const Text('ADD MORE ADDRESS',
                                style: TextStyle(fontSize: 14, color: primaryColor, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ElevatedButton(
                            onPressed: () {
                              print('adddd ${addressList?.length}');
                              if (emiratesController.text.isEmpty) {
                                snackBar(context, message: 'Please select emirates');
                              } else if (areaController.text.isEmpty) {
                                snackBar(context, message: 'Please select area');
                              } else if (locationController.text.isEmpty) {
                                snackBar(context, message: 'Please select locality');
                              } else if (buildingNameNoController.text.isEmpty) {
                                snackBar(context, message: 'Please enter building name / no.');
                              } else if (floorNoController.text.isEmpty) {
                                snackBar(context, message: 'Please enter floor number');
                              } else if (flatNoController.text.isEmpty) {
                                snackBar(context, message: 'Please enter flat no. / house no.');
                              } else if (inChargeMobileController.text.isEmpty) {
                                snackBar(context, message: 'Please enter phone number');
                              } else if (inChargeMobileController.text.length != 10) {
                                snackBar(context, message: 'Please enter valid phone number');
                              } else if (nameController.text.isEmpty) {
                                snackBar(context, message: 'Please enter name');
                              } else if (gpsLatitudeController.text.isEmpty) {
                                snackBar(context, message: 'Please click fetch GPS');
                              } else if (gpsLongitudeController.text.isEmpty) {
                                snackBar(context, message: 'Please click fetch GPS');
                              }
                              else {
                                BlocProvider.of<CustomerBloc>(context).add(GetCorporateSaveEvent(
                                    widget.altMobile.toString(),
                                    widget.name,
                                    widget.emailId,
                                    widget.password,
                                    widget.customerType,
                                    buildingNameNoController.text,
                                    roomNoController.text,
                                    widget.altEmail,
                                    widget.mobileNumber,
                                    widget.altMobile,
                                    widget.whatsApp,
                                    0,
                                    0,
                                    0,
                                    double.parse(gpsLatitudeController.text).toInt(),
                                    double.parse(gpsLongitudeController.text).toInt(),
                                    locationIDController.text,
                                    widget.companyName,
                                    widget.trn,
                                    widget.billingAddress,
                                    widget.designation,
                                    buildingNameNoController.text,
                                    floorNoController.text,
                                    flatNoController.text,
                                    addressList
                                ));
                                snackBar(context, message: 'Registration completed successfully', type: MessageType.success);
                                Future.delayed(Duration(seconds: 2), () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            child: const Text('SAVE',
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
              callback( emiratesIDController.text);
            } ,
            child: Text((emirateList[index].name)!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w500)),
          )));
  }

  showAreaListDialog(BuildContext context, List<AreaList> areaList, Function(String) callback) {
    return showCustomBottomSheet(
        context,
        title: 'Please choose a Area',
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
              } ,
              child: Text((areaList[index].name)!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w600)),
            )));
  }

  showLocationListDialog(BuildContext context, List<LocationList> locationList) {
    return showCustomBottomSheet(
        context,
        title: 'Please choose a Area',
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
              child: Text((locationList[index].name)!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w600)),
            )));
  }

  getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Text('Location permissions are denied, allow from settings');
        return null;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Text('Location permissions are denied, allow from settings');
      return null;
    }
    Position location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    debugPrint('longitude: ${location.longitude}, Latitude: ${location.latitude}');
    currentPosition = location;
    gpsLatitudeController.text = '${location.latitude}';
    gpsLongitudeController.text =' ${location.longitude}';
  }

  openMap() async {
    Uri googleUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=${currentPosition?.latitude},${currentPosition?.longitude}');
    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(googleUrl);
      print('lattt ${currentPosition?.latitude}');
      print('longg ${currentPosition?.longitude}');
    } else {
      throw 'Could not open the map';
    }
  }

}

class RegisterTextFormField extends StatelessWidget {
  final TextEditingController getController;
  final String labelText;
  final String imagePaths;
  void Function()? onTap;
  final List<TextInputFormatter>? inputFormat;
  final TextInputType? keyboardType;
  final bool readOnly;

  RegisterTextFormField({required this.getController, required this.labelText, required this.imagePaths, this.onTap, this.inputFormat, this.keyboardType, this.readOnly=false});

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
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16.0),
            //child: SvgPicture.asset(imagePaths),
            child:  imagePaths.endsWith('.svg')
                ? SizedBox(width:24, height: 24, child: SvgPicture.asset(imagePaths, width:24, height: 24))
                : SizedBox(width:24, height: 24, child: Image.asset(imagePaths)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17.0),
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
  final String imagePaths;

  const DropDownTextFormField(
      {Key? key,
        required this.controller,
        this.labelText,
        this.suffixIcon,
        this.text,
        this.onTap,
        required this.imagePaths,
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
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16.0),
            //child: Image.asset(imagePaths),
            child:  imagePaths.endsWith('.svg')
                ? SizedBox(width:24, height: 24, child: SvgPicture.asset(imagePaths, width:24, height: 24))
                : SizedBox(width:24, height: 24, child: Image.asset(imagePaths)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17.0),
            borderSide: BorderSide.none,
          ),
          suffixIcon: const Icon(Icons.arrow_drop_down, color: primaryColor, size: 28),
        ),
        style: const TextStyle(color: textgrey, fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}
