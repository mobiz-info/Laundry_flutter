import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../src/Color.dart';

class Notifications extends StatefulWidget {

  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  final CustomerRepository customerRepository = CustomerRepository();
  late BuildContext contextPop;
  var data = [];

  @override
  Widget build(BuildContext context) {
    contextPop = context;
    return Scaffold(
      backgroundColor: BgGrey,
      appBar: ScreenAppbar(
        text: 'Notifications',
        imagepath: "Assets/Images/notification_img.svg",
        svgNeed: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: BlocProvider(
            create: (context) =>
            CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
              ..add(GetNotificationEvent(authData.user_token!)),
          child: BlocBuilder<CustomerBloc, CustomerState>(
            builder: (context, state) {
              print('state $state');
              if (state is NotificationFetching) {
                return Container(color: Colors.transparent,
                    child: const Center(child: CircularProgressIndicator(
                        color: primaryColor,
                        backgroundColor: Colors.transparent)));
              } else if (state is NotificationFetched) {
                data = state.notificationData!;
                print('@@@@@@@@ length ${state.notificationData?.length}');
                return state.notificationData?.isEmpty == true ?
                const Center(
                    child: Text('No Notifications', style: TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w600))
                ) : ListView.builder(
                    itemCount: data?.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, index) {
                      print('notification length ${data?.length}');
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(12))
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(data?[index].title ?? '--', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textgrey)),
                                      const SizedBox(height: 8),
                                      Text(data?[index].body ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey)),
                                      const SizedBox(height: 12),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('${data?[index].createdOn?.date != null ? formatDateYear(data?[index].createdOn?.date) :  '--'} at ${data?[index].createdOn?.time ?? '--'}', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: lightGreyText)),
                                          SizedBox(
                                            height: 22,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return Center(
                                                      child: SingleChildScrollView(
                                                        child: AlertDialog(
                                                          backgroundColor: Colors.white,
                                                          elevation: 0,
                                                          title: Column(
                                                            children: [
                                                              const SizedBox(height: 12),
                                                              SvgPicture.asset('Assets/Images/noti_delete_img.svg'),
                                                              const SizedBox(height: 32),
                                                              const Text('Do you really want to delete this notification ?', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w500)),
                                                            ],
                                                          ),
                                                          actions: [
                                                            const SizedBox(height: 12),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Expanded(
                                                                  child: SizedBox(
                                                                    height: 42, width: 120,
                                                                    child: ElevatedButton(
                                                                      onPressed: () {
                                                                        Navigator.pop(context);
                                                                      },
                                                                      style: ElevatedButton.styleFrom(
                                                                        backgroundColor: Colors.white, surfaceTintColor: Colors.white,
                                                                        side: const BorderSide(width: 1.6, color: primaryColor), elevation: 0,
                                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                                                      ),
                                                                      child: const Text('Cancel', style: TextStyle(fontSize: 14, color: textgrey)),
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(width: 12),
                                                                Expanded(
                                                                  child: SizedBox(
                                                                    height: 42, width: 120,
                                                                    child: ElevatedButton(
                                                                      onPressed: () async {
                                                                        Navigator.pop(context);
                                                                        await customerRepository.getNotiDeleteData(token: authData.user_token!, notificationId: data![index].noticicationId.toString()).then((value) {
                                                                          Future.delayed(const Duration(seconds: 1), () {
                                                                            data.removeAt(index);
                                                                            setState(() {});
                                                                          });
                                                                        });
                                                                      },
                                                                      style: ElevatedButton.styleFrom(
                                                                        backgroundColor: primaryColor, surfaceTintColor: Colors.white, elevation: 0,
                                                                        side: const BorderSide(width: 1.6, color: primaryColor),
                                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                                                      ),
                                                                      child: const Text('Yes', style: TextStyle(fontSize: 14, color: Colors.white)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(height: 28),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                elevation: 0,
                                                backgroundColor: Colors.white,
                                                surfaceTintColor: Colors.white,
                                                side: const BorderSide(width: 1.0, color: primaryColor),
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                              ),
                                              child: const Text('DELETE', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                );
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
    final format = DateFormat('dd MMM yyyy');
    return format.format(dateTime!);
  }

  String formatTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedTime = DateFormat('hh:mm a').format(dateTime);
    return formattedTime;
  }

}

