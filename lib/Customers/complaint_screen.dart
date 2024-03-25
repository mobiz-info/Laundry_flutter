import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golden_falcon/Customers/complaint_details.dart';
import 'package:golden_falcon/Customers/register_complaint.dart';
import 'package:intl/intl.dart';

import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../src/Color.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({Key? key}) : super(key: key);

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
          ..add(GetComplaintListEvent(authData.user_token!)),
      child: Scaffold(
        backgroundColor: BgGrey,
        appBar: ScreenAppbar(
          text: 'My Complaints',
          needAction: true,
          svgNeed: true,
          imagepath: "Assets/Images/complaint_img.svg",
        ),
        body: BlocBuilder<CustomerBloc, CustomerState>(
          builder: (context, state) {
            if (state is ComplaintListFetching) {
              return Container(color: Colors.transparent,
                  child: const Center(child: CircularProgressIndicator(
                      color: primaryColor,
                      backgroundColor: Colors.transparent)));
            } else if (state is ComplaintListFetched) {
              final data = state.complaintListModel;
              return SingleChildScrollView(
                child: Padding(padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity, height: 190,
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                  color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap : () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterComplaintList()));
                                    },
                                    child: const CircleAvatar(
                                      radius: 30, backgroundColor: BgGrey,
                                      child: Icon(Icons.add_rounded, color: primaryColor, size: 36),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  const Text('Add New', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: primaryColor)),
                                  const SizedBox(height: 8),
                                  const Text('Add a new Complaint and send directly to us.', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: lightGreyText)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              width: double.infinity, height: 190,
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                  color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(data?.count.toString() ?? '--', textAlign: TextAlign.end, style: const TextStyle(fontSize: 54, fontWeight: FontWeight.w800, color: primaryColor)),
                                  const SizedBox(height: 12),
                                  const Text('Complaints', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: primaryColor)),
                                  const SizedBox(height: 8),
                                  const Text('Active complaints which are already been registered.', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: lightGreyText)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ListView.builder(
                          physics: const ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: data?.data?.length,
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
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Complaint number', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey.withOpacity(0.7))),
                                              const SizedBox(height: 4),
                                              Text(data!.data?[index].complaintNumber?.toUpperCase() ?? '--', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: textgrey)),
                                            ],
                                          ),
                                          Container(
                                            width: 106, height: 38,
                                            decoration: BoxDecoration(
                                                color: primaryColor.withOpacity(0.3), borderRadius: BorderRadius.circular(8)),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                data!.data?[index].status == 'Pending'
                                                    ? SvgPicture.asset('Assets/Images/pending_icon.svg')
                                                    : SvgPicture.asset('Assets/Images/resolved_icon.svg'),
                                                const SizedBox(width: 8),
                                                Text(data!.data?[index].status ?? '--', textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: textgrey)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Complaint type', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey.withOpacity(0.7))),
                                              const SizedBox(height: 4),
                                              Text(data.data?[index].complaintType ?? '--', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textgrey.withOpacity(0.9))),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                                  ComplaintDetails(complaintId: data.data![index].complaintId.toString())));
                                            },
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
                                        ],
                                      ),
                                      const SizedBox(height: 12),
                                      Row(
                                        children: [
                                          SvgPicture.asset('Assets/Images/calender_icon.svg'),
                                          const SizedBox(width: 8),
                                          Text(data.data?[index].createdDate != null ? formatDateYear(data.data?[index].createdDate) : '--', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: textgrey.withOpacity(0.9))),
                                          const SizedBox(width: 8),
                                          Text('|', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: textgrey.withOpacity(0.9))),
                                          const SizedBox(width: 8),
                                          Text(data.data?[index].createdDate != null ? formatTime(data.data![index].createdDate.toString()) : '--', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: textgrey.withOpacity(0.9))),
                                        ],
                                      ),
                                      const SizedBox(height: 12),
                                      Text('Remark : ${data.data?[index].remark ?? '--'}', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey.withOpacity(0.7))),
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
            else {
              return Container(color: BgGrey, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
            }
          }
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

