import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Customers/thank_you_screen.dart';
import 'package:intl/intl.dart';
import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Models/CustomerModel/delivery_time_model.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';
import 'choose_service.dart';

class SelectDeliveryTime extends StatefulWidget {
  final String deliveryMode;
  final String pickUpMode;
  const SelectDeliveryTime({Key? key, required this.deliveryMode, required this.pickUpMode}) : super(key: key);

  @override
  State<SelectDeliveryTime> createState() => _SelectDeliveryTimeState();
}

class _SelectDeliveryTimeState extends State<SelectDeliveryTime> {
  DeliveryTimeModel? timeData;
  final CustomerRepository customerRepository = CustomerRepository();
  int selectedIndex = -1;
  String selectedDate = '';
  String deliveryDatePassing = '';
  String selectedTimeIndex = '';
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
        ..add(GetDeliveryDateEvent(authData.user_token!, widget.deliveryMode)),
      child: Scaffold(
        backgroundColor: BgGrey,
        appBar: ScreenAppbar(
          text: '',
          svgNeed: true,
          imagepath: "Assets/Images/time_date_img.svg",
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Select Time of Pick Up', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: textgrey)),
              const SizedBox(height: 18),
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
                      customerRepository.getDeliveryTime(token: authData.user_token!, deliveryDate: formattedDate).then((value) {
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
                          : 'Select Pick up Date', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: dateController.text.isNotEmpty ? primaryColor : textgrey, fontWeight: dateController.text.isNotEmpty ? FontWeight.w600 : FontWeight.w400))),
                ),
              ),
              // SizedBox(
              //   height: 75,
              //   child: BlocBuilder<CustomerBloc, CustomerState>(
              //     builder: (context, state) {
              //       if (state is DeliveryDateFetching) {
              //         return Container(color: Colors.transparent, child: const Center(child: CircularProgressIndicator(color: primaryColor, backgroundColor: Colors.transparent)));
              //       }
              //       else if (state is DeliveryDateFetched) {
              //         final data = state.deliveryDateList;
              //         return ListView.builder(
              //             scrollDirection: Axis.horizontal,
              //             shrinkWrap: true,
              //             itemCount: data?.length,
              //             itemBuilder: (BuildContext context, int index) {
              //               return Padding(
              //                 padding: const EdgeInsets.symmetric(horizontal: 5),
              //                 child: InkWell(
              //                   onTap: () {
              //                       selectedIndex = index;
              //                       selectedDate = formatYearDate(data[index].date);
              //                       customerRepository.getDeliveryTime(token: authData.user_token!, deliveryDate: selectedDate).then((value) {
              //                         setState(() {
              //                           timeData = value;
              //                         });
              //                       });
              //                   },
              //                   child: Container(
              //                       height: 75,
              //                       width: 128,
              //                       decoration: BoxDecoration(
              //                           color: selectedIndex == index ? primaryColor : Colors.white,
              //                           borderRadius: BorderRadius.circular(16),
              //                           border: Border.all(color: primaryColor, width: 1)
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
              //                                 style: TextStyle(fontSize: 12, color: selectedIndex == index ? Colors.white : primaryColor, fontWeight: FontWeight.w400),
              //                               ),
              //                               const SizedBox(height: 4),
              //                               Text(
              //                                 formatDateYear(data[index].date),
              //                                 textAlign: TextAlign.center,
              //                                 style: TextStyle(fontSize: 12, color: selectedIndex == index ? Colors.white : primaryColor, fontWeight: FontWeight.w600),
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
              const SizedBox(height: 22),
              BlocBuilder<CustomerBloc, CustomerState>(
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
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(color: primaryColor, width: 1)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                    child: Text(
                                      time[index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 12, color: selectedTimeIndex == time[index] ? Colors.white : primaryColor, fontWeight: FontWeight.w600),
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
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (dateController.text.isNotEmpty && selectedTimeIndex.isNotEmpty)
                    Expanded(
                      child: SizedBox(
                        height: 54,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: primaryColor, width: 1),
                            borderRadius: BorderRadius.circular(12.0), // Adjust as needed
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              customerRepository.getContactlessOrder(
                                  token: authData.user_token!,
                                  id: authData.user_id!,
                                  pickupDate: dateController.text,
                                  pickupTime: selectedTimeIndex,
                                  orderType: widget.deliveryMode,
                                  pickupMode: "1").then((value) {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseService(orderId: value.data!.first.orderDetails!.orderId.toString())));
                              });
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.white, elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),),
                            ),
                            child: const Text('ADD ITEMS', style: TextStyle(fontSize: 14.0, color: primaryColor, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(width: 16),
                  if (dateController.text.isNotEmpty && selectedTimeIndex.isNotEmpty)
                    Expanded(
                      child: SizedBox(
                        height: 54, 
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(backgroundColor: primaryColor, elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),),
                          ),
                          child: const Text('SKIP', style: TextStyle(fontSize: 14.0, color: White, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 30),
              if (dateController.text.isNotEmpty && selectedTimeIndex.isNotEmpty)
                SizedBox(
                  width: double.infinity, height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      if (dateController.text.isEmpty) {
                        snackBar(context, message: 'Please choose delivery date');
                      } else if (selectedTimeIndex.isEmpty) {
                        snackBar(context, message: 'Please choose delivery time');
                      }
                      else {
                        customerRepository.getContactlessOrder(
                            token: authData.user_token!,
                            id: authData.user_id!,
                            pickupDate: dateController.text,
                            pickupTime: selectedTimeIndex,
                            orderType: widget.deliveryMode,
                            pickupMode: "0").then((value) {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                              ThankYouScreen(orderId: value.data!.first.orderDetails!.orderId.toString(),
                                customerId: value.data!.first.orderDetails!.customer.toString(),
                                customerName: value.data!.first.orderDetails!.createdBy.toString(),
                              )));
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: primaryColor, elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),),
                    ),
                    child: const Text('SUBMIT', style: TextStyle(fontSize: 16.0, color: White, fontWeight: FontWeight.w600),
                    ),
                  ),  
              ),
              const SizedBox(height: 16),
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


