import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Service_Branch/service_thank_you.dart';
import 'package:intl/intl.dart';

import '../BLoCs/ServiceBranchBloc/service_branch_bloc.dart';
import '../Models/ServiceBranchModel/ser_cart_list_model.dart';
import '../Models/ServiceBranchModel/ser_delivery_address_model.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/ServiceBranchRepo/service_branch_repo.dart';
import '../Utils/common.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';

class ServiceCart extends StatefulWidget {
  final String orderId;

  const ServiceCart({Key? key, required this.orderId})
      : super(key: key);

  @override
  State<ServiceCart> createState() => _ServiceCartState();
}

class _ServiceCartState extends State<ServiceCart> {

  List<int> counter = [];
  List<String> priceValue = [];
  late SerCartListData? data;
  String customerId = '';
  final ServiceBranchRepository serviceBranchRepository = ServiceBranchRepository();
  String? selectedValue = '';
  bool isExpanded = false;
  var selectedWallet;
  String selectedOption = 'Choose Payment method';
  final TextEditingController collectedAmountController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BgGrey,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {Navigator.pop(context);},
            child: const Icon(Icons.arrow_back, color: primaryColor, size: 18)),
        surfaceTintColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(side: BorderSide(width: 1, color: primaryColor),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
        centerTitle: true,
        title: const Text('Cart', style: TextStyle(fontSize: 16, color: primaryColor, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: BlocProvider(
            create: (context) =>
            ServiceBranchBloc(RepositoryProvider.of<ServiceBranchRepository>(context))
              ..add(GetSerCartListEvent(authData.user_token.toString(), widget.orderId)),
          child: BlocBuilder<ServiceBranchBloc, ServiceBranchState>(
              builder: (context, state) {
                if (state is ServiceCartListFetching) {
                  return Container(color: Colors.transparent,
                      child: const Center(child: CircularProgressIndicator(
                          color: primaryColor, backgroundColor: Colors.transparent)));
                } else if (state is ServiceCartListFetched) {
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
                            const Text('Delivery Time', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey)),
                            const SizedBox(height: 6),
                            Text(state.cartListData?.cart?.first.order?.deliveryTime.toString() ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: primaryColor)),
                            // Text(formatDateYear(
                            //   state.cartListData?.cart?.first.order?.deliveryDate != null
                            //       ? DateTime.parse(state.cartListData!.cart!.first.order!.deliveryDate.toString())
                            //       : DateTime.now(),
                            // ),
                            //     style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: primaryColor)),
                            Text(state.cartListData?.cart?.first.order?.deliveryDate ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: primaryColor)),
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
                                                            serviceBranchRepository.getCartIncDec(
                                                                token: authData.user_token!,
                                                                orderId: widget.orderId,
                                                                cartId: data!.cart![index].cartId.toString(),
                                                                priceListId: data!.cart![index].priceList.toString(),
                                                                itemServiceId: data!.cart![index].itemService!.itemSerId.toString(),
                                                                quantity: data!.cart![index].quantity.toString()).then((value) {
                                                              context.read<ServiceBranchBloc>().add(GetSerCartListEvent(authData.user_token!, widget.orderId));
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
                                                            child: const Center(
                                                                child: Icon(Icons.remove, color: primaryColor, size: 18,
                                                                )),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 16),
                                                        Text(data!.cart![index].quantity ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey)),
                                                        const SizedBox(width: 12),
                                                        InkWell(
                                                          onTap: () {
                                                            incrementCounter(index);
                                                            serviceBranchRepository.getCartIncDec(
                                                                token: authData.user_token!,
                                                                orderId: widget.orderId,
                                                                cartId: data!.cart![index].cartId.toString(),
                                                                priceListId: data!.cart![index].priceList.toString(),
                                                                itemServiceId: data!.cart![index].itemService!.itemSerId.toString(),
                                                                quantity: data!.cart![index].quantity.toString()).then((value) {
                                                              context.read<ServiceBranchBloc>().add(GetSerCartListEvent(authData.user_token!, widget.orderId));
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
                                                        : Text('AED ${state.cartListData?.cart?[index].amount ?? '--'}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: textgrey)),
                                                  ],
                                                ),
                                                const SizedBox(height: 8),
                                                SizedBox(
                                                  height: 32,
                                                  width: double.infinity,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      serviceBranchRepository.getDeleteData(token: authData.user_token!,
                                                          cartId: state.cartListData!.cart!.first.cartId.toString()).then((value) {
                                                        context.read<ServiceBranchBloc>().add(GetCartDeleteEvent(authData.user_token!, widget.orderId));});
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
                        create: (context) => ServiceBranchBloc(RepositoryProvider.of<ServiceBranchRepository>(context))
                          ..add(GetPaymentListEvent(authData.user_token.toString())),
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
                                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
                              child: BlocBuilder<ServiceBranchBloc, ServiceBranchState>(
                                  builder: (context, state) {
                                    if (state is SerPaymentListFetching) {
                                      return const Center(child: CircularProgressIndicator(color: primaryColor));
                                    } else if (state is SerPaymentListFetched) {
                                      final data = state.paymentList;
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
                                                  serviceBranchRepository.getCartWalletBalData(token: authData.user_token!, customerId: customerId, orderId: widget.orderId).then((value) {
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
                      selectedOption == 'Cash on delivery' ?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Collected Amount', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey)),
                          const SizedBox(width: 82),
                          Expanded(
                            child: SizedBox(
                              height: 52,
                              child: TextFormField(
                                style: const TextStyle(color: textgrey, fontSize: 13, fontWeight: FontWeight.w400),
                                controller: collectedAmountController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffix: const Text('AED', textAlign: TextAlign.center),
                                  suffixStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: textgrey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                    borderSide: const BorderSide(
                                      color: primaryColor,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                    borderSide: const BorderSide(
                                      color: primaryColor,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ) : Container(),
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
                            if (selectedOption == 'Choose Payment method') {
                              snackBar(context, message: 'Please choose payment method');
                            } else {
                              serviceBranchRepository.getSerPlaceOrderData(
                                  token: authData.user_token!,
                                  customerId: state.cartListData!.cart!.first.order!.customer!.customerId.toString(),
                                  orderId: state.cartListData!.cart!.first.order!.orderId.toString(),
                                  discount: double.parse(state.cartListData!.cart!.first.order!.discount.toString()).toInt(),
                                  netTaxable: double.parse(state.cartListData!.cart!.first.order!.netTaxable.toString()).toInt(),
                                  vat: double.parse(state.cartListData!.cart!.first.order!.vat.toString()).toInt(),
                                  grandTotal: double.parse(state.cartListData!.cart!.first.order!.grantTotal.toString()).toInt(),
                                  collectMode: selectedOption,
                                  payedAmount: selectedOption == 'Cash on delivery' ? int.parse(collectedAmountController.text) : 0,
                                  customerAddress: selectedValue.toString());
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ServiceThankYou(
                                      orderId: widget.orderId,
                                      customerId: state.cartListData!.cart![0].order!.customer!.customerId.toString(),
                                      customerName: state.cartListData!.cart![0].order!.customer!.name.toString(),
                                    )));
                            }
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
                else {
                  return Container(color: BgGrey, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
                }
              }
          ),
        ),
      ),
    );
  }

  String formatDateYear(DateTime? dateTime) {
    final format = DateFormat('dd-MM-yyyy');
    return format.format(dateTime!);
  }

  showChangeAddressDialog(BuildContext context, SerCartListData? listData, String callback) {
    BuildContext mainContext = context;
    return showCustomBottomSheet(
      context,
      title: 'Select Delivery Address',
      FutureBuilder<SerDeliveryAddressModel>(
        future: serviceBranchRepository.getDeliveryAddressData(token: authData.user_token!, customerId: customerId),
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
                                //callback = selectedValue.toString();
                              });
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
                                mainContext.read<ServiceBranchBloc>().add(GetDeliveryAddressEvent(listData, address));
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
