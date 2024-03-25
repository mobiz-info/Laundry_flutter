import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_falcon/Customers/feedback_screen.dart';
import 'package:golden_falcon/Customers/order_detail.dart';
import 'package:golden_falcon/components/common_methods.dart';
import 'package:intl/intl.dart';
import '../Models/CustomerModel/order_status_model.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../src/Color.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus({Key? key}) : super(key: key);

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> with SingleTickerProviderStateMixin {

  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  final CustomerRepository customerRepository = CustomerRepository();
  List<OrderStatusData>? orderStatusData = [];
  String selectedEmojiText = '';
  bool isDataLoaded = false;

  void selectEmoji(String emojiText) {
    setState(() {
      selectedEmojiText = emojiText;
    });
  }

  bool statusText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BgGrey,
      appBar: ScreenAppbar(
        text: 'Our History',
        svgNeed: true,
        needAction: true,
        imagepath: "Assets/Images/order_status_img.svg",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      //width: 108,
                      height: 39,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: primaryColor),
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: InkWell(
                          onTap: () async {
                            final DateTime? fromDatePicked = await showDatePicker(
                                builder: (context, child) {
                                  return Theme(
                                      data: ThemeData().copyWith(
                                        colorScheme: const ColorScheme.light(
                                          primary: primaryColor,
                                          onPrimary: Colors.white,
                                          surface: Colors.white,
                                          onSurface: textgrey,
                                        ),
                                        dialogBackgroundColor:Colors.blue.shade50,
                                      ), child: child!);
                                },
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101));

                            if(fromDatePicked != null) {
                              String formattedDate = DateFormat('dd-MM-yyyy').format(fromDatePicked);
                              setState(() {
                                fromDateController.text = formattedDate;
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                          child: Align(alignment: Alignment.center, child: Text(
                              fromDateController.text.isNotEmpty
                                  ? fromDateController.text
                                  : 'From Date', textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: lightGreyText)))
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 39,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: primaryColor),
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: InkWell(
                          onTap: () async {
                            final DateTime? toDatePicked = await showDatePicker(
                                builder: (context, child) {
                                  return Theme(
                                      data: ThemeData().copyWith(
                                        colorScheme: const ColorScheme.light(
                                          primary: primaryColor,
                                          onPrimary: Colors.white,
                                          surface: Colors.white,
                                          onSurface: textgrey,
                                        ),
                                        dialogBackgroundColor:Colors.blue.shade50,
                                      ), child: child!);
                                },
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101));

                            if(toDatePicked != null) {
                              String formattedDate = DateFormat('dd-MM-yyyy').format(toDatePicked);
                              setState(() {
                                toDateController.text = formattedDate;
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                          child: Align(alignment: Alignment.center, child: Text(
                              toDateController.text.isNotEmpty
                                  ? toDateController.text
                                  : 'To Date', textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: lightGreyText)))
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (fromDateController.text.isEmpty) {
                          snackBar(context, message: 'Please choose From Date');
                        } else if (toDateController.text.isEmpty) {
                          snackBar(context, message: 'Please choose To Date');
                        } else {
                          customerRepository.getOrderStatusData(token: authData.user_token!, id: authData.user_id.toString(), fromDate: fromDateController.text, toDate: toDateController.text).then((value) {
                            setState(() {
                              orderStatusData = value.data;
                            });
                            if(value.status == false) {
                              snackBar(context, message: value.message.toString());
                            }
                          });
                        }
                      },
                      child: Container(
                        height: 39,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          border: Border.all(color: primaryColor),
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: const Align(alignment: Alignment.center, child: Text('LOAD', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white))),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ListView.builder(
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: orderStatusData?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              orderStatusData?[index].status == 'Confirmation Pending' ?
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: (orderStatusData?[index].status != null && orderStatusData?[index].status == "Delivered")
                                    ? SvgPicture.asset('Assets/Images/delivered_icon.svg')
                                    : SvgPicture.asset('Assets/Images/intransist_icon.svg'),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(orderStatusData?[index].status.toString() ?? '--', style: const TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w500)),
                                    Text(formatDateYear(orderStatusData != null ? DateTime.parse(orderStatusData![index].orderDate!) : null),
                                        style: const TextStyle(fontSize: 13.0, color: textgrey, fontWeight: FontWeight.w300)),
                                  ],
                                ),
                              )
                              : ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: (orderStatusData?[index].status != null && orderStatusData?[index].status == "Delivered")
                                      ? SvgPicture.asset('Assets/Images/delivered_icon.svg')
                                      : SvgPicture.asset('Assets/Images/intransist_icon.svg'),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(orderStatusData?[index].status.toString() ?? '--', style: const TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w500)),
                                    Text(formatDateYear(orderStatusData != null ? DateTime.parse(orderStatusData![index].orderDate!) : null),
                                        style: const TextStyle(fontSize: 13.0, color: textgrey, fontWeight: FontWeight.w300)),
                                  ],
                                ),
                                trailing: InkWell(
                                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                      OrderDetails(orderId: orderStatusData![index].orderId.toString(),
                                        orderStatus: orderStatusData![index].status.toString(),
                                        orderDate: formatDateYear(orderStatusData != null ? DateTime.parse(orderStatusData![index].orderDate!) : null),
                                      ))),
                                  child: Container(
                                    width: 28, height: 28,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: textgray.withOpacity(0.3), width: 1.6),
                                    ),
                                    child: Center(
                                        child: Icon(
                                          Icons.keyboard_arrow_right_outlined,
                                          color: textgray.withOpacity(0.6),
                                          size: 20,
                                        )),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text('Order number : ${orderStatusData?[index].orderNumber ?? '--'}', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w300)),
                              const SizedBox(height: 2),
                              Text('No. of items : ${orderStatusData?[index].quantity ?? '--'}', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w300)),
                              const SizedBox(height: 2),
                              Text('Delivery Date : ${orderStatusData?[index].deliveryDate ?? '--'}',
                                  style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w300)),
                              const SizedBox(height: 2),
                              (orderStatusData?[index].status != null && orderStatusData?[index].status == "Delivered")
                                ? Text('Amount Paid : ${orderStatusData?[index].totalAmount ?? '--'}', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w300))
                                : Text('Amount Payable: ${orderStatusData?[index].totalAmount ?? '--'}', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w300)),
                              (orderStatusData?[index].status != null && orderStatusData?[index].status == "Delivered")
                                  ? Padding(
                                    padding: const EdgeInsets.only(top: 18),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          for (int i = 0; i < 5; i++)
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackScreen(selectedEmojiText: getEmojiText(i), orderId: orderStatusData!.first.orderId.toString())));
                                              },
                                              //=> selectEmoji(getEmojiText(i)),
                                              child: Column(
                                                children: [
                                                  selectedEmojiText == getEmojiText(i) ?
                                                  CircleAvatar(
                                                    radius: 19, backgroundColor: greenColor,
                                                    child: CircleAvatar(radius: 18, backgroundColor: Colors.white,
                                                        child: SvgPicture.asset(getEmojiImage(i))),
                                                  )
                                                  : SvgPicture.asset(getEmojiImage(i)),
                                                  const SizedBox(height: 4),
                                                  Text(getEmojiText(i),
                                                    style: TextStyle(fontSize: 8, fontWeight: FontWeight.w500, color: selectedEmojiText == getEmojiText(i) ? greenColor : lightGreyText),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          // const SizedBox(width: 12),
                                          // InkWell(
                                          //     onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackScreen(selectedEmojiText: selectedEmojiText, orderId: orderStatusData![index].orderId.toString()))),
                                          //     child: const Text("Write a review", style: TextStyle(fontSize: 12, color: textgrey))),
                                        ],
                                      ),
                                  ) : Container()
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getEmojiImage(int index) {
    switch (index) {
      case 0:
        return "Assets/Images/excellent_emoji.svg";
      case 1:
        return "Assets/Images/good_emoji.svg";
      case 2:
        return "Assets/Images/average_emoji.svg";
      case 3:
        return "Assets/Images/poor_emoji.svg";
      case 4:
        return "Assets/Images/very_poor_emoji.svg";
      default:
        return "";
    }
  }

  String getEmojiText(int index) {
    switch (index) {
      case 0:
        return "Excellent";
      case 1:
        return "Good";
      case 2:
        return "Average";
      case 3:
        return "Poor";
      case 4:
        return "Very Poor";
      default:
        return "";
    }
  }

  String formatDateYear(DateTime? dateTime) {
    final format = DateFormat('dd-MM-yyyy');
    return format.format(dateTime!);
  }

}

