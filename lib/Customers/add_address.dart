import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Models/CustomerModel/area_list_model.dart';
import '../Models/CustomerModel/emirates_list_model.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';
import 'add_picking_address.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {

  final TextEditingController emiratesController = TextEditingController();
  final TextEditingController emiratesIDController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController areaIDController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController locationIDController = TextEditingController();
  final TextEditingController gpseController = TextEditingController();
  final TextEditingController gpsnController = TextEditingController();
  final TextEditingController gpsLatitudeController = TextEditingController();
  final TextEditingController gpsLongitudeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController whatsAppController = TextEditingController();
  final TextEditingController buildingAddressController = TextEditingController();
  final TextEditingController floorNoController = TextEditingController();
  final TextEditingController flatNoController = TextEditingController();
  Position? currentPosition;
  var emirateResponse;
  var areaResponse;
  var locationResponse;
  var personalSaveResponse;
  bool isFetchingGPS = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BgGrey,
      appBar: ScreenAppbar(
        text: 'Add Address',
        svgNeed: true,
        imagepath: "Assets/Images/add_address_icon.svg",
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: BlocProvider(
            create: (context) =>
            CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
              ..add(GetEmiratesEvent()),
            child: BlocBuilder<CustomerBloc, CustomerState>(
              builder: (context, state) {
                if (state is EmiratesFetching || state is AreaFetching || state is LocationFetching || state is PersonalSaveFetching) {
                  return const Center(child: CircularProgressIndicator(color: primaryColor));
                }
                else if (state is EmiratesFetched) {
                  emirateResponse = state.emiratesData;
                }
                else if (state is AreaFetched) {
                  areaResponse = state.areaData;
                }
                else if (state is LocationFetched) {
                  locationResponse = state.locationData?.locationList;
                }
                else if (state is LocationError) {
                  locationResponse = [];
                }
                else if (state is AddAddressFetched) {
                  personalSaveResponse = state.addAddressData;
                }
                // else if (state is AddAddressError) {
                //   snackBar(context, message: state.message.toString());
                // }
                else {
                  return Container(color: Colors.white, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
                }
                return Column(
                  children: [
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
                              showLocationListDialog(context, locationResponse);
                            }
                          }
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    Column(
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
                              children: [
                                SvgPicture.asset('Assets/Images/fetch_gps_icon.svg', width: 24, height: 24),
                                const SizedBox(width: 20),
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
                    isFetchingGPS == true ? const SizedBox(height: 16) : Container(),
                    RegisterTextFormField(
                      getController: nameController,
                      labelText: 'Name',
                      imagePaths: 'Assets/Images/username_icon.svg',
                    ),
                    const SizedBox(height: 16),
                    RegisterTextFormField(
                        getController: mobileController,
                        labelText: 'Phone',
                        imagePaths: 'Assets/Images/mobile_icon.svg',
                        inputFormat: [FilteringTextInputFormatter.digitsOnly],
                        keyboardType: TextInputType.number
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
                      getController: buildingAddressController,
                      labelText: 'Building Name',
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
                          } else if (gpsLatitudeController.text.isEmpty) {
                            snackBar(context, message: 'Please click fetch GPS');
                          } else if (gpsLongitudeController.text.isEmpty) {
                            snackBar(context, message: 'Please click fetch GPS');
                          } else if (nameController.text.isEmpty) {
                            snackBar(context, message: 'Please enter name');
                          } else if (mobileController.text.isEmpty) {
                            snackBar(context, message: 'Please enter phone number');
                          } else if (mobileController.text.length != 10) {
                            snackBar(context, message: 'Please enter valid phone number');
                          }
                          // else if (whatsAppController.text.isEmpty) {
                          //   snackBar(context, message: 'Please enter whats app number');
                          // } else if (whatsAppController.text.length != 10) {
                          //   snackBar(context, message: 'Please enter valid whats app number');
                          // }
                          else if (buildingAddressController.text.isEmpty) {
                            snackBar(context, message: 'Please enter building name');
                          } else if (floorNoController.text.isEmpty) {
                            snackBar(context, message: 'Please enter floor number');
                          } else {
                            BlocProvider.of<CustomerBloc>(context).add(GetAddAddressesEvent(
                                authData.user_token!,
                                emiratesIDController.text,
                                areaIDController.text,
                                locationIDController.text,
                                buildingAddressController.text,
                                floorNoController.text,
                                flatNoController.text,
                                mobileController.text,
                                nameController.text,
                                gpsLatitudeController.text,
                                gpsLongitudeController.text,
                                whatsAppController.text
                                ));
                            snackBar(context, message: 'Address saved successfully', type: MessageType.success);
                            Future.delayed(const Duration(seconds: 2), () {
                              Navigator.pop(context);
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          elevation: 0,
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
                );
              }
            ),
          ),
        ),
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
    gpsLatitudeController.text = '${location.latitude}';
    gpsLongitudeController.text =' ${location.longitude}';
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
              child: Text((emirateList[index].name)!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w600)),
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

showCustomBottomSheet(BuildContext context, Widget content,
    {Color bgColor = Colors.white, required String title}) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: bgColor,
      isDismissible: false,
      //isScrollControlled: true,
      enableDrag: false,
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height*0.5),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [
            Align(
                alignment: Alignment.centerRight,
                child:
                IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close, color: primaryColor))),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(title,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: textgrey))),
            if(title!='') const SizedBox(height: 8),
            if(title!='') const Divider(thickness: 1.0, color: incDecBorderColor),
            Expanded(
              child: SingleChildScrollView(
                  primary: true,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20.0),
                  child: content),
            )
          ]),
        );
      });
}


