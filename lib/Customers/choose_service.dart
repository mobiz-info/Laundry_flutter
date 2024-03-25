import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../Utils/common.dart';
import '../src/Color.dart';
import 'choose_sub_service.dart';

class ChooseService extends StatefulWidget {
  final String orderId;

  const ChooseService({Key? key, required this.orderId}) : super(key: key);

  @override
  State<ChooseService> createState() => _ChooseServiceState();
}

class _ChooseServiceState extends State<ChooseService> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
          ..add(GetServicesEvent(authData.user_token!, authData.user_id)),
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
                  const Text('Select Desired Service', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: textgrey)),
                  const SizedBox(height: 12),
                  const Text('Choose the Laundry Services, which you are interested in today', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey)),
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
                        ) : GridView.builder(
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseSubService(catId: state.serviceList![index].categoryId.toString(), orderId: widget.orderId, isNewOrder: true)));
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
                                    Expanded(
                                        child: ClipRRect(borderRadius: BorderRadius.circular(10),
                                            child: Image.network(baseUrl+state.serviceList![index].serviceMaster!.categoryImage.toString() ?? '--'))),
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
