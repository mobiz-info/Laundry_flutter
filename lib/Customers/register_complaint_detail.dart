import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_falcon/Customers/Customer_Home.dart';
import 'package:golden_falcon/Customers/personal.dart';
import 'package:golden_falcon/Models/CustomerModel/register_complaint_list_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../Utils/common.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';
import 'Edit.dart';

class RegisterComplaintDetail extends StatefulWidget {
  final String orderId;

  const RegisterComplaintDetail({Key? key, required this.orderId}) : super(key: key);

  @override
  State<RegisterComplaintDetail> createState() => _RegisterComplaintDetailState();
}

class _RegisterComplaintDetailState extends State<RegisterComplaintDetail> {

  File? imageFile;
  double maxFileSize = 0;
  String maxFileMsg = '';
  String? selectedValue = 'Select type of your complaint';
  String? selectedValueId = '';
  final TextEditingController complaintMessageController = TextEditingController();
  final CustomerRepository customerRepository = CustomerRepository();

  Future<XFile?> pickImageFromGallery() async {
    return await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  Future<void> getImage() async {
    await pickImageFromGallery().then((pickedFile) async {
      try {
        debugPrint('picked file');
        if (pickedFile == null) {
          snackBar(context, message: "Invalid file", type: MessageType.error);
          return;
        }
        final bytes = File(pickedFile.path).readAsBytesSync().lengthInBytes;
        double kb = bytes / 1024;
        debugPrint('file size $kb');
        // if (kb > maxFileSize) {
        //   snackBar(context,
        //       message: "Image size must be less than $maxFileMsg", type: MessageType.error);
        //   return;
        // } else {
        setState(() {
          imageFile = File(pickedFile.path);
        });
        //}
      } catch (e) {
        Navigator.pop(context);
      }
    });
  }

  void removeImage() {
    setState(() {
      imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
          ..add(GetRegisterComplaintListEvent(authData.user_token!, widget.orderId)),
      child: Scaffold(
        backgroundColor: BgGrey,
        appBar: ScreenAppbar(
          text: 'Register your Complaint',
          needAction: true,
          svgNeed: true,
          imagepath: "Assets/Images/complaint_img.svg",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: BlocBuilder<CustomerBloc, CustomerState>(
              builder: (context, state) {
                if (state is RegisterComplaintListFetching) {
                  return Container(color: Colors.transparent,
                      child: const Center(child: CircularProgressIndicator(
                          color: primaryColor, backgroundColor: Colors.transparent)));
                }
                else if (state is RegisterComplaintListFetched) {
                  final data = state.registerComplaintListData;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Order details', style: TextStyle(fontSize: 13.0, color: textgrey, fontWeight: FontWeight.w400)),
                      const SizedBox(height: 8),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                              child: ListTile(
                                leading: (data?.cart?.first.order?.status == "Delivered")
                                    ? SvgPicture.asset('Assets/Images/delivered_icon.svg')
                                    : SvgPicture.asset('Assets/Images/intransist_icon.svg'),
                                contentPadding: EdgeInsets.zero,
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data?.cart?.first.order?.status ?? '--', style: const TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w500)),
                                    Text(data?.cart?.first.order?.createdDate != null ? formatDateYear(data?.cart?.first.order?.createdDate) : '--', style: const TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w300)),
                                  ],
                                ),
                              ),
                            ),
                            ListView.builder(
                                physics: const ScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: data?.cart?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                      child: Row(
                                        children: [
                                          Image.network((baseUrl ?? '') + (data?.cart![index].itemService!.item!.itemImage ?? ''), height: 64, width: 61),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(data?.cart![index].itemService!.item!.itemName ?? '--', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textgrey)),
                                                const SizedBox(height: 2),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    const Text('No of Items', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey)),
                                                    Text(data?.cart![index].quantity ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: textgrey)),
                                                  ],
                                                ),
                                                const SizedBox(height: 2),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    const Text('Rate', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey)),
                                                    Text('AED ${data?.cart![index].amount}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: textgrey)),
                                                  ],
                                                ),
                                                const SizedBox(height: 8)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text('Delivery address', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textgrey)),
                      const SizedBox(height: 8),
                      Text('${data?.deliveryAddress?.name ?? '--'},'
                          '${data?.deliveryAddress?.buildingNo ?? '--'},'
                          '${data?.deliveryAddress?.buildingName ?? '--'},'
                          '${data?.deliveryAddress?.floorNumber ?? '--'},'
                          '${data?.deliveryAddress?.flatNumber ?? '--'}',
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: textgrey)),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total order price', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('AED ${data?.totalOrderprice ?? '--'}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textgrey)),
                              InkWell(
                                  onTap: () {
                                    showPaymentInfoDialog(context, state.registerComplaintListData);
                                  },
                                  child: const Text('View breakup', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: primaryColor))),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Payment method', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey)),
                          Text(data?.paymentMethod ?? '--', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textgrey)),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Service type', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey)),
                          Text(data?.serviceType ?? '--', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textgrey)),
                        ],
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 46,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            String? selectedComplaint = await showComplaintDialog(context, state.registerComplaintListData);
                            if (selectedComplaint != null) {
                              setState(() {
                                selectedValue = selectedComplaint;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, surfaceTintColor: Colors.white,
                            elevation: 0,
                            side: const BorderSide(width: 1.0, color: primaryColor),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(selectedValue ?? 'Select type of your complaint', style: const TextStyle(fontSize: 13, color: textgrey, fontWeight: FontWeight.w400)),
                              const Icon(Icons.keyboard_arrow_down, color: primaryColor)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              getImage();
                            },
                            child: Container(
                              width: 140, height: 28,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: lightGreyText)
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.camera_alt_outlined, color: redColor),
                                  SizedBox(width: 12),
                                  Text('Add Photo', style: TextStyle(fontSize: 13, color: redColor, fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (imageFile != null)
                        Row(
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  height: 70,
                                  child: Image.file(imageFile!, width: 50, height: 50),
                                ),
                                Positioned(
                                  top: -6, right: -14,
                                  child: IconButton(
                                    icon: const Icon(Icons.highlight_remove),
                                    onPressed: removeImage,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        hintText: 'Write your complaint here...',
                        controllerName: complaintMessageController,
                        needPadding: true,
                        boxHeight: 192,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 120),
                      ),
                      const SizedBox(height: 28),
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () {
                            if (selectedValue == 'Select type of your complaint') {
                              snackBar(context, message: 'Please select type of your complaint');
                            } else if (imageFile == null) {
                              snackBar(context, message: 'Please add photo');
                            } else if (complaintMessageController.text.isEmpty) {
                              snackBar(context, message: 'Please enter your complaint');
                            } else {
                              customerRepository.getRegisterButtonData(
                                token: authData.user_token!,
                                order: data!.cart!.first.order!.orderId.toString(),
                                complaintType: selectedValueId.toString(),
                                service: data.cart!.first.itemService!.category!.categoryId.toString(),
                                customer: data.cart!.first.order!.customer.toString(),
                                remarks: complaintMessageController.text,
                                photo: File(imageFile!.path),
                                uploadPhoto: File(imageFile!.path),
                              );
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    elevation: 0,
                                    title: Column(
                                      children: [
                                        const SizedBox(height: 12),
                                        SvgPicture.asset('Assets/Images/recharge_wallet_popup_img.svg'),
                                        const SizedBox(height: 32),
                                        const Text('Your Complaint has been registered Successfully...!', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                    content: const Text('Our team will reply soon', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, color: textgrey, fontWeight: FontWeight.w500)),
                                    actions: [
                                      const SizedBox(height: 12),
                                      SizedBox(
                                        height: 42, width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomerHomeScreen()));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor: Colors.white, surfaceTintColor: Colors.white,
                                            side: const BorderSide(width: 1.6, color: primaryColor),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                          ),
                                          child: const Text('BACK TO HOME', style: TextStyle(fontSize: 15, color: textgrey)),
                                        ),
                                      ),
                                      const SizedBox(height: 38),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor, elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                          ),
                          child: const Text('REGISTER NOW', style: TextStyle(fontSize: 15, color: White)),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  );
                }
                else if (state is RegisterComplaintListError) {
                  Future.delayed(const Duration(milliseconds: 500), () {
                    snackBar(context, message: state.message.toString());
                  });
                  return Container(color: BgGrey, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
                }
                else {
                  return Container(color: BgGrey, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
                }
              }
            ),
          ),
        ),
      ),
    );
  }

  showPaymentInfoDialog(BuildContext context, RegisterComplaintListData? registerComplaintListData) {
    return showCustomBottomSheet(
        context,
        title: 'Payment Information',
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Net Taxable value', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey)),
                Text('AED ${registerComplaintListData?.netTaxable ?? '--'}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textgrey)),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Vat', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey)),
                Text('AED ${registerComplaintListData?.vat ?? '--'}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textgrey)),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Wallet Balance Used', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey)),
                Text('AED ${registerComplaintListData?.walletBalance ?? '--'}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textgrey)),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Amount Payable', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey)),
                Text('AED ${registerComplaintListData?.totalOrderprice ?? '--'}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textgrey)),
              ],
            ),
          ],
        )
    );
  }

  showComplaintDialog(BuildContext context, RegisterComplaintListData? registerComplaintListData) {
    return showCustomBottomSheet(
        context,
        title: 'Select your Complaint',
        ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => const Divider(color: Colors.transparent),
            itemCount: registerComplaintListData!.complaintList!.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  selectedValue = registerComplaintListData.complaintList?[index].complaintType;
                  selectedValueId = registerComplaintListData.complaintList?[index].complaintId;
                  Navigator.pop(context, selectedValue);
                });
              } ,
              child: Text(registerComplaintListData.complaintList?[index].complaintType ?? '--', textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w600)),
            ))

    );
  }

  String formatDateYear(DateTime? dateTime) {
    final format = DateFormat('dd-MM-yyyy');
    return format.format(dateTime!);
  }

}

