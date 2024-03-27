import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Repositories/ServiceBranchRepo/service_branch_repo.dart';

import '../BLoCs/ServiceBranchBloc/service_branch_bloc.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../src/Color.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus({Key? key}) : super(key: key);

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus>  with SingleTickerProviderStateMixin {

  late TabController tabController;
  final ServiceBranchRepository serviceBranchRepository = ServiceBranchRepository();
  String searchByMobileNum = '';
  String searchByOrderNum = '';

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(handleTabChange);
  }

  @override
  void dispose() {
    tabController.removeListener(handleTabChange);
    tabController.dispose();
    super.dispose();
  }

  void handleTabChange() {
    searchByMobileNum = '';
    searchByOrderNum = '';
  }

  void updateSearchMobileNum(String newSearchMobileNum) {
    setState(() {
      searchByMobileNum = newSearchMobileNum;
      serviceBranchRepository.getSerOrderStatusData(
          token: authData.user_token!,
          mobileNum: searchByMobileNum,
          orderNum: '');
      tabController.animateTo(0);
    });
  }

  void updateSearchOrderNum(String newSearchOrderNum) {
    setState(() {
      searchByOrderNum = newSearchOrderNum;
      serviceBranchRepository.getSerOrderStatusData(
          token: authData.user_token!,
          mobileNum: '',
          orderNum: searchByOrderNum);
      tabController.animateTo(1);
    });
  }

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
        title: const Text('Order Status', style: TextStyle(fontSize: 16, color: primaryColor, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Search order by', style: TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w300)),
            const SizedBox(height: 8),
            TabBar(
              indicatorColor: primaryColor,
              labelColor: primaryColor,
              unselectedLabelColor: textgrey,
              tabs: const [
                Tab(text: 'Mobile Number'),
                Tab(text: 'Order Number'),
              ],
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: TabBarView(
                key: UniqueKey(),
                controller: tabController,
                children: [
                  Column(
                    children: [
                      TextField(
                        onChanged: updateSearchMobileNum,
                        style: const TextStyle(color: textgrey, fontSize: 13, fontWeight: FontWeight.w400),
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Enter mobile number here',
                          hintStyle: TextStyle(color: lightGreyText, fontSize: 13, fontWeight: FontWeight.w400),
                          prefixIcon: Icon(Icons.search_outlined, color: lightGreyText, size: 22),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: formBorderColor)),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: formBorderColor)),
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Expanded(
                        child: BlocProvider(
                            create: (context) =>
                            ServiceBranchBloc(RepositoryProvider.of<ServiceBranchRepository>(context))
                              ..add(GetSerOrderStatusEvent(authData.user_token.toString(), searchByMobileNum, '')),
                          child: BlocBuilder<ServiceBranchBloc, ServiceBranchState>(
                              builder: (context, state) {
                                if (state is SerOrderStatusFetching) {
                                  return Container(color: Colors.transparent,
                                      child: const Center(child: CircularProgressIndicator(
                                          color: primaryColor,
                                          backgroundColor: Colors.transparent)));
                                } else if (state is SerOrderStatusFetched) {
                                  final data = state.orderStatusData;
                                  return ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return const Divider(color: DividerGrey, thickness: 1);
                                    },
                                    itemCount: data!.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Order Number is ${data[index].orderNumber}', style: const TextStyle(fontSize: 13.0, color: textgrey, fontWeight: FontWeight.w400)),
                                          const SizedBox(height: 4),
                                          Text('The Order Status is ${data[index].status}', style: const TextStyle(fontSize: 13.0, color: textgrey, fontWeight: FontWeight.w400)),
                                        ],
                                      );
                                    },
                                  );
                                } else if (searchByMobileNum.isEmpty == true) {
                                  return Container();
                                }
                                else {
                                  return Container(color: BgGrey, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
                                }
                              }
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextField(
                        onChanged: updateSearchOrderNum,
                        style: const TextStyle(color: textgrey, fontSize: 13, fontWeight: FontWeight.w400),
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Enter order number here',
                          hintStyle: TextStyle(color: lightGreyText, fontSize: 13, fontWeight: FontWeight.w400),
                          prefixIcon: Icon(Icons.search_outlined, color: lightGreyText, size: 22),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: formBorderColor)),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: formBorderColor)),
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Expanded(
                        child: BlocProvider(
                          create: (context) =>
                          ServiceBranchBloc(RepositoryProvider.of<ServiceBranchRepository>(context))
                            ..add(GetSerOrderStatusEvent(authData.user_token.toString(), '', searchByOrderNum)),
                          child: BlocBuilder<ServiceBranchBloc, ServiceBranchState>(
                              builder: (context, state) {
                                if (state is SerOrderStatusFetching) {
                                  return Container(color: Colors.transparent,
                                      child: const Center(child: CircularProgressIndicator(
                                          color: primaryColor,
                                          backgroundColor: Colors.transparent)));
                                } else if (state is SerOrderStatusFetched) {
                                  final data = state.orderStatusData;
                                  return ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return const Divider(color: DividerGrey, thickness: 1);
                                    },
                                    itemCount: data!.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Order Number is ${data[index].orderNumber}', style: const TextStyle(fontSize: 13.0, color: textgrey, fontWeight: FontWeight.w400)),
                                          const SizedBox(height: 4),
                                          Text('The Order Status is ${data[index].status}', style: const TextStyle(fontSize: 13.0, color: textgrey, fontWeight: FontWeight.w400)),
                                        ],
                                      );
                                    },
                                  );
                                } else if (searchByOrderNum.isEmpty == true) {
                                  return Container();
                                }
                                else {
                                  return Container(color: BgGrey, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
                                }
                              }
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}

