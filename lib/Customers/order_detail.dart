import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_falcon/Customers/personal.dart';
import 'package:intl/intl.dart';

import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Models/CustomerModel/order_details_model.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../Utils/common.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';
import 'feedback_screen.dart';

class OrderDetails extends StatefulWidget {
  final String orderId;
  final String orderStatus;
  final String orderDate;

  const OrderDetails({Key? key, required this.orderId, required this.orderStatus, required this.orderDate}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {

  String selectedEmojiText = '';

  void selectEmoji(String emojiText) {
    setState(() {
      selectedEmojiText = emojiText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
        ..add(GetOrderDetailsEvent(authData.user_token!, widget.orderId)),
      child: Scaffold(
        backgroundColor: BgGrey,
        appBar: ScreenAppbar(
          text: 'Our Details',
          svgNeed: true,
          needAction: true,
          imagepath: "Assets/Images/order_status_img.svg",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: BlocBuilder<CustomerBloc, CustomerState>(
              builder: (context, state) {
                if (state is OrderDetailsFetching) {
                  return Container(color: Colors.transparent,
                    child: const Center(child: CircularProgressIndicator(
                        color: primaryColor,
                        backgroundColor: Colors.transparent)));
                } else if (state is OrderDetailsFetched) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                leading: (widget.orderStatus == "Delivered")
                                    ? SvgPicture.asset('Assets/Images/delivered_icon.svg')
                                    : SvgPicture.asset('Assets/Images/intransist_icon.svg'),
                                contentPadding: EdgeInsets.zero,
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.orderStatus, style: const TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w500)),
                                    Text('Ordered on ${widget.orderDate}', style: const TextStyle(fontSize: 13.0, color: textgrey, fontWeight: FontWeight.w300)),
                                  ],
                                ),
                              ),
                            ),
                            ListView.builder(
                                physics: const ScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: state.orderDetailsData?.cart?.length,
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
                                          Image.network(baseUrl+state.orderDetailsData!.cart![index].itemService!.item!.itemImage.toString(), height: 64, width: 61),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(state.orderDetailsData!.cart![index].itemService!.item!.itemName ?? '--', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textgrey)),
                                                const SizedBox(height: 2),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    const Text('No of Items', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey)),
                                                    Text(state.orderDetailsData!.cart![index].quantity ?? '--', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey)),
                                                  ],
                                                ),
                                                const SizedBox(height: 2),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    const Text('Rate', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey)),
                                                    Text('AED ${state.orderDetailsData!.cart![index].amount}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey)),
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
                            (widget.orderStatus == "Delivered")
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        for (int i = 0; i < 5; i++)
                                          GestureDetector(
                                            onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackScreen(selectedEmojiText: getEmojiText(i), orderId: state.orderDetailsData!.cart!.first.order!.orderId.toString())));
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
                                        const SizedBox(width: 12),
                                        // InkWell(
                                        //     onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackScreen(selectedEmojiText: selectedEmojiText, orderId: state.orderDetailsData!.cart!.first.order!.orderId.toString()))),
                                        //     child: const Text("Write a review", style: TextStyle(fontSize: 12, color: textgrey))),
                                      ],
                                    ),
                            ) : Container()
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Column(
                          children: [
                            const Text('Delivery Time', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey)),
                            Text(state.orderDetailsData!.cart?.first.order?.deliveryDate.toString() ?? '--', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: primaryColor)),
                            Text(state.orderDetailsData!.cart?.first.order?.deliveryTime.toString() ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: primaryColor)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Text('Delivery address', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textgrey)),
                      const SizedBox(height: 8),
                      Text('${state.orderDetailsData?.deliveryAddress?.first.name ?? '--'},'
                          '${state.orderDetailsData?.deliveryAddress?.first.buildingNameNo ?? '--'},'
                          '${state.orderDetailsData?.deliveryAddress?.first.floorNo ?? '--'},'
                          '${state.orderDetailsData?.deliveryAddress?.first.flatNoHouseNo ?? '--'}',
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: textgrey)),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total order price', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textgrey)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('AED ${state.orderDetailsData?.cart?.first.amount ?? '--'}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textgrey)),
                              InkWell(
                                onTap: () {
                                  showPaymentInfoDialog(context, state.orderDetailsData);
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
                          const Text('Payment method', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textgrey)),
                          Text(state.orderDetailsData?.paymentMethod ?? '--', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textgrey)),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Service type', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textgrey)),
                          Text(state.orderDetailsData?.cart?.first.order?.orderType ?? '--', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textgrey)),
                        ],
                      ),
                    ],
                  );
                }
                else if (state is OrderDetailsError) {
                  snackBar(context, message: state.message.toString());
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

  showPaymentInfoDialog(BuildContext context, OrderDetailsData? orderDetailsData) {
    return showCustomBottomSheet(
        context,
        title: 'Payment Information',
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Net Taxable value', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textgrey)),
                Text('AED ${orderDetailsData?.netTaxable ?? '--'}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textgrey)),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Vat', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textgrey)),
                Text('AED ${orderDetailsData?.vat ?? '--'}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textgrey)),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Wallet Balance Used', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textgrey)),
                Text('AED ${orderDetailsData?.walletBalanceUsed ?? '--'}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textgrey)),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Amount Payable', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textgrey)),
                Text('AED ${orderDetailsData?.amountPayble ?? '--'}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textgrey)),
              ],
            ),
          ],
        )
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

