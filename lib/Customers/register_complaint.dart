import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_falcon/Customers/register_complaint_detail.dart';
import 'package:intl/intl.dart';

import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';

class RegisterComplaintList extends StatefulWidget {
  const RegisterComplaintList({Key? key}) : super(key: key);

  @override
  State<RegisterComplaintList> createState() => _RegisterComplaintListState();
}

class _RegisterComplaintListState extends State<RegisterComplaintList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
        ..add(GetAddComplaintEvent(authData.user_token!)),
      child: Scaffold(
        backgroundColor: BgGrey,
        appBar: ScreenAppbar(
          text: 'Register your Complaint',
          needAction: true,
          svgNeed: true,
          imagepath: "Assets/Images/complaint_img.svg",
        ),
        body: BlocBuilder<CustomerBloc, CustomerState>(
          builder: (context, state) {
            if (state is AddComplaintFetching) {
              return Container(color: Colors.transparent,
                  child: const Center(child: CircularProgressIndicator(
                      color: primaryColor,
                      backgroundColor: Colors.transparent)));
            }
            else if (state is AddComplaintFetched) {
              final data = state.addComplaintData;
              return SingleChildScrollView(
                child: Padding(padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Your recent orders', style: TextStyle(fontSize: 13.0, color: textgrey, fontWeight: FontWeight.w400)),
                      ListView.builder(
                          physics: const ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: data?.length,
                          itemBuilder: (itemBuilder, index) {
                            return data?.isEmpty == true ?
                            const Center(
                                child: Text('No Delivered Orders', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))
                            ) : Padding(
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
                                      ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        leading: data?[index].status == "Delivered"
                                            ? SvgPicture.asset('Assets/Images/delivered_icon.svg')
                                            : SvgPicture.asset('Assets/Images/intransist_icon.svg'),
                                        title: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(data?[index].status ?? '--', style: const TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w500)),
                                            Text(data?[index].deliveryDate != null ? formatDateYear(data?[index].deliveryDate) : '--', style: const TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w300)),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text('Order number : ${data?[index].orderNumber?.toUpperCase() ?? '--'}', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w300)),
                                      const SizedBox(height: 2),
                                      Text('Number of items : ${data?[index].quantity ?? '--'}', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w300)),
                                      const SizedBox(height: 2),
                                      Text('Amount paid : AED ${data?[index].totalAmount ?? '--'}', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w300)),
                                      const SizedBox(height: 14),
                                      SizedBox(
                                        height: 34,
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterComplaintDetail(orderId: data![index].orderId.toString())));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            surfaceTintColor: Colors.white,
                                            elevation: 0,
                                            side: const BorderSide(width: 1.0, color: primaryColor,),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                          ),
                                          child: const Text('Register a complaint', style: TextStyle(fontSize: 13, color: textgrey, fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
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
              );
            }
            else if (state is AddComplaintError) {
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
    );
  }

  String formatDateYear(DateTime? dateTime) {
    final format = DateFormat('dd-MM-yyyy');
    return format.format(dateTime!);
  }

}

