import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BLoCs/ServiceBranchBloc/service_branch_bloc.dart';
import '../Models/ServiceBranchModel/pending_orders_model.dart';
import '../Models/ServiceBranchModel/pending_search_model.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/ServiceBranchRepo/service_branch_repo.dart';
import '../src/Color.dart';

class PendingOrders extends StatefulWidget {
  const PendingOrders({super.key});

  @override
  State<PendingOrders> createState() => _PendingOrdersState();
}

class _PendingOrdersState extends State<PendingOrders> {
  final ServiceBranchRepository serviceBranchRepository = ServiceBranchRepository();
  final TextEditingController searchPendingOrdersController = TextEditingController();
  var data;

  @override
  void dispose() {
    searchPendingOrdersController.dispose();
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
        title: const Text('Pending Orders', style: TextStyle(fontSize: 16, color: primaryColor, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: BlocProvider(
            create: (context) =>
            ServiceBranchBloc(RepositoryProvider.of<ServiceBranchRepository>(context))
              ..add(GetPendingOrdersEvent(authData.user_token.toString())),
          child: BlocBuilder<ServiceBranchBloc, ServiceBranchState>(
            builder: (context, state) {
              if (state is PendingOrdersFetching) {
                return Container(color: Colors.transparent,
                    child: const Center(child: CircularProgressIndicator(
                        color: primaryColor,
                        backgroundColor: Colors.transparent)));
              } else if(state is PendingOrdersFetched) {
                if (searchPendingOrdersController.text.isEmpty) {
                  data = state.pendingOrdersData;
                }
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: searchPendingOrdersController,
                        onChanged: (value) async {
                          searchPendingOrdersController.text = value;
                          PendingSearchModel searchResult =  await serviceBranchRepository.getSearchPendingData(
                            token: authData.user_token!, orderNum: searchPendingOrdersController.text
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
                      Text('${data?.pendingCount ?? '--'} ${data?.pendingCount == 1 ? 'order' : 'orders'} in pending list',
                          style: const TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w300)),
                      PendingOrderTableWidget(pendingOrdersData: state.pendingOrdersData, searchPendingOrdersController: searchPendingOrdersController),
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

class PendingOrderTableWidget extends StatelessWidget {
  final PendingOrdersData? pendingOrdersData;
  final TextEditingController searchPendingOrdersController;
  final ServiceBranchRepository serviceBranchRepository = ServiceBranchRepository();

  PendingOrderTableWidget({super.key, this.pendingOrdersData, required this.searchPendingOrdersController});

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
          4: FlexColumnWidth(1.1),
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

    pendingOrdersData?.pendingData?.asMap().forEach((index, pendingData) {
      rows.add(
        buildDataRow(context, index, pendingData),
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

  TableRow buildDataRow(BuildContext context, int index, PendingData pendingData) {
    final Color backgroundColor = index.isEven ? primaryColor.withOpacity(0.2) : tableLightGrey;
    final bool matchesSearch = pendingData.orderNumber?.toLowerCase().contains(searchPendingOrdersController.text.toLowerCase()) ?? false;

    if (searchPendingOrdersController.text.isEmpty || matchesSearch) {
      return TableRow(
        decoration: BoxDecoration(color: backgroundColor),
        children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(pendingData.orderNumber?.toUpperCase() ?? '--', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
                height: 26,
                decoration: pendingData.orderType == "Normal" ?
                BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(color: primaryColor),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ) : pendingData.orderType == "Express" ?
                BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(color: primaryColor),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ) :
                BoxDecoration(
                  color: darkOrange,
                  border: Border.all(color: darkOrange),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: Center(child: Text(pendingData.orderType ?? '--', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)))),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(pendingData.staffName ?? '--', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(pendingData.deliveryTime ?? '--', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.only(right: 4),
              child: InkWell(
                onTap: () async {
                  await serviceBranchRepository.getPendingStatus(token: authData.user_token.toString(), orderNum: pendingData.orderNumber).then((value) {
                    context.read<ServiceBranchBloc>().add(GetPendingOrdersEvent(authData.user_token.toString()));
                  });
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
                    child: const Center(child: Text('Complete', textAlign: TextAlign.center, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white)))),
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

