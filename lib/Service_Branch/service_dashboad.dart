import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_falcon/BLoCs/ServiceBranchBloc/service_branch_bloc.dart';
import 'package:golden_falcon/Loginscreen.dart';
import 'package:golden_falcon/Repositories/ServiceBranchRepo/service_branch_repo.dart';
import 'package:golden_falcon/Service_Branch/accept_order.dart';
import 'package:golden_falcon/Service_Branch/generate_invoice.dart';
import 'package:golden_falcon/Service_Branch/pending_orders.dart';
import 'package:golden_falcon/Service_Branch/ready_delivery.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/ServiceBranchModel/service_dashboard_model.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../src/Color.dart';
import 'completed_orders.dart';
import 'engage.dart';
import 'new_dash.dart';
import 'new_order.dart';
import 'order_status.dart';

class ServiceDashboard extends StatefulWidget {
  const ServiceDashboard({super.key});

  @override
  State<ServiceDashboard> createState() => _ServiceDashboardState();
}

class _ServiceDashboardState extends State<ServiceDashboard> {

  Future<bool> showExitPopup() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        elevation: 0,
        actionsAlignment: MainAxisAlignment.center,
        title: const Padding(
          padding: EdgeInsets.only(top: 18),
          child: Text('Exit App', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: textgrey, fontWeight: FontWeight.w600)),
        ),
        content: const SizedBox(
            height: 50,
            child: Center(
              child: Padding(padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Text('Do you Really Want to', textAlign: TextAlign.center,  style: TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w400)),
                    Text('Close the App ?', textAlign: TextAlign.center,  style: TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w400))
                  ],
                ),
              ),
            )),
        actions:[
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  height: 42, width: 120,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, surfaceTintColor: Colors.white, elevation: 0,
                      side: const BorderSide(width: 1.6, color: primaryColor),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    ),
                    child: const Text('Cancel', style: TextStyle(fontSize: 14, color: textgrey)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 42, width: 120,
                  child: ElevatedButton(
                    onPressed: () async {
                      authData.clearData();
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.clear();
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()),(route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor, surfaceTintColor: Colors.white, elevation: 0,
                      side: const BorderSide(width: 1.6, color: primaryColor),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    ),
                    child: const Text('Yes', style: TextStyle(fontSize: 14, color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
        ],
      ),
    )??false;
  }

  @override
  Widget build(BuildContext context) {

    int currentIndex = 0;

    return BlocProvider(
        create: (context) =>
        ServiceBranchBloc(RepositoryProvider.of<ServiceBranchRepository>(context))
          ..add(GetServiceDashEvent(authData.user_token.toString())),
      child: Scaffold(
        backgroundColor: BgGrey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.white,
          elevation: 0,
          backgroundColor: Colors.white,
          toolbarHeight: 159,
          shape: const RoundedRectangleBorder(side: BorderSide(width: 1, color: primaryColor),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          ),
          title: Center(child: Image.asset('Assets/Images/golden_falcon_logo.png')),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          iconSize: 20,
          currentIndex: currentIndex,
          showUnselectedLabels: true,
          unselectedItemColor: textgrey,
          selectedItemColor: Colors.transparent,
          selectedLabelStyle: const TextStyle(fontSize: 10, color: textgrey),
          unselectedLabelStyle: const TextStyle(fontSize: 10, color: textgrey),
          onTap: (int index) {
            debugPrint('index $index');
            setState(() {
              currentIndex = index;
            });
            switch(index) {
              case 0:
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ServiceDashboard()));
                break;
              case 1:
                showExitPopup();
                break;
            }
            // context.read<MainCubit>().changeIndex(index);
          },
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset('Assets/Images/home_bottombar_icon.png'),
              label: 'Home',
              activeIcon: Container(
                  decoration: const BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child:Image.asset('Assets/Images/home_bottombar_icon.png'),
                  )
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('Assets/Images/exit_icon.svg'),
              label: 'Exit',
              activeIcon: Container(
                  decoration: const BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset('Assets/Images/exit_icon.svg'),
                  )
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: BlocBuilder<ServiceBranchBloc, ServiceBranchState>(
                builder: (context, state) {
                  if (state is ServiceDashFetching) {
                    return Container(color: Colors.transparent,
                        child: const Center(child: CircularProgressIndicator(
                            color: primaryColor,
                            backgroundColor: Colors.transparent)));
                  } else if (state is ServiceDashFetched) {
                    final data = state.serviceDashboardData;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Service Dashboard', style: TextStyle(fontSize: 16, color: primaryColor, fontWeight: FontWeight.w500)),
                        // const SizedBox(height: 12),
                        // const Text('Hai User', style: TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w300)),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: DashboardBox(
                                dataNum: data?.dashboardCounts?.acceptOrders.toString() ?? '--', dataName: 'Accept Orders',
                                onPressed: () async {
                                  await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AcceptOrder())).then((value) {
                                    context.read<ServiceBranchBloc>().add(GetServiceDashEvent(authData.user_token.toString()));
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: DashboardBox(
                                dataNum: data?.dashboardCounts?.dashboardCountsNew.toString() ?? '--', dataName: 'New',
                                onPressed: () async {
                                  await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NewDash())).then((value) {
                                    context.read<ServiceBranchBloc>().add(GetServiceDashEvent(authData.user_token.toString()));
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: DashboardBox(
                                dataNum: data?.dashboardCounts?.pending.toString() ?? '--', dataName: 'Pending',
                                onPressed: () async {
                                  await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PendingOrders())).then((value) {
                                    context.read<ServiceBranchBloc>().add(GetServiceDashEvent(authData.user_token.toString()));
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: DashboardBox(
                                dataNum: data?.dashboardCounts?.completed.toString() ?? '--', dataName: 'Completed',
                                onPressed: () async {
                                  await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CompletedOrders())).then((value) {
                                    context.read<ServiceBranchBloc>().add(GetServiceDashEvent(authData.user_token.toString()));
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: DashboardBox(
                                dataNum: data?.dashboardCounts?.readyForDelivery.toString() ?? '--', dataName: 'Ready for Delivery',
                                onPressed: () async {
                                  await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ReadyDelivery())).then((value) {
                                    context.read<ServiceBranchBloc>().add(GetServiceDashEvent(authData.user_token.toString()));
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 22),
                        SizedBox(
                          height: 38,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GenerateInvoice()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              surfaceTintColor: primaryColor,
                              elevation: 0,
                              side: const BorderSide(width: 2.0, color: Colors.white),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9),
                              ),
                            ),
                            child: const Text('Generate Invoice', style: TextStyle(fontSize: 13.0, color: Colors.white, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 38,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OrderStatus()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    surfaceTintColor: primaryColor,
                                    elevation: 0,
                                    side: const BorderSide(width: 2.0, color: Colors.white),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9),
                                    ),
                                  ),
                                  child: const Text('Order Status', style: TextStyle(fontSize: 13.0, color: Colors.white, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: SizedBox(
                                height: 38,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ServiceNewOrder()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    surfaceTintColor: primaryColor,
                                    elevation: 0,
                                    side: const BorderSide(width: 2.0, color: Colors.white),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9),
                                    ),
                                  ),
                                  child: const Text('New Order', style: TextStyle(fontSize: 13.0, color: Colors.white, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   height: 38,
                              //   child: ElevatedButton(
                              //     onPressed: () {
                              //       Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Engage()));
                              //     },
                              //     style: ElevatedButton.styleFrom(
                              //       backgroundColor: primaryColor,
                              //       surfaceTintColor: primaryColor,
                              //       elevation: 0,
                              //       side: const BorderSide(width: 2.0, color: Colors.white),
                              //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9),
                              //       ),
                              //     ),
                              //     child: const Text('Engage', style: TextStyle(fontSize: 13.0, color: Colors.white, fontWeight: FontWeight.w500),
                              //     ),
                              //   ),
                              // ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        OrderTableWidget(serviceDashboardData: state.serviceDashboardData),
                        const SizedBox(height: 18),
                        const Text('Category wise orders', style: TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w500)),
                        CategoryTableWidget(serviceDashboardData: state.serviceDashboardData)
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
      ),
    );
  }
}

class DashboardBox extends StatelessWidget {
  final String dataNum;
  final String dataName;
  final void Function() onPressed;

  const DashboardBox({super.key, required this.dataNum, required this.dataName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 90, width: 63,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: primaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 46,
                alignment: Alignment.center,
                child: Text(dataNum, textAlign: TextAlign.center, style: const TextStyle(fontSize: 25, color: primaryColor, fontWeight: FontWeight.w600))),
            const Divider(color: primaryColor, thickness: 1, height: 0),
            Expanded(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Text(dataName, textAlign: TextAlign.center, style: const TextStyle(fontSize: 9, color: textgrey, fontWeight: FontWeight.w400)))),
          ],
        ),
      ),
    );
  }
}

class OrderTableWidget extends StatelessWidget {
  final ServiceDashboardData? serviceDashboardData;
  const OrderTableWidget({super.key, this.serviceDashboardData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(1.4),
          1: FlexColumnWidth(1.0),
          2: FlexColumnWidth(1.0),
          3: FlexColumnWidth(1.0),
          4: FlexColumnWidth(1.0),
        },
        children: [
          TableRow(
            children: [
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('Order Type', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: tableGreyText)),
                ),
              ),
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('New', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: tableGreyText)),
                ),
              ),
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('Pending', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: tableGreyText)),
                ),
              ),
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('Processing', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: tableGreyText)),
                ),
              ),
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('Completed', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: tableGreyText)),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 26,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: primaryColor),
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: const Center(child: Text('Normal', textAlign: TextAlign.center, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)))),
                ),
              ),
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text((serviceDashboardData?.normal?.expressNew ?? '--').toString(), textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)),
                ),
              ),
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text((serviceDashboardData?.normal?.pending ?? '--').toString(), textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)),
                ),
              ),
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text((serviceDashboardData?.normal?.processing ?? '--').toString(), textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)),
                ),
              ),
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text((serviceDashboardData?.normal?.completed ?? '--').toString(), textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: textgrey)),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 26,
                      decoration: BoxDecoration(
                        color: lightOrange,
                        border: Border.all(color: lightOrange),
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: const Center(child: Text('Express', textAlign: TextAlign.center, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)))),
                ),
              ),
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text((serviceDashboardData?.express?.expressNew ?? '--').toString(), textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)),
                ),
              ),
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text((serviceDashboardData?.express?.pending ?? '--').toString(), textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)),
                ),
              ),
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text((serviceDashboardData?.express?.processing ?? '--').toString(), textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)),
                ),
              ),
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text((serviceDashboardData?.express?.completed ?? '--').toString(), textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 26,
                      decoration: BoxDecoration(
                        color: darkOrange,
                        border: Border.all(color: darkOrange),
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: const Center(child: Text('Urgent', textAlign: TextAlign.center, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)))),
                ),
              ),
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text((serviceDashboardData?.urgent?.expressNew?? '--').toString(), textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)),
                ),
              ),
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text((serviceDashboardData?.urgent?.pending?? '--').toString(), textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)),
                ),
              ),
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text((serviceDashboardData?.urgent?.processing?? '--').toString(), textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)),
                ),
              ),
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text((serviceDashboardData?.urgent?.completed?? '--').toString(), textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryTableWidget extends StatelessWidget {
  final ServiceDashboardData? serviceDashboardData;

  const CategoryTableWidget({super.key, this.serviceDashboardData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(1.4),
          1: FlexColumnWidth(1.0),
          2: FlexColumnWidth(1.0),
          3: FlexColumnWidth(1.0),
          4: FlexColumnWidth(1.0),
        },
        children: buildTableRows(),
      ),
    );
  }

  List<TableRow> buildTableRows() {
    List<TableRow> rows = [];

    rows.add(
      buildHeaderRow(),
    );

    serviceDashboardData?.category?.asMap().forEach((index, category) {
      rows.add(
        buildDataRow(index, category),
      );
    });
    return rows;
  }

  TableRow buildHeaderRow() {
    return TableRow(
      decoration: const BoxDecoration(color: Colors.white),
      children: [
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: const Text('Category', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: tableGreyText)),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: const Text('New', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: tableGreyText)),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: const Text('Pending', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: tableGreyText)),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: const Text('Processing', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: tableGreyText)),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: const Text('Completed', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: tableGreyText)),
          ),
        ),
      ],
    );
  }

  TableRow buildDataRow(int index, Category category) {
    final Color backgroundColor = index.isEven ? primaryColor.withOpacity(0.2) : tableLightGrey;

    return TableRow(
      decoration: BoxDecoration(color: backgroundColor),
      children: [
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(category.title ?? '--',
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(category.data?.expressNew.toString() ?? '--',
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey),
              ),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(category.data?.pending.toString() ?? '--',
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey),
              ),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(category.data?.processing.toString() ?? '--',
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey),
              ),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(category.data?.completed.toString() ?? '--',
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

