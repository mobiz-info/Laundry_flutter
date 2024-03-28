import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';

class PricingScreen extends StatefulWidget {

  const PricingScreen({Key? key}) : super(key: key);

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BgGrey,
      appBar: ScreenAppbar(
        text: 'Our Prices',
        imagepath: "Assets/Images/pricing_icon.svg",
        needAction: true,
        svgNeed: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: BlocProvider(
          create: (context) =>
          CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
            ..add(GetPricingEvent(authData.user_token!)),
          child: BlocBuilder<CustomerBloc, CustomerState>(
              builder: (context, state) {
                if (state is PricingFetching) {
                  return Container(color: Colors.transparent,
                      child: const Center(child: CircularProgressIndicator(
                          color: primaryColor,
                          backgroundColor: Colors.transparent)));
                }
                else if (state is PricingFetched) {
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
                          itemCount: state.pricingData?.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.white,
                              elevation: 0,
                              margin: const EdgeInsets.only(bottom: 14),
                              child: ExpansionTile(
                                shape: Border.all(color: Colors.white),
                                collapsedIconColor: primaryColor,
                                iconColor: primaryColor,
                                backgroundColor: Colors.white,
                                title: Text(state.pricingData?[index].serviceMaster ?? '--', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgray)),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        state.pricingData![index].tarifCategory!.isEmpty ?
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
                                            itemCount: state.pricingData?[index].tarifCategory?.length ?? 0,
                                            itemBuilder: (BuildContext context, int index2) {
                                              return Padding(
                                                padding: const EdgeInsets.only(bottom: 4),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(state.pricingData![index].tarifCategory?[index2].item ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: textgrey)),
                                                    Text(state.pricingData![index].tarifCategory?[index2].normal ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: textgrey)),
                                                    Text(state.pricingData![index].tarifCategory?[index2].express ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: textgrey)),
                                                    Text(state.pricingData![index].tarifCategory?[index2].urgent ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: textgrey)),
                                                  ],
                                                ),
                                              );
                                            }
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
                else if (state is PricingError) {
                  snackBar(context, message: state.message.toString());
                  return Container(color: BgGrey, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
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