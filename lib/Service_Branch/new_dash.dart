import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BLoCs/ServiceBranchBloc/service_branch_bloc.dart';
import '../Models/ServiceBranchModel/new_order_dash_search_model.dart';
import '../Models/ServiceBranchModel/new_order_model.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/ServiceBranchRepo/service_branch_repo.dart';
import '../src/Color.dart';

class NewDash extends StatefulWidget {
  const NewDash({Key? key}) : super(key: key);

  @override
  State<NewDash> createState() => _NewDashState();
}

class _NewDashState extends State<NewDash> {

  final ServiceBranchRepository serviceBranchRepository = ServiceBranchRepository();
  final TextEditingController searchNewOrdersController = TextEditingController();
  var data;

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
        title: const Text('New Orders', style: TextStyle(fontSize: 16, color: primaryColor, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: BlocProvider(
          create: (context) =>
          ServiceBranchBloc(RepositoryProvider.of<ServiceBranchRepository>(context))
            ..add(GetNewOrdersEvent(authData.user_token.toString())),
          child: BlocBuilder<ServiceBranchBloc, ServiceBranchState>(
              builder: (context, state) {
                if (state is NewOrderFetching) {
                  return Container(color: Colors.transparent,
                      child: const Center(child: CircularProgressIndicator(
                          color: primaryColor,
                          backgroundColor: Colors.transparent)));
                } else if (state is NewOrderFetched) {
                  if (searchNewOrdersController.text.isEmpty) {
                    data = state.newOrderData;
                  }
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: searchNewOrdersController,
                          onChanged: (value) async {
                            searchNewOrdersController.text = value;
                            NewOrderDashSearchModel searchResult =  await serviceBranchRepository.getSearchNewOrderData(
                                token: authData.user_token!, orderNum: searchNewOrdersController.text
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
                        Text('${data?.ordercount ?? '--'} ${data?.ordercount == 1 ? 'order' : 'orders'} to start',
                            style: const TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w300)),
                        NewOrderTableWidget(newOrderData: state.newOrderData, searchNewOrdersController: searchNewOrdersController),
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

class NewOrderTableWidget extends StatelessWidget {
  final NewOrderData? newOrderData;
  final TextEditingController searchNewOrdersController;
  final ServiceBranchRepository serviceBranchRepository = ServiceBranchRepository();

  NewOrderTableWidget({super.key, this.newOrderData, required this.searchNewOrdersController});

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

    newOrderData?.order?.asMap().forEach((index, order) {
      rows.add(
        buildDataRow(context, index, order),
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

  TableRow buildDataRow(BuildContext context, int index, Order order) {
    final Color backgroundColor = index.isEven ? primaryColor.withOpacity(0.2) : tableLightGrey;
    final bool matchesSearch = order.orderNumber?.toLowerCase().contains(searchNewOrdersController.text.toLowerCase()) ?? false;

    if (searchNewOrdersController.text.isEmpty || matchesSearch) {
      return TableRow(
        decoration: BoxDecoration(color: backgroundColor),
        children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(order.orderNumber?.toUpperCase() ?? '--', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)),
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
                child: Center(child: Text(order.orderType ?? '--', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)))),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(order.staffName ?? '--', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(order.deliveryTime ?? '--', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: InkWell(
                onTap: () async {
                  await serviceBranchRepository.getNewOrderStatus(token: authData.user_token.toString(), orderNum: order.orderNumber).then((value) {
                    context.read<ServiceBranchBloc>().add(GetNewOrdersEvent(authData.user_token!));});
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
                    child: const Center(child: Text('Start', textAlign: TextAlign.center, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white)))),
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

