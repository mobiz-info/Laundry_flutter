import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Service_Branch/delivery_time.dart';

import '../BLoCs/ServiceBranchBloc/service_branch_bloc.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/ServiceBranchRepo/service_branch_repo.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';

class DeliveryMode extends StatefulWidget {
  final String customerId;

  const DeliveryMode({Key? key, required this.customerId}) : super(key: key);

  @override
  State<DeliveryMode> createState() => _DeliveryModeState();
}

class _DeliveryModeState extends State<DeliveryMode> {
  int selectedIndex = -1;
  String selectedMode = '';

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
        title: const Text('Delivery Modes', style: TextStyle(fontSize: 16, color: primaryColor, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: BlocProvider(
            create: (context) =>
            ServiceBranchBloc(RepositoryProvider.of<ServiceBranchRepository>(context))
              ..add(GetSerDeliveryModeEvent(authData.user_token.toString())),
          child: BlocBuilder<ServiceBranchBloc, ServiceBranchState>(
            builder: (context, state) {
              if (state is SerDeliveryModeFetching) {
                print('111');
                return Container(color: Colors.transparent,
                    child: const Center(child: CircularProgressIndicator(
                        color: primaryColor,
                        backgroundColor: Colors.transparent)));
              } else if (state is SerDeliveryModeFetched) {
                final data = state.serviceDeliveryData;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Choose Mode of Delivery', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: textgrey)),
                    const SizedBox(height: 8),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                  selectedMode = data![index].mode!;
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment : CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              data![index].name.toString(),
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(fontSize: 12, color: lightGreyText, fontWeight: FontWeight.w600),
                                            ),
                                            data[index].extraValue == '' ? Container() : Text(
                                              data[index].extraValue.toString(),
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(fontSize: 12, color: primaryColor, fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      selectedIndex == index ? Container(
                                        height: 45, width: 45,
                                        decoration: BoxDecoration(
                                          color: primaryColor.withOpacity(0.3),
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color: primaryColor),
                                        ),
                                        child: const Icon(Icons.check_rounded, color: primaryColor),
                                      ) : Container(
                                        height: 45, width: 45,
                                        decoration: BoxDecoration(
                                            color: primaryColor.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: primaryColor)
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity, height: 42,
                      child: ElevatedButton(
                        onPressed: () {
                          if(selectedMode == '') {
                            snackBar(context, message: 'Please choose delivery mode');
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DeliveryTime(deliveryMode: selectedMode, customerId: widget.customerId)));
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
                );
              }
              else {
                return Container(color: BgGrey, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
              }
            }
          ),
        ),
      ),
    );
  }
}

