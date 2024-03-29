import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../Utils/common.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';
import 'choose_sub_service.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
          ..add(GetServicesEvent(authData.user_token!, authData.user_id)),
        child: Scaffold(
          backgroundColor: BgGrey,
          appBar: ScreenAppbar(
            text: 'Our Services',
            svgNeed: true,
            imagepath: "Assets/Images/services_icon.svg",
          ),
          body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Select Desired Service', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: textgrey)),
                    const SizedBox(height: 12),
                    const Text('Choose the Laundry Services, which you are interested in today', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: textgrey)),
                    const SizedBox(height: 28),
                    BlocBuilder<CustomerBloc, CustomerState>(
                        builder: (context, state) {
                          print('state ${state}');
                          if (state is ServicesFetching) {
                            return Container(color: Colors.transparent, child: const Center(child: CircularProgressIndicator(color: primaryColor, backgroundColor: Colors.transparent)));
                          }
                          else if (state is ServicesFetched) {
                            return state.serviceList?.isEmpty == true ?
                            const Center(
                                child: Text('No Data Found', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))
                            ) :GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                              ),
                              itemCount: state.serviceList?.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseSubService(catId: state.serviceList![index].categoryId.toString(), orderId: '', isNewOrder: false)));
                                      //selectedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: White,
                                        borderRadius: BorderRadius.circular(16)
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(child: Image.network(baseUrl+state.serviceList![index].serviceMaster!.categoryImage.toString() ?? '--')),
                                        const SizedBox(height: 8),
                                        Text(state.serviceList?[index].serviceMaster?.categoryName ?? '--',
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: lightGreyText, height: 1.2)),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                          else if (state is ServicesError) {
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
                  ],
                ),
              )
          ),
        )
    );
    // return Scaffold(
    //   backgroundColor: BgGrey,
    //   appBar: ScreenAppbar(
    //     text: "Our Services",
    //     imagepath: "Assets/Images/services_appbar_img.png",
    //     needAction: true,
    //   ),
    //   body: SingleChildScrollView(
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           const Text('Trending', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: textgrey)),
    //           const SizedBox(height: 12),
    //           Image.asset('Assets/Images/offer_banner_img.png'),
    //           const SizedBox(height: 18),
    //           const Text('Choose the Laundry Services, which you are interested in today', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: textgrey)),
    //           const SizedBox(height: 28),
    //           GridView.builder(
    //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //               crossAxisCount: 3,
    //               crossAxisSpacing: 12,
    //               mainAxisSpacing: 12,
    //             ),
    //             itemCount: serviceList.length,
    //             shrinkWrap: true,
    //             physics: const NeverScrollableScrollPhysics(),
    //             itemBuilder: (context, index) {
    //               return GestureDetector(
    //                 onTap: () {
    //                   setState(() {
    //                     //selectedIndex = index;
    //                   });
    //                 },
    //                 child: Container(
    //                   padding: const EdgeInsets.all(8),
    //                   decoration: BoxDecoration(
    //                       color: White,
    //                       borderRadius: BorderRadius.circular(16)
    //                   ),
    //                   child: Column(
    //                     children: [
    //                       Expanded(child: Image.asset(serviceList[index])),
    //                       const SizedBox(height: 8),
    //                       Text(serviceName[index],
    //                         textAlign: TextAlign.center,
    //                         style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: lightGreyText, height: 1.2)),
    //                     ],
    //                   ),
    //                 )
    //               );
    //             },
    //           ),
    //         ],
    //       ),
    //     )
    //   ),
    // );
  }
}
