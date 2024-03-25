import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../Utils/common.dart';
import '../src/Color.dart';
import 'Edit.dart';

class ComplaintDetails extends StatefulWidget {
  final String complaintId;

  const ComplaintDetails({Key? key, required this.complaintId}) : super(key: key);

  @override
  State<ComplaintDetails> createState() => _ComplaintDetailsState();
}

class _ComplaintDetailsState extends State<ComplaintDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
          ..add(GetComplaintDetailsEvent(authData.user_token!, widget.complaintId)),
      child: Scaffold(
        backgroundColor: BgGrey,
        appBar: ScreenAppbar(
          text: 'Complaint Details',
          needAction: true,
          svgNeed: true,
          imagepath: "Assets/Images/complaint_img.svg",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: BlocBuilder<CustomerBloc, CustomerState>(
              builder: (context, state) {
                if (state is ComplaintDetailsFetching) {
                  return Container(color: Colors.transparent,
                      child: const Center(child: CircularProgressIndicator(
                          color: primaryColor, backgroundColor: Colors.transparent)));
                } else if (state is ComplaintDetailsFetched) {
                  final data = state.complaintDetailsData;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Complaint number', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey.withOpacity(0.7))),
                                      const SizedBox(height: 4),
                                      Text(data?.first.details?.complaintNumber?.toUpperCase() ?? '--', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: textgrey)),
                                    ],
                                  ),
                                  Container(
                                    width: 106, height: 38,
                                    decoration: BoxDecoration(
                                        color: primaryColor.withOpacity(0.3), borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        data?.first.details?.status == 'Pending'
                                            ? SvgPicture.asset('Assets/Images/pending_icon.svg')
                                            : SvgPicture.asset('Assets/Images/resolved_icon.svg'),
                                        const SizedBox(width: 8),
                                        Text(data?.first.details?.status ?? '--', textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: textgrey)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text('Order number', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey.withOpacity(0.7))),
                              const SizedBox(height: 4),
                              Text('ORD-${data?.first.details?.order?.toUpperCase()}' ?? '--', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: textgrey)),
                              const SizedBox(height: 8),
                              Text('Complaint type', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey.withOpacity(0.7))),
                              const SizedBox(height: 4),
                              Text(data?.first.details?.complaintType ?? '--', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textgrey.withOpacity(0.9))),
                              const SizedBox(height: 14),
                              Row(
                                children: [
                                  SvgPicture.asset('Assets/Images/calender_icon.svg'),
                                  const SizedBox(width: 8),
                                  Text(data?.first.details?.createdDate != null ? formatDateYear(data?.first.details?.createdDate) : '--', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: textgrey.withOpacity(0.9))),
                                  const SizedBox(width: 8),
                                  Text('|', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: textgrey.withOpacity(0.9))),
                                  const SizedBox(width: 8),
                                  Text(data?.first.details?.createdDate != null ? formatTime(data!.first.details!.createdDate.toString()) : '--', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: textgrey.withOpacity(0.9))),
                                ],
                              ),
                              // const SizedBox(height: 14),
                              // Text('Remark : Nil', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300, color: textgrey.withOpacity(0.9))),
                              const SizedBox(height: 8),
                              const Divider(color: DividerGrey, thickness: 0.8),
                              const SizedBox(height: 8),
                              Text('Attached Photos', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: textgrey.withOpacity(0.7))),
                              const SizedBox(height: 14),
                              data!.first.pic!.photo == null ? const Text('--') : Image.network(baseUrl+data!.first.pic!.photo.toString(), height: 140),
                              const SizedBox(height: 14),
                              const Divider(color: DividerGrey, thickness: 0.8),
                              const SizedBox(height: 8),
                              Text('Complaint description', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: textgrey.withOpacity(0.7))),
                              const SizedBox(height: 6),
                              Text(data?.first.details?.remarks ?? '--', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: textgrey)),
                            ],
                          ),
                        ),
                      ),
                      //const SizedBox(height: 20),
                      // Container(
                      //   width: double.infinity,
                      //   padding: const EdgeInsets.all(8),
                      //   decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Text('Reply from company', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: textgrey.withOpacity(0.7))),
                      //         const SizedBox(height: 6),
                      //         Text(data?.first.details?.replyFromCom ?? '--', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: textgrey)),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(height: 20),
                      // CustomTextField(
                      //   hintText: 'Type your message here...',
                      //   controllerName: TextEditingController(),
                      //   needPadding: true,
                      //   boxHeight: 192,
                      //   padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 120),
                      // ),
                      // const SizedBox(height: 28),
                      // SizedBox(
                      //   width: double.infinity,
                      //   height: 54,
                      //   child: ElevatedButton(
                      //     onPressed: () {},
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: primaryColor,
                      //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                      //     ),
                      //     child: const Text('SUBMIT', style: TextStyle(fontSize: 15, color: White)),
                      //   ),
                      // ),
                      const SizedBox(height: 24),
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

  String formatDateYear(DateTime? dateTime) {
    final format = DateFormat('dd MMM yyyy');
    return format.format(dateTime!);
  }

  String formatTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedTime = DateFormat('hh:mm a').format(dateTime);
    return formattedTime;
  }

}

