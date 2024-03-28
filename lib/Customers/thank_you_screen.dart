import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Customers/Customer_Home.dart';
import 'package:intl/intl.dart';

import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';

class ThankYouScreen extends StatefulWidget {
  final String orderId;
  final String customerId;
  final String customerName;

  const ThankYouScreen({Key? key, required this.orderId, required this.customerId, required this.customerName}) : super(key: key);

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
          ..add(GetThankYouEvent(authData.user_token!, widget.orderId, widget.customerId)),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: ScreenAppbar(
          text: '',
          svgNeed: true,
          imagepath: "Assets/Images/confirmed_icon.svg",
          needAction: false,
          backArrow: false,
          ),
          body: SingleChildScrollView(
            child: BlocBuilder<CustomerBloc, CustomerState>(
              builder: (context, state) {
                if (state is ThankYouFetching) {
                  return Container(color: Colors.transparent, child: const Center(child: CircularProgressIndicator(color: primaryColor, backgroundColor: Colors.transparent)));
                }
                else if (state is ThankYouFetched) {
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
                              const SizedBox(height: 18),
                              const Text('Our Picker will contact you shortly', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: textgrey)),
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
                                    Text('PickUp Date', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey)),
                                    SizedBox(height: 12),
                                    Text('PickUp Time', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey)),
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
                                    Text(state.thankYouData?.orderNumber?.toUpperCase() ?? '--', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey)),
                                    const SizedBox(height: 12),
                                    Text(state.thankYouData?.pickupDate.toString() ?? '--', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey)),
                                    const SizedBox(height: 12),
                                    Text(state.thankYouData?.pickupTime ?? '--', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey)),
                                    const SizedBox(height: 12),
                                    Text('AED ${state.thankYouData?.totalAmount ?? '--'}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey)),
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
                                      CustomerHomeScreen()));
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
                else if (state is ThankYouError) {
                  snackBar(context, message: state.message.toString());
                  return Container(color: BgGrey, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
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
