import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Service_Branch/service_items_list.dart';

import '../BLoCs/ServiceBranchBloc/service_branch_bloc.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/ServiceBranchRepo/service_branch_repo.dart';
import '../Utils/common.dart';
import '../src/Color.dart';

class SelectSubServices extends StatefulWidget {
  final String categoryId;
  final String customerId;
  final String orderId;

  const SelectSubServices({Key? key, required this.categoryId, required this.customerId, required this.orderId}) : super(key: key);

  @override
  State<SelectSubServices> createState() => _SelectSubServicesState();
}

class _SelectSubServicesState extends State<SelectSubServices> {
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
        title: const Text('Select Sub Services', style: TextStyle(fontSize: 16, color: primaryColor, fontWeight: FontWeight.w500)),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Select Desired Sub Service', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: textgrey)),
                const SizedBox(height: 16),
                const Text('Choose the Laundry Services, which you are interested in today', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: textgrey)),
                const SizedBox(height: 28),
                BlocProvider(
                  create: (context) =>
                  ServiceBranchBloc(RepositoryProvider.of<ServiceBranchRepository>(context))
                    ..add(GetServiceSubCategoryEvent(authData.user_token.toString(), widget.categoryId)),
                  child: BlocBuilder<ServiceBranchBloc, ServiceBranchState>(
                      builder: (context, state) {
                        if (state is ServiceSubCategoryFetching) {
                          return Container(color: Colors.transparent,
                              child: const Center(child: CircularProgressIndicator(
                                  color: primaryColor,
                                  backgroundColor: Colors.transparent)));
                        } else if (state is ServiceSubCategoryFetched) {
                          final data = state.subCategoryData;
                          return state.subCategoryData?.isEmpty == true ?
                          const Center(
                              child: Text('No Data Found', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))
                          ) : GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                            itemCount: data?.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceItemsList(
                                        catId: widget.categoryId,
                                        subCatId: data![index].subCatId.toString(),
                                        customerId: widget.customerId,
                                        orderId: widget.orderId
                                      )));
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
                                        Expanded(child: Image.network(baseUrl+(data?[index].subServiceMaster?.subCatImage ?? '--'))),
                                        const SizedBox(height: 8),
                                        Text(data?[index].subServiceMaster?.subCatName ?? '--',
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: lightGreyText, height: 1.2)),
                                      ],
                                    ),
                                  )
                              );
                            },
                          );
                        }
                        else {
                          return Container(color: BgGrey, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
                        }
                      }
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}


