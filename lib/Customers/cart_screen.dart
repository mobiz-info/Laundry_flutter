import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Customers/personal.dart';
import 'package:golden_falcon/Customers/thank_you_screen.dart';
import 'package:intl/intl.dart';
import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Models/CustomerModel/cart_list_model.dart';
import '../Models/CustomerModel/get_delivery_address_model.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../Utils/common.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';

class CartScreen extends StatefulWidget {
  final String orderId;

  const CartScreen({Key? key, required this.orderId}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  bool isChecked = false;
  List<int> counter = [];
  List<String> priceValue = [];
  late CartListData? data;
  String customerId = '';
  final CustomerRepository customerRepository = CustomerRepository();
  final TextEditingController paymentListController = TextEditingController();
  var paymentResponse;
  bool isExpanded = false;
  String selectedOption = 'Cash on delivery';
  var selectedWallet;
  String? selectedValue = '';
  var deliveryAdd;

  void incrementCounter(int index) {
    setState(() {
      int currentQuantity = int.parse(data!.cart![index].quantity.toString());
      currentQuantity++;
      data!.cart![index].quantity = currentQuantity.toString();
    });
  }

  void decrementCounter(int index) {
    setState(() {
      int currentQuantity = int.parse(data!.cart![index].quantity.toString());
      if (currentQuantity > 1) {
        currentQuantity--;
        data!.cart![index].quantity = currentQuantity.toString();
      }
    });
  }

  List<String> offersName = ["Promo Code", "Ramadan Code", "Christmas Code"];

  List<String> offersAmount = ["20", "10", "30"];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
          ..add(GetCartListEvent(authData.user_token!, widget.orderId)),
        child: Scaffold(
          backgroundColor: BgGrey,
          appBar: ScreenAppbar(
            text: 'My Bag',
            svgNeed: true,
            imagepath: "Assets/Images/bag_icon.svg",
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: BlocBuilder<CustomerBloc, CustomerState>(
                builder: (context, state) {
                  if (state is CartListFetching) {
                    return Container(color: Colors.transparent,
                        child: const Center(child: CircularProgressIndicator(
                            color: primaryColor,
                            backgroundColor: Colors.transparent)));
                  }
                  else if (state is CartListFetched) {
                    data = state.cartListData;
                    customerId = state.cartListData!.cart![0].order!.customer!.customerId.toString();
                    deliveryAdd = deliveryAdd ?? state.deliveryAddress;
                    return state.cartListData?.cart?.isEmpty == true ?
                    const Center(
                        child: Text('No Data Found', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))
                    ) : ListView(
                      children: [
                        RichText(
                          text: TextSpan(text: 'Deliver to : ', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey),
                            children: <TextSpan>[TextSpan(
                                text: '${deliveryAdd?["name"].toString()}, '
                                    '${deliveryAdd?["building_name"].toString()}, '
                                    '${deliveryAdd?["building_no"].toString()}, '
                                    '${deliveryAdd?["floor_number"].toString()}, '
                                    '${deliveryAdd?["flat_number"].toString()}, '
                                    '${deliveryAdd?["mobile"].toString()}',
                                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey, height: 1.5)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 34,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              showChangeAddressDialog(context, state.cartListData!, selectedValue.toString());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              surfaceTintColor: Colors.white,
                              elevation: 0,
                              side: const BorderSide(width: 1.0, color: primaryColor),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text('CHANGE DELIVERY ADDRESS', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Container(
                          height: 78, width: 170,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: primaryColor),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Pick-up Time', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey)),
                              const SizedBox(height: 6),
                              Text(state.cartListData?.cart?.first.order?.pickupTime.toString() ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: primaryColor)),
                              // Text(formatDateYear(
                              //   state.cartListData?.cart?.first.order?.pickupDate != null
                              //       ? DateTime.parse(state.cartListData!.cart!.first.order!.pickupDate.toString())
                              //       : DateTime.now(),
                              // ), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: primaryColor)),
                              Text(state.cartListData?.cart?.first.order?.pickupDate ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: primaryColor)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Order Type', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey)),
                            Text(state.cartListData?.cart?.first.order?.orderType ?? '--', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: primaryColor)),
                          ],
                        ),
                        const SizedBox(height: 18),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Service Type', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey)),
                            Text(state.cartListData?.cart?.first.itemService?.category?.serviceMaster?.categoryName ?? '--',
                                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: primaryColor)),
                          ],
                        ),
                        const SizedBox(height: 18),
                        const Text('Items in your bag', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textgrey)),
                        const SizedBox(height: 12),
                        ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.cartListData?.cart?.length,
                            itemBuilder: (BuildContext context, int index) {
                              counter.add(1);
                              priceValue.add(state.cartListData!.cart!.first.amount.toString());
                              return Padding(padding: const EdgeInsets.symmetric(vertical: 6),
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                        child: Row(
                                          children: [
                                            Image.network(baseUrl + (state.cartListData!.cart?[index].itemService?.item?.itemImage ?? '--'), height: 119, width: 111),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(state.cartListData!.cart?[index].itemService?.item?.itemName ?? '--', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textgrey)),
                                                  const SizedBox(height: 6),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      const Text('No of Items', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey)),
                                                      const SizedBox(width: 16),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              decrementCounter(index);
                                                              customerRepository.getCartItemsIncreDecre(
                                                                  token: authData.user_token!,
                                                                  orderId: widget.orderId,
                                                                  cartId: data?.cart?[index].cartId,
                                                                  priceListId: data!.cart![index].priceList.toString(),
                                                                  itemServiceId: data!.cart![index].itemService!.itemSerId.toString(),
                                                                  quantity: data!.cart![index].quantity.toString()).then((value) {
                                                                    context.read<CustomerBloc>().add(GetCartListEvent(authData.user_token!, widget.orderId));
                                                                    setState(() {
                                                                      priceValue[index] = '${value.data?.amount}';
                                                                    });
                                                                  });
                                                              print('decrement $decrementCounter');
                                                            },
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors.white,
                                                                  borderRadius: BorderRadius.circular(6),
                                                                  border: Border.all(color: incDecBorderColor, width: 1.8)
                                                              ),
                                                              child: const Center(child: Icon(Icons.remove, color: primaryColor, size: 18)),
                                                            ),
                                                          ),
                                                          const SizedBox(width: 12),
                                                          Text(data!.cart![index].quantity ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey)),
                                                          const SizedBox(width: 12),
                                                          InkWell(
                                                            onTap: () {
                                                              incrementCounter(index);
                                                              customerRepository.getCartItemsIncreDecre(
                                                                  token: authData.user_token!,
                                                                  orderId: widget.orderId,
                                                                  cartId: data?.cart?[index].cartId,
                                                                  priceListId: data!.cart![index].priceList.toString(),
                                                                  itemServiceId: data!.cart![index].itemService!.itemSerId.toString(),
                                                                  quantity: data!.cart![index].quantity.toString()).then((value) {
                                                                    context.read<CustomerBloc>().add(GetCartListEvent(authData.user_token!, widget.orderId));
                                                                    setState(() {
                                                                      priceValue[index] = '${value.data?.amount}';
                                                                    });
                                                                  });
                                                              print('increment $counter');
                                                            },
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors.white,
                                                                  borderRadius: BorderRadius.circular(6),
                                                                  border: Border.all(color: incDecBorderColor, width: 1.8)
                                                              ),
                                                              child: const Center(
                                                                  child: Icon(Icons.add, color: primaryColor, size: 18,
                                                                  )),
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(height: 6),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      const Text('Rate', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey)),
                                                      priceValue[index] != null
                                                          ? Text(
                                                          'AED ${priceValue[index]}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: textgrey))
                                                          : Text('AED ${state.cartListData?.cart?.first.amount ?? '--'}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: textgrey)),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 8),
                                                  SizedBox(
                                                    height: 32,
                                                    width: double.infinity,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        customerRepository.getDeletionData(token: authData.user_token!,
                                                            cartId: state.cartListData!.cart!.first.cartId.toString()).then((value) {
                                                              context.read<CustomerBloc>().add(GetCartListEvent(authData.user_token!, widget.orderId));});
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: Colors.white,
                                                        surfaceTintColor: Colors.white,
                                                        elevation: 0,
                                                        side: const BorderSide(width: 1.0, color: primaryColor),
                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2),
                                                        ),
                                                      ),
                                                      child: const Text('REMOVE', style: TextStyle(fontSize: 12, color: primaryColor, fontWeight: FontWeight.w600),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                    )
                                ),
                              );
                            }
                        ),
                        const SizedBox(height: 18),
                        // const Row(
                        //   children: [
                        //     Text('Apply PromoCode', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: textgrey)),
                        //     SizedBox(width: 6),
                        //     Text('(Select only one)', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: lightGreyText)),
                        //   ],
                        // ),
                        // const SizedBox(height: 18),
                        // SizedBox(
                        //   height: 148,
                        //   child: ListView.builder(
                        //       scrollDirection: Axis.horizontal,
                        //       shrinkWrap: true,
                        //       itemCount: offersName.length,
                        //       itemBuilder: (BuildContext context, int index) {
                        //         return Padding(
                        //           padding: const EdgeInsets.only(right: 18),
                        //           child: Container(
                        //               height: 168, width: 132,
                        //               decoration: BoxDecoration(
                        //                 color: primaryColor,
                        //                 borderRadius: BorderRadius.circular(16),
                        //               ),
                        //               child: Column(
                        //                 crossAxisAlignment: CrossAxisAlignment.center,
                        //                 children: [
                        //                   const SizedBox(height: 12),
                        //                   Expanded(
                        //                     child: Padding(
                        //                       padding: const EdgeInsets.symmetric(horizontal: 12),
                        //                       child: Wrap(
                        //                         children: [
                        //                           Text(offersName[index], style: const TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w600, height: 1.2),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),
                        //                   ),
                        //                   Text(offersAmount[index], style: const TextStyle(fontSize: 54, color: Colors.white, fontWeight: FontWeight.w600),),
                        //                   const MySeparator(color: Colors.white),
                        //                   const SizedBox(height: 6),
                        //                   const Text('Redeem Now', style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w600),
                        //                   ),
                        //                   const SizedBox(height: 12),
                        //                 ],
                        //               )
                        //           ),
                        //         );
                        //       }
                        //   ),
                        // ),
                        // const SizedBox(height: 24),
                        // SizedBox(
                        //   height: 47,
                        //   width: double.infinity,
                        //   child: ElevatedButton(
                        //     onPressed: () {},
                        //     style: ElevatedButton.styleFrom(
                        //       backgroundColor: Colors.white,
                        //       surfaceTintColor: Colors.white,
                        //       elevation: 0,
                        //       side: const BorderSide(width: 1.0, color: primaryColor,),
                        //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        //     ),
                        //     child: const Text('Apply Coupon', style: TextStyle(fontSize: 13, color: textgrey, fontWeight: FontWeight.w400),
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(height: 22),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Net Taxable value', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey)),
                            Text('AED ${state.cartListData?.cart?.first.order?.netTaxable}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textgrey)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Vat', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey)),
                            Text('AED ${state.cartListData?.cart?.first.order?.vat}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textgrey)),
                          ],
                        ),
                        const SizedBox(height: 22),
                        BlocProvider(
                          create: (context) => CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
                            ..add(GetCartPaymentListEvent(authData.user_token.toString())),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isExpanded = !isExpanded;
                                  });
                                },
                                child: Container(
                                  height: 46,
                                  width: double.infinity,
                                  //padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: primaryColor),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 18),
                                        child: Text(selectedOption, style: const TextStyle(fontSize: 13, color: textgrey)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: Icon(isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                                          size: 38, color: primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                width: double.infinity,
                                height: isExpanded ? 120 : 0,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: primaryColor),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: BlocBuilder<CustomerBloc, CustomerState>(
                                    builder: (context, state) {
                                      if (state is CartPaymentListFetching) {
                                        return const Center(child: CircularProgressIndicator(color: primaryColor));
                                      } else if (state is CartPaymentListFetched) {
                                        final data = state.cartPaymentList;
                                        return ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemCount: data?.length,
                                          itemBuilder: (BuildContext context, int index) =>
                                              ListTile(
                                                title: Text('${data?[index].paymentMethod}', style: const TextStyle(fontSize: 12, color: textgrey)),
                                                onTap: () {
                                                  setState(() {
                                                    selectedOption = '${data?[index].paymentMethod}';
                                                    isExpanded = false;
                                                  });
                                                  if(selectedOption == 'Wallet') {
                                                    customerRepository.getCartWalletData(token: authData.user_token!, customerId: customerId, orderId: widget.orderId).then((value) {
                                                      setState(() {
                                                        selectedWallet = value.walletBalance;
                                                      });
                                                    });
                                                  }
                                                },
                                              ),
                                        );
                                      } else {
                                        return const Center(child: Text('No Data'));
                                      }
                                    }
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 22),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Wallet Balance', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey)),
                            selectedOption == 'Wallet' ? Text('AED $selectedWallet', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textgrey))
                            : Text('AED ${state.cartListData?.walletBalance}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textgrey)),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total Payable', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey)),
                            Text('AED ${state.cartListData?.cart?.first.order?.totalAmount}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textgrey)),
                          ],
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                          width: double.infinity, height: 54,
                          child: ElevatedButton(
                            onPressed: () {
                              // if (selectedOption == 'Choose Payment method') {
                              //   snackBar(context, message: 'Please choose payment method');
                              // } else {
                                customerRepository.getPlaceOrderData(
                                    token: authData.user_token!,
                                    id: authData.user_id!,
                                    orderId: state.cartListData!.cart!.first.order!.orderId.toString(),
                                    discount: double.parse(state.cartListData!.cart!.first.order!.discount.toString()).toInt(),
                                    netTaxable: double.parse(state.cartListData!.cart!.first.order!.netTaxable.toString()).toInt(),
                                    vat: double.parse(state.cartListData!.cart!.first.order!.vat.toString()).toInt(),
                                    grandTotal: double.parse(state.cartListData!.cart!.first.order!.grantTotal.toString()).toInt(),
                                    collectMode: selectedOption,
                                    payedAmount: 0,
                                    customerAddress: selectedValue.toString());
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ThankYouScreen(
                                  orderId: widget.orderId,
                                  customerId: state.cartListData!.cart![0].order!.customer!.customerId.toString(),
                                  customerName: state.cartListData!.cart![0].order!.customer!.name.toString(),
                                )));
                              //}
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor, elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            child: const Text('PLACE ORDER', style: TextStyle(fontSize: 16.0, color: White, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  }
                  else if (state is CartListError) {
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
        )
    );
  }

  String formatDateYear(DateTime? dateTime) {
    final format = DateFormat('dd-MM-yyyy');
    return format.format(dateTime!);
  }

  showChangeAddressDialog(BuildContext context, CartListData listData, String callback) {
    BuildContext mainContext = context;
    return showCustomBottomSheet(
      context,
      title: 'Select Delivery Address',
      FutureBuilder<GetDeliveryAddressModel>(
        future: customerRepository.getDelvieryAddrData(token: authData.user_token!, customerId: customerId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(color: primaryColor);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.data == null || snapshot.data!.data!.isEmpty) {
            return const Text('No delivery address available');
          } else {
            return StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      separatorBuilder: (context, index) => const Divider(color: Colors.transparent),
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index) {
                        final address = snapshot.data!.data![index];
                        return InkWell(
                          onTap: () {
                            setState(() {
                              deliveryAdd = {"name" : address["name"], "building_name" : address["building_name_no"],
                                "building_no": '', "floor_number": address["floor_no"], "flat_number": address["flat_no_house_no"],
                                "mobile": address["person_incharge_mob"]};
                              selectedValue = address["pickup_address_id"].toString();
                            });
                            // setState(() {
                            //   selectedValue = address["pickup_address_id"].toString();
                            //   callback = selectedValue.toString();
                            // });
                          },
                          child: RadioListTile(
                            activeColor: primaryColor,
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                                '${address["name"]} ${address["building_name_no"]} ${address["floor_no"]} ${address["flat_no_house_no"]} ${address["person_incharge_mob"]}',
                                style: const TextStyle(fontSize: 13, color: textgrey)),
                            value: address["pickup_address_id"].toString(),
                            groupValue: selectedValue,
                            onChanged: (value) {
                              mainContext.read<CustomerBloc>().add(GetDeliveryAddrEvent(listData, address));
                              setState(() {
                                deliveryAdd = {"name" : address["name"], "building_name" : address["building_name_no"],
                                "building_no": '', "floor_number": address["floor_no"], "flat_number": address["flat_no_house_no"],
                                "mobile": address["person_incharge_mob"]};
                                selectedValue = value.toString();
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ],
                );
              }
            );
          }
        },
      ),
    );
  }
}

class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black}) : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 2.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
