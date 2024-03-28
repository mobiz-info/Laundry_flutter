import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Customers/service_price_list.dart';
import 'package:golden_falcon/Customers/services_list.dart';

import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../Utils/common.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';

class ChooseSubService extends StatefulWidget {
  final String catId;
  final String orderId;
  final bool isNewOrder;

  const ChooseSubService({Key? key, required this.catId, required this.isNewOrder, required this.orderId}) : super(key: key);

  @override
  State<ChooseSubService> createState() => _ChooseSubServiceState();
}

class _ChooseSubServiceState extends State<ChooseSubService> {

  final String pageTitle = 'Items';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
          ..add(GetSubServicesEvent(authData.user_token!, widget.catId)),
        child: Scaffold(
          backgroundColor: BgGrey,
          appBar: ScreenAppbar(
            text: '',
            svgNeed: true,
            imagepath: "Assets/Images/choose_service_bg.svg",
          ),
          body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Select Desired Sub Service', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: textgrey)),
                    const SizedBox(height: 12),
                    const Text('Choose the Laundry Services, which you are interested in today', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey)),
                    const SizedBox(height: 28),
                    BlocBuilder<CustomerBloc, CustomerState>(
                        builder: (context, state) {
                          print('state ${state}');
                          if (state is SubServicesFetching) {
                            return Container(color: Colors.transparent, child: const Center(child: CircularProgressIndicator(color: primaryColor, backgroundColor: Colors.transparent)));
                          }
                          else if (state is SubServicesFetched) {
                             return state.subServiceList?.isEmpty == true ?
                              const Center(
                                  child: Text('No Data Found', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))
                             ) : GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                              ),
                              itemCount: state.subServiceList?.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    print('Page Title: ${pageTitle}');
                                    if (widget.isNewOrder) {
                                      setState(() {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => ServicesList(
                                          catId: widget.catId,
                                          subCatId: state.subServiceList![index].subCatId.toString(),
                                          orderId: widget.orderId,
                                          subCatName: state.subServiceList![index].subServiceMaster!.subCatName.toString(),
                                        )));
                                      });
                                    } else {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ServicePriceList(
                                        categoryId: widget.catId
                                      )));
                                    }
                                  },
                                  child:
                                  state.subServiceList?.isEmpty == true
                                    ? Expanded(child: Container(
                                      alignment: Alignment.center, child: const Text('No Sub Service Found'))) :
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: White,
                                        borderRadius: BorderRadius.circular(16)
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                            child: ClipRRect(borderRadius: BorderRadius.circular(10),
                                                child: Image.network(baseUrl+state.subServiceList![index].subServiceMaster!.subCatImage.toString() ?? '--'))),
                                        const SizedBox(height: 8),
                                        Text(state.subServiceList?[index].subServiceMaster?.subCatName ?? '--',
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: lightGreyText, height: 1.2)),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                          else if (state is SubServicesError) {
                            snackBar(context, message: state.message.toString());
                            return Container(color: BgGrey, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
                          }
                          else {
                            return Container(color: BgGrey, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
                          }
                        }
                    ),
                  ],
                ),
              )
          ),
        )
    );
  }
}
