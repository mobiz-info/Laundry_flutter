import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../src/Color.dart';

class ServicePriceList extends StatefulWidget {
  final String categoryId;

  const ServicePriceList({super.key, required this.categoryId});

  @override
  State<ServicePriceList> createState() => _ServicePriceListState();
}

class _ServicePriceListState extends State<ServicePriceList> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: BgGrey,
      appBar: ScreenAppbar(
        text: 'Service Price List',
        imagepath: "Assets/Images/pricing_icon.svg",
        needAction: true,
        svgNeed: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: BlocProvider(
            create: (context) =>
            CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
              ..add(ServicePriceEvent(authData.user_token!, widget.categoryId)),
          child: BlocBuilder<CustomerBloc, CustomerState>(
              builder: (context, state) {
                if (state is ServicePriceFetching) {
                  return Container(color: Colors.transparent,
                      child: const Center(child: CircularProgressIndicator(
                          color: primaryColor,
                          backgroundColor: Colors.transparent)));
                } else if (state is ServicePriceFetched) {
                  final data = state.servicePriceData;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Price list in AED', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: textgrey)),
                      const SizedBox(height: 18),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data?.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.white,
                              elevation: 0,
                              margin: const EdgeInsets.only(bottom: 14),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    data![index].tarifCategory!.isEmpty ?
                                    const Text('No Data', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey)) :
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Items', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: primaryColor)),
                                        Text('Normal', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: primaryColor)),
                                        Text('Express', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: primaryColor)),
                                        Text('Urgent', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: primaryColor)),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        physics: const ScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: data[index].tarifCategory?.length ?? 0,
                                        itemBuilder: (BuildContext context, int index2) {
                                          return Padding(
                                            padding: const EdgeInsets.only(bottom: 4),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(data[index].tarifCategory?[index2].item ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: textgrey)),
                                                Text(data[index].tarifCategory?[index2].normal ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: textgrey)),
                                                Text(data[index].tarifCategory?[index2].express ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: textgrey)),
                                                Text(data[index].tarifCategory?[index2].urgent ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: textgrey)),
                                              ],
                                            ),
                                          );
                                        }
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container(color: BgGrey, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
                }
              }
          ),
        ),
      ),
    );
  }
}

