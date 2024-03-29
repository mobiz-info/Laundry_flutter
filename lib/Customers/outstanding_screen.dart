import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/CustomerBloc/customer_bloc.dart';
import 'package:golden_falcon/Customers/pay_outstanding.dart';
import 'package:intl/intl.dart';

import '../Models/CustomerModel/pay_now_outstanding_get_model.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';

class OutstandingScreen extends StatefulWidget {
  const OutstandingScreen({Key? key}) : super(key: key);

  @override
  State<OutstandingScreen> createState() => _OutstandingScreenState();
}

class _OutstandingScreenState extends State<OutstandingScreen> {

  final CustomerRepository customerRepository = CustomerRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
          ..add(GetOutstandingEvent(authData.user_token!)),
      child: Scaffold(
        backgroundColor: BgGrey,
        appBar: ScreenAppbar(
          text: 'Outstanding',
          svgNeed: true,
          imagepath: "Assets/Images/outstanding_img.svg",
          needAction: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: BlocBuilder<CustomerBloc, CustomerState>(
              builder: (context, state) {
                if (state is OutstandingFetching) {
                  print('111');
                  return Container(color: Colors.transparent,
                      child: const Center(child: CircularProgressIndicator(
                          color: primaryColor,
                          backgroundColor: Colors.transparent)));
                }
                else if (state is OutstandingFetched) {
                  print('222');
                  if (state.outstandingData?.overallDue == null && state.outstandingData!.pendingAmout!.isEmpty) {
                    return Container(color: BgGrey, child: const Center(child: Text('No Outstanding Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
                  } else {
                    print('333');
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Your Overall due', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w300)),
                        Text('AED ${state.outstandingData?.overallDue ?? '--'}', style: const TextStyle(fontSize: 22, color: textgrey, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 34,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              var response = await customerRepository.getPayNowOutstandingData(
                                  token: authData.user_token!);
                              if (response.status == true) {
                                PayNowOutstandingGetData? data = response.data;
                                await Navigator.push(context, MaterialPageRoute(builder: (context)
                                => PayOutstanding(overDueAmt: state.outstandingData!.overallDue.toString(),
                                  walletBalance: data!.walletBal.toString(),
                                  orderNum: state.outstandingData!.pendingAmout!.first!.orderNumber.toString(),
                                  pay: 'Common Pay',
                                )));
                                context.read<CustomerBloc>().add(GetOutstandingEvent(authData.user_token!));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              surfaceTintColor: Colors.white,
                              elevation: 0,
                              side: const BorderSide(width: 1.0, color: primaryColor,),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text('PAY NOW', style: TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        const Text('Pending payments', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w300)),
                        const SizedBox(height: 8),
                        ListView.builder(
                            physics: const ScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: state.outstandingData?.pendingAmout?.length,
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
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        const Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Order No', style: TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w400)),
                                            SizedBox(height: 4),
                                            Text('INV No', style: TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w400)),
                                            SizedBox(height: 4),
                                            Text('Order Date', style: TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w400)),
                                            SizedBox(height: 4),
                                            Text('INV Date', style: TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w400)),
                                            SizedBox(height: 4),
                                            Text('Amount', style: TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w400)),
                                            SizedBox(height: 4),
                                            Text('Amount paid', style: TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w400)),
                                            SizedBox(height: 4),
                                            Text('Balance', style: TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w400)),
                                            SizedBox(height: 4),
                                            Text('Status', style: TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w400)),
                                          ],
                                        ),
                                        const SizedBox(width: 4),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(state.outstandingData?.pendingAmout?[index].orderNumber?.toUpperCase() ?? '--', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w500)),
                                            const SizedBox(height: 4),
                                            Text(state.outstandingData?.pendingAmout?[index].invoicesNumber != null ?
                                            state.outstandingData?.pendingAmout![index].invoicesNumber.toUpperCase() : '--', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w500)),
                                            const SizedBox(height: 4),
                                            Text(formatDateYear(DateTime.parse(state.outstandingData?.pendingAmout?[index].orderDate.toString() ?? '--')), style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w500)),
                                            const SizedBox(height: 4),
                                            Text(state.outstandingData?.pendingAmout?[index].invoicesDate != null ?
                                            formatDateYear(state.outstandingData?.pendingAmout?[index].invoicesDate) : '--', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w500)),
                                            const SizedBox(height: 4),
                                            Text('${state.outstandingData?.pendingAmout?[index].totalAmount ?? '--'} AED', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w500)),
                                            const SizedBox(height: 4),
                                            Text('${state.outstandingData?.pendingAmout?[index].amountPaid?? '--'} AED', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w500)),
                                            const SizedBox(height: 4),
                                            Text('${state.outstandingData?.pendingAmout?[index].balance ?? '--'} AED', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w500)),
                                            const SizedBox(height: 4),
                                            Text(state.outstandingData?.pendingAmout?[index]?.status ?? '--', style: TextStyle(fontSize: 12.0, color: state.outstandingData?.pendingAmout?.first?.status == 'Unpaid' ? redColor : greenColor, fontWeight: FontWeight.w500)),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              height: 26,
                                              width: 98,
                                              child: ElevatedButton(
                                                onPressed: () async {
                                                  var response = await customerRepository.getPayNowOutstandingData(
                                                      token: authData.user_token!);
                                                  if (response.status == true) {
                                                    PayNowOutstandingGetData? data = response.data;
                                                    await Navigator.push(context, MaterialPageRoute(builder: (context)
                                                    => PayOutstanding(overDueAmt: state.outstandingData!.pendingAmout![index].balance.toString(),
                                                      walletBalance: data!.walletBal.toString(),
                                                      orderNum: state.outstandingData!.pendingAmout![index].orderNumber.toString(),
                                                      pay: 'IndividualPay',
                                                    )));
                                                    context.read<CustomerBloc>().add(GetOutstandingEvent(authData.user_token!));
                                                  }
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.white,
                                                  surfaceTintColor: Colors.white,
                                                  elevation: 0,
                                                  side: const BorderSide(width: 1.0, color: primaryColor,),
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                                ),
                                                child: const Text('PAY', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                        ),
                      ],
                    );
                  }
                }
                else if (state is OutstandingError) {
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

  String formatDateYear(DateTime? dateTime) {
    final format = DateFormat('dd-MM-yyyy');
    return format.format(dateTime!);
  }

}

