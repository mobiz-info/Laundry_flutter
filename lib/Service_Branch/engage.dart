import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BLoCs/ServiceBranchBloc/service_branch_bloc.dart';
import '../Models/ServiceBranchModel/engage_orders_model.dart';
import '../Models/ServiceBranchModel/engage_search_model.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/ServiceBranchRepo/service_branch_repo.dart';
import '../src/Color.dart';

class Engage extends StatefulWidget {
  const Engage({super.key});

  @override
  State<Engage> createState() => _EngageState();
}

class _EngageState extends State<Engage> {
  final ServiceBranchRepository serviceBranchRepository = ServiceBranchRepository();
  final TextEditingController searchEngageOrdersController = TextEditingController();
  var data;

  @override
  void dispose() {
    searchEngageOrdersController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BgGrey,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {Navigator.pop(context);},
            child: const Icon(Icons.arrow_back, color: primaryColor)),
        surfaceTintColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(side: BorderSide(width: 1, color: primaryColor),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
        centerTitle: true,
        title: const Text('Engage Orders', style: TextStyle(fontSize: 20, color: primaryColor, fontWeight: FontWeight.w400)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: BlocProvider(
          create: (context) =>
          ServiceBranchBloc(RepositoryProvider.of<ServiceBranchRepository>(context))
            ..add(GetEngageOrdersEvent(authData.user_token.toString())),
          child: BlocBuilder<ServiceBranchBloc, ServiceBranchState>(
              builder: (context, state) {
                if (state is EngageOrdersFetching) {
                  return Container(color: Colors.transparent,
                      child: const Center(child: CircularProgressIndicator(
                          color: primaryColor,
                          backgroundColor: Colors.transparent)));
                } else if (state is EngageOrdersFetched) {
                  if (searchEngageOrdersController.text.isEmpty) {
                    data = state.engageOrdersData;
                  }
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: searchEngageOrdersController,
                          onChanged: (value) async {
                            searchEngageOrdersController.text = value;
                            EngageSearchModel searchResult =  await serviceBranchRepository.getSearchEngageData(
                                token: authData.user_token!, orderNum: searchEngageOrdersController.text
                            );
                            if(searchResult.data != null) {
                              data = searchResult.data;
                            }
                            setState(() {});
                          },
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Search a order here',
                            hintStyle: TextStyle(color: lightGreyText, fontSize: 15, fontWeight: FontWeight.w400),
                            prefixIcon: Icon(Icons.search_outlined, color: lightGreyText),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: lightGreyText)),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: lightGreyText)),
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Text('${data?.ordercount ?? '--'} ${data?.ordercount == 1 ? 'order' : 'orders'} to engage',
                        style: const TextStyle(fontSize: 15, color: textgrey, fontWeight: FontWeight.w300)),
                        EngageOrderTableWidget(engageOrdersData: state.engageOrdersData, searchEngageOrdersController: searchEngageOrdersController),
                      ],
                    ),
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

class EngageOrderTableWidget extends StatelessWidget {
  final EngageOrdersData? engageOrdersData;
  final TextEditingController searchEngageOrdersController;
  final ServiceBranchRepository serviceBranchRepository = ServiceBranchRepository();

  EngageOrderTableWidget({super.key, this.engageOrdersData, required this.searchEngageOrdersController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(1.0),
          1: FlexColumnWidth(1.0),
          2: FlexColumnWidth(1.0),
          3: FlexColumnWidth(1.0),
          4: FlexColumnWidth(1.0),
        },
        children: buildTableRows(context),
      ),
    );
  }

  List<TableRow> buildTableRows(BuildContext context) {
    List<TableRow> rows = [];

    rows.add(
      buildHeaderRow(),
    );

    engageOrdersData?.order?.asMap().forEach((index, order) {
      rows.add(
        buildDataRow(context, index, order),
      );
    });
    return rows;
  }

  TableRow buildHeaderRow() {
    return TableRow(
      decoration: const BoxDecoration(color: tableLightGrey),
        children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text('Order No', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: tableGreyText)),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text('Order type', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: tableGreyText)),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text('Staff', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: tableGreyText)),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text('Delivery time', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: tableGreyText)),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text('Action', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: tableGreyText)),
            ),
          ),
        ],
      );
  }

  TableRow buildDataRow(BuildContext context, int index, Order order) {
    final Color backgroundColor = index.isEven ? primaryColor.withOpacity(0.2) : tableLightGrey;
    final bool matchesSearch = order.orderNumber?.toLowerCase().contains(searchEngageOrdersController.text.toLowerCase()) ?? false;

    if (searchEngageOrdersController.text.isEmpty || matchesSearch) {
      return TableRow(
        decoration: BoxDecoration(color: backgroundColor),
        children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(order.orderNumber?.toUpperCase() ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: textgrey)),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
                height: 26,
                decoration: order.orderType == 'Normal' ?
                BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(color: primaryColor),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ) : order.orderType == 'Express' ?
                BoxDecoration(
                  color: lightOrange,
                  border: Border.all(color: lightOrange),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ) :
                BoxDecoration(
                  color: darkOrange,
                  border: Border.all(color: darkOrange),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: Center(child: Text(order.orderType ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: textgrey)))),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(order.staffName ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: textgrey)),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(order.deliveryTime ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: textgrey)),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: InkWell(
                onTap: () async {
                  await serviceBranchRepository.getEngageStatus(token: authData.user_token.toString(), orderNum: order.orderNumber).then((value) {
                    context.read<ServiceBranchBloc>().add(GetEngageOrdersEvent(authData.user_token!));});
                },
                child: Container(
                    height: 26,
                    decoration: ShapeDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.topCenter,
                        colors: [Color(0xFF124f18), Color(0xFF588D59)],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Center(child: Text('Engage', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white)))),
              ),
            ),
          ),
        ],
      );
    }
    else {
      return TableRow(
        decoration: BoxDecoration(color: backgroundColor),
        children: List.generate(5, (index) => TableCell(
            child: Container()),
        ),
      );
    }

  }
}

