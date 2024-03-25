import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/ServiceBranchBloc/service_branch_bloc.dart';
import 'package:golden_falcon/Repositories/ServiceBranchRepo/service_branch_repo.dart';
import 'package:golden_falcon/Service_Branch/service_dashboad.dart';
import 'package:intl/intl.dart';

import '../Repositories/AuthRepo/auth_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../src/Color.dart';

class ServiceThankYou extends StatefulWidget {
  final String orderId;
  final String customerId;
  final String customerName;


  const ServiceThankYou({Key? key,  required this.orderId, required this.customerId, required this.customerName}) : super(key: key);

  @override
  State<ServiceThankYou> createState() => _ServiceThankYouState();
}

class _ServiceThankYouState extends State<ServiceThankYou> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        ServiceBranchBloc(RepositoryProvider.of<ServiceBranchRepository>(context))
          ..add(GetSerThankYouEvent(authData.user_token!, widget.orderId, widget.customerId)),
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              surfaceTintColor: Colors.white,
              elevation: 0,
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(side: BorderSide(width: 1, color: primaryColor),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              ),
              centerTitle: true,
              title: const Text('Order Confirmed', style: TextStyle(fontSize: 16, color: primaryColor, fontWeight: FontWeight.w500)),
            ),
            body: SingleChildScrollView(
              child: BlocBuilder<ServiceBranchBloc, ServiceBranchState>(
                  builder: (context, state) {
                    if (state is SerThankYouFetching) {
                      return Container(color: Colors.transparent, child: const Center(child: CircularProgressIndicator(color: primaryColor, backgroundColor: Colors.transparent)));
                    }
                    else if (state is SerThankYouFetched) {
                      final data = state.serThankYouData;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: BgGrey,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: primaryColor,
                                    radius: 25,
                                    child: Icon(Icons.check_rounded, color: Colors.white, weight: 6, size: 28),
                                  ),
                                  const SizedBox(height: 16),
                                  Text('Hai ${widget.customerName}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey)),
                                  const SizedBox(height: 18),
                                  const Text('Thank you for placing the Order', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: textgrey)),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 24),
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Order No', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey)),
                                        SizedBox(height: 12),
                                        Text('Delivery Date', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey)),
                                        SizedBox(height: 12),
                                        Text('Delivery Time', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey)),
                                        SizedBox(height: 12),
                                        Text('Amount', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey)),
                                      ],
                                    ),
                                    const SizedBox(width: 24),
                                    const Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(':', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey)),
                                        SizedBox(height: 12),
                                        Text(':', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey)),
                                        SizedBox(height: 12),
                                        Text(':', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey)),
                                        SizedBox(height: 12),
                                        Text(':', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey)),
                                      ],
                                    ),
                                    const SizedBox(width: 24),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(data?.orderNumber?.toUpperCase() ?? '--', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey)),
                                        const SizedBox(height: 12),
                                        Text(data?.deliveryDate ??  '--', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey)),
                                        const SizedBox(height: 12),
                                        Text(data?.deliveryTime ?? '--', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey)),
                                        const SizedBox(height: 12),
                                        Text('AED ${data?.totalAmount ?? '--'}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey)),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 38),
                                SizedBox(
                                  height: 48, width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                          const ServiceDashboard()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white, surfaceTintColor: Colors.white, elevation: 0,
                                      side: const BorderSide(width: 1.6, color: primaryColor),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    ),
                                    child: const Text('BACK TO HOME', style: TextStyle(fontSize: 16, color: textgrey, fontWeight: FontWeight.w600)),
                                  ),
                                ),
                                const SizedBox(height: 28),
                              ],
                            ),
                          )
                        ],
                      );
                    }
                    else {
                      return Container(color: BgGrey, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
                    }
                  }
              ),
            )
        )
    );
  }

  String formatDateYear(DateTime? dateTime) {
    final format = DateFormat('dd-MM-yyyy');
    return format.format(dateTime!);
  }

}

