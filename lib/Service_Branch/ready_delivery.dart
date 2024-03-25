import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BLoCs/ServiceBranchBloc/service_branch_bloc.dart';
import '../Models/ServiceBranchModel/ready_delivery_search_model.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/ServiceBranchRepo/service_branch_repo.dart';
import '../src/Color.dart';

class ReadyDelivery extends StatefulWidget {
  const ReadyDelivery({super.key});

  @override
  State<ReadyDelivery> createState() => _ReadyDeliveryState();
}

class _ReadyDeliveryState extends State<ReadyDelivery> {
  final ServiceBranchRepository serviceBranchRepository = ServiceBranchRepository();
  final TextEditingController searchReadyDeliveryController = TextEditingController();
  var data;

  @override
  void dispose() {
    searchReadyDeliveryController.dispose();
    super.dispose();
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
        title: const Text('Ready for Delivery', style: TextStyle(fontSize: 16, color: primaryColor, fontWeight: FontWeight.w500)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: BlocProvider(
              create: (context) =>
              ServiceBranchBloc(RepositoryProvider.of<ServiceBranchRepository>(context))
                ..add(GetReadyDeliveryEvent(authData.user_token.toString())),
            child: BlocBuilder<ServiceBranchBloc, ServiceBranchState>(
              builder: (context, state) {
                if (state is ReadyDeliveryFetching) {
                  return Container(color: Colors.transparent,
                      child: const Center(child: CircularProgressIndicator(
                          color: primaryColor,
                          backgroundColor: Colors.transparent)));
                } else if(state is ReadyDeliveryFetched) {
                  if (searchReadyDeliveryController.text.isEmpty) {
                    data = state.readyDeliveryData;
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: searchReadyDeliveryController,
                        onChanged: (value) async {
                          searchReadyDeliveryController.text = value;
                          ReadyDeliverySearchModel searchResult = await serviceBranchRepository.getSearchReadyDeliData(
                              token: authData.user_token!,
                              orderNum: searchReadyDeliveryController.text);
                          if (searchResult.data != null) {
                            data = searchResult.data;
                          }
                          setState(() {});
                        },
                        style: const TextStyle(color: textgrey, fontSize: 13, fontWeight: FontWeight.w400),
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Search a order here',
                          hintStyle: TextStyle(color: lightGreyText, fontSize: 13, fontWeight: FontWeight.w400),
                          prefixIcon: Icon(Icons.search_outlined, color: lightGreyText, size: 22),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: formBorderColor)),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: formBorderColor)),
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text('${data?.readyForDeliveryCount ?? '--'} ${data?.readyForDeliveryCount == 1 ? 'order' : 'orders'} ready for delivery',
                          style: const TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w300)),
                      const SizedBox(height: 8),
                      ListView.builder(
                          physics: const ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: data?.readyForDelivery?.length,
                          itemBuilder: (itemBuilder, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Order number :', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                              SizedBox(height: 8),
                                              Text('Order type :', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                              SizedBox(height: 8),
                                              Text('Staff :', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                              SizedBox(height: 8),
                                              Text('Delivery type :', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                              SizedBox(height: 8),
                                              Text('Number of items :', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                              SizedBox(height: 8),
                                              Text('Client :', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                              SizedBox(height: 8),
                                              Text('Invoice Number :', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                              SizedBox(height: 8),
                                              Text('Amount :', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                            ],
                                          ),
                                          const SizedBox(width: 18),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(data!.readyForDelivery?[index].orderNumber?.toUpperCase() ?? '--', style: const TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                              const SizedBox(height: 8),
                                              Container(
                                                  width: 80,
                                                  decoration: data?.readyForDelivery?[index].orderType == 'Normal' ?
                                                  BoxDecoration(
                                                    color: Colors.white70,
                                                    border: Border.all(color: primaryColor),
                                                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                                                  ) : data?.readyForDelivery?[index].orderType == 'Express' ?
                                                  BoxDecoration(
                                                    color: lightOrange,
                                                    border: Border.all(color: lightOrange),
                                                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                                                  ) :
                                                  BoxDecoration(
                                                    color: darkOrange,
                                                    border: Border.all(color: darkOrange),
                                                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                                                  ),
                                                  child: Center(child: Text(data.readyForDelivery?[index].orderType ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey)))),
                                              const SizedBox(height: 8),
                                              Text(data.readyForDelivery?[index].staffname ?? '--', style: const TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                              const SizedBox(height: 8),
                                              Text(data.readyForDelivery?[index].pickupMode ?? '--', style: const TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                              const SizedBox(height: 8),
                                              Text(data.readyForDelivery?[index].noOfItems.toString() ?? '--', style: const TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                              const SizedBox(height: 8),
                                              Text(data.readyForDelivery?[index].clientName ?? '--', style: const TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                              const SizedBox(height: 8),
                                              Text(data.readyForDelivery?[index].invoiceNumber.toString() ?? '--', style: const TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                              const SizedBox(height: 8),
                                              Text('AED ${data.readyForDelivery?[index].totalAmount ?? '--'}', style: const TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                      )
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
      ),
    );
  }
}

