import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BLoCs/ServiceBranchBloc/service_branch_bloc.dart';
import '../Models/ServiceBranchModel/completed_order_search_model.dart';
import '../Models/ServiceBranchModel/completed_orders_model.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/ServiceBranchRepo/service_branch_repo.dart';
import '../src/Color.dart';

class CompletedOrders extends StatefulWidget {
  const CompletedOrders({Key? key}) : super(key: key);

  @override
  State<CompletedOrders> createState() => _CompletedOrdersState();
}

class _CompletedOrdersState extends State<CompletedOrders> {
  final ServiceBranchRepository serviceBranchRepository = ServiceBranchRepository();
  final TextEditingController searchAcceptOrdersController = TextEditingController();
  var data;

  @override
  void dispose() {
    searchAcceptOrdersController.dispose();
    super.dispose();
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
        title: const Text('Completed Orders', style: TextStyle(fontSize: 16, color: primaryColor, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: BlocProvider(
            create: (context) =>
            ServiceBranchBloc(RepositoryProvider.of<ServiceBranchRepository>(context))
              ..add(GetCompletedOrdersEvent(authData.user_token.toString())),
          child: BlocBuilder<ServiceBranchBloc, ServiceBranchState>(
            builder: (context, state) {
              if (state is CompletedOrdersFetching) {
                return Container(color: Colors.transparent,
                    child: const Center(child: CircularProgressIndicator(
                        color: primaryColor,
                        backgroundColor: Colors.transparent)));
              } else if (state is CompletedOrdersFetched) {
                if (searchAcceptOrdersController.text.isEmpty) {
                  data = state.completedOrdersData;
                }
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: searchAcceptOrdersController,
                        onChanged: (value) async {
                          searchAcceptOrdersController.text = value;
                          CompletedOrderSearchModel searchResult =  await serviceBranchRepository.getSearchCompletedData(
                              token: authData.user_token!, orderNum: searchAcceptOrdersController.text
                          );
                          if(searchResult.data != null) {
                            data = searchResult.data;
                          }
                          setState(() {});
                        },
                        style: const TextStyle(color: textgrey, fontSize: 13, fontWeight: FontWeight.w400),
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Search a order here',
                          hintStyle: TextStyle(color: lightGreyText, fontSize: 13, fontWeight: FontWeight.w400),
                          prefixIcon: Icon(Icons.search_outlined, color: lightGreyText, size: 22),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: formBorderColor)),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: formBorderColor)),
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text('${data?.completedCount ?? '--'} ${data?.completedCount == 1 ? 'order' : 'orders'} in completed orders list', style: const TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w300)),
                      CompletedOrderTableWidget(completedOrdersData: state.completedOrdersData, searchAcceptOrdersController: searchAcceptOrdersController)
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

class CompletedOrderTableWidget extends StatelessWidget {
  final CompletedOrdersData? completedOrdersData;
  final TextEditingController searchAcceptOrdersController;
  final ServiceBranchRepository serviceBranchRepository = ServiceBranchRepository();

  CompletedOrderTableWidget({super.key, this.completedOrdersData, required this.searchAcceptOrdersController});

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

    completedOrdersData?.completed?.asMap().forEach((index, completed) {
      rows.add(
        buildDataRow(context, index, completed),
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

  TableRow buildDataRow(BuildContext context, int index, Completed completed) {
    final Color backgroundColor = index.isEven ? primaryColor.withOpacity(0.2) : tableLightGrey;
    final bool matchesSearch = completed.orderNumber?.toLowerCase().contains(searchAcceptOrdersController.text.toLowerCase()) ?? false;

    if (searchAcceptOrdersController.text.isEmpty || matchesSearch) {
      return TableRow(
        decoration: BoxDecoration(color: backgroundColor),
        children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(completed.orderNumber ?? '--', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
                height: 26,
                decoration: completed.orderType == 'Normal' ?
                BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(color: primaryColor),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ) : completed.orderType == 'Express' ?
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
                child: Center(child: Text(completed.orderType ?? '--', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)))),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(completed.staffName ?? '--', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(completed.deliveryTime ?? '--', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: InkWell(
                onTap: () async {
                  await serviceBranchRepository.getCompletedStatus(token: authData.user_token.toString(), orderNum: completed.orderNumber).then((value) {
                    context.read<ServiceBranchBloc>().add(GetCompletedOrdersEvent(authData.user_token.toString()));
                  });
                },
                child: Container(
                    height: 46,
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
                    child: const Center(child: Text('Generate Invoice', textAlign: TextAlign.center, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white)))),
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

