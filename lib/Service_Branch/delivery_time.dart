import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Service_Branch/select_services.dart';
import 'package:intl/intl.dart';

import '../BLoCs/ServiceBranchBloc/service_branch_bloc.dart';
import '../Models/ServiceBranchModel/service_delivery_time_model.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/ServiceBranchRepo/service_branch_repo.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';

class DeliveryTime extends StatefulWidget {
  final String deliveryMode;
  final String customerId;

  const DeliveryTime({Key? key, required this.deliveryMode, required this.customerId}) : super(key: key);

  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {

  ServiceDeliveryTimeModel? timeData;
  int selectedIndex = -1;
  String selectedDate = '';
  String selectedTimeIndex = '';
  final ServiceBranchRepository serviceBranchRepository = ServiceBranchRepository();
  TextEditingController dateController = TextEditingController();

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
        title: const Text('Delivery Times', style: TextStyle(fontSize: 16, color: primaryColor, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: BlocProvider(
            create: (context) =>
            ServiceBranchBloc(RepositoryProvider.of<ServiceBranchRepository>(context))
              ..add(GetSerDeliveryDateEvent(authData.user_token.toString(), widget.deliveryMode)),
          child: ListView(
            children: [
              const Text('Select Time of Delivery', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: textgrey)),
              const SizedBox(height: 16),
              InkWell(
                onTap: () async {
                  final DateTime? fromDatePicked = await showDatePicker(
                    builder: (context, child) {
                      return Theme(
                          data: ThemeData().copyWith(
                            colorScheme: const ColorScheme.light(
                              primary: primaryColor,
                              onPrimary: Colors.white,
                              surface: Colors.white,
                              onSurface: textgrey,
                            ),
                            dialogBackgroundColor:Colors.blue.shade50,
                          ), child: child!);
                    },
                    context: context,
                    initialDate: DateTime.now(),
                    //firstDate: DateTime(2000),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );

                  if(fromDatePicked != null) {
                    String formattedDate = DateFormat('dd-MM-yyyy').format(fromDatePicked);
                    setState(() {
                      dateController.text = formattedDate;
                      debugPrint('Delivery Date $formattedDate');
                      serviceBranchRepository.getDeliveryTimeData(token: authData.user_token!, date: formattedDate).then((value) {
                        setState(() {
                          timeData = value;
                        });
                      });
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 39,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: primaryColor),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Align(alignment: Alignment.center, child: Text(
                      dateController.text.isNotEmpty
                          ? dateController.text
                          : 'Select Delivery Date', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: dateController.text.isNotEmpty ? primaryColor : textgrey, fontWeight: dateController.text.isNotEmpty ? FontWeight.w600 : FontWeight.w400))),
                ),
              ),
              // SizedBox(
              //   height: 75,
              //   child: BlocBuilder<ServiceBranchBloc, ServiceBranchState>(
              //     builder: (context, state) {
              //       if (state is SerDeliveryDateFetching) {
              //         return Container(color: Colors.transparent,
              //             child: const Center(child: CircularProgressIndicator(
              //                 color: primaryColor,
              //                 backgroundColor: Colors.transparent)));
              //       } else if (state is SerDeliveryDateFetched) {
              //         final data = state.deliveryDateData;
              //         return ListView.builder(
              //             scrollDirection: Axis.horizontal,
              //             shrinkWrap: true,
              //             itemCount: data?.length,
              //             itemBuilder: (BuildContext context, int index) {
              //               return Padding(
              //                 padding: const EdgeInsets.symmetric(horizontal: 5),
              //                 child: InkWell(
              //                   onTap: () {
              //                     selectedIndex = index;
              //                     selectedDate = formatYearDate(data[index].date);
              //                     serviceBranchRepository.getDeliveryTimeData(token: authData.user_token.toString(), date: selectedDate).then((value) {
              //                       setState(() {
              //                         timeData = value;
              //                       });
              //                     });
              //                   },
              //                   child: Container(
              //                       height: 75,
              //                       width: 128,
              //                       decoration: BoxDecoration(
              //                           color: selectedIndex == index ? primaryColor : Colors.white,
              //                           borderRadius: BorderRadius.circular(8),
              //                           border: Border.all(color: selectedIndex == index ? Colors.white : primaryColor, width: 1)
              //                       ),
              //                       child: Padding(
              //                         padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              //                         child: Center(
              //                           child: Column(
              //                             crossAxisAlignment: CrossAxisAlignment.center,
              //                             mainAxisAlignment: MainAxisAlignment.center,
              //                             children: [
              //                               Text(
              //                                 data![index].day.toString(),
              //                                 textAlign: TextAlign.center,
              //                                 style: TextStyle(fontSize: 12, color: selectedIndex == index ? Colors.white : primaryColor, fontWeight: FontWeight.w500),
              //                               ),
              //                               const SizedBox(height: 2),
              //                               Text(
              //                                 formatDateYear(data[index].date),
              //                                 textAlign: TextAlign.center,
              //                                 style: TextStyle(fontSize: 13, color: selectedIndex == index ? Colors.white : primaryColor, fontWeight: FontWeight.w500),
              //                               ),
              //                             ],
              //                           ),
              //                         ),
              //                       )
              //                   ),
              //                 ),
              //               );
              //             }
              //         );
              //       }
              //       else {
              //         return Container(color: BgGrey, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
              //       }
              //     }
              //   ),
              // ),
              const SizedBox(height: 18),
              BlocBuilder<ServiceBranchBloc, ServiceBranchState>(
                builder: (context, state) {
                  final List<String> time = (timeData?.data) ?? [];
                  if(time.isNotEmpty) {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: time.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedTimeIndex = time[index];
                                });
                              },
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: selectedTimeIndex == time[index] ? primaryColor : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: primaryColor, width: 1)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                    child: Text(
                                      time[index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 13, color: selectedTimeIndex == time[index] ? Colors.white : primaryColor, fontWeight: FontWeight.w600),
                                    ),
                                  )
                              ),
                            ),
                          );
                        }
                    );
                  }
                  else {
                    return const Center(child: Text(''));
                  }
                }
              ),
              const SizedBox(height: 24),
              if (dateController.text.isNotEmpty && selectedTimeIndex.isNotEmpty)
              SizedBox(
                width: double.infinity, height: 42,
                child: ElevatedButton(
                  onPressed: () {
                    if (dateController.text.isEmpty) {
                      snackBar(context, message: 'Please choose delivery date');
                    } else if (selectedTimeIndex.isEmpty) {
                      snackBar(context, message: 'Please choose delivery time');
                    } else {
                      serviceBranchRepository.getAddOrderData(
                          token: authData.user_token.toString(),
                          customerId: widget.customerId,
                          orderType: widget.deliveryMode,
                          deliveryDate: dateController.text,
                          deliveryTime: selectedTimeIndex).then((value) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectServices(customerId: widget.customerId, orderId: value.data!.orderId.toString())));
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor, elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Next', style: TextStyle(fontSize: 14, color: White),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  String formatDateYear(DateTime? dateTime) {
    final format = DateFormat('dd-MM-yyyy');
    return format.format(dateTime!);
  }

  String formatYearDate(DateTime? dateTime) {
    final format = DateFormat('yyyy-MM-dd');
    return format.format(dateTime!);
  }

}
