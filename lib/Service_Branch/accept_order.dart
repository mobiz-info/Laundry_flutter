import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Models/ServiceBranchModel/accept_search_model.dart';

import '../BLoCs/ServiceBranchBloc/service_branch_bloc.dart';
import '../Models/ServiceBranchModel/accept_orders_model.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/ServiceBranchRepo/service_branch_repo.dart';
import '../src/Color.dart';

class AcceptOrder extends StatefulWidget {
  const AcceptOrder({Key? key}) : super(key: key);

  @override
  State<AcceptOrder> createState() => _AcceptOrderState();
}

class _AcceptOrderState extends State<AcceptOrder> {

  final ServiceBranchRepository serviceBranchRepository = ServiceBranchRepository();
  final TextEditingController searchAcceptOrdersController = TextEditingController();
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
        title: const Text('Accept Orders', style: TextStyle(fontSize: 16, color: primaryColor, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: BlocProvider(
          create: (context) =>
          ServiceBranchBloc(RepositoryProvider.of<ServiceBranchRepository>(context))
            ..add(GetAcceptOrdersEvent(authData.user_token.toString())),
          child: BlocBuilder<ServiceBranchBloc, ServiceBranchState>(
              builder: (context, state) {
                if (state is AcceptOrdersFetching) {
                  return Container(color: Colors.transparent,
                      child: const Center(child: CircularProgressIndicator(
                          color: primaryColor,
                          backgroundColor: Colors.transparent)));
                } else if (state is AcceptOrdersFetched) {
                  if (searchAcceptOrdersController.text.isEmpty) {
                    data = state.acceptOrdersData;
                  }
                  //final data = state.acceptOrdersData;
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: searchAcceptOrdersController,
                          onChanged: (value) async {
                            searchAcceptOrdersController.text = value;
                            AcceptSearchModel searchResult =  await serviceBranchRepository.getSearchAcceptData(
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
                        Text('${data?.acceptOrdersCount ?? '--'} ${data?.acceptOrdersCount == 1 ? 'order' : 'orders'} to accept',
                            style: const TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w300)),
                        AcceptOrderTableWidget(acceptOrdersData: state.acceptOrdersData, searchAcceptOrdersController: searchAcceptOrdersController),
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

class AcceptOrderTableWidget extends StatelessWidget {
  final AcceptOrdersData? acceptOrdersData;
  final TextEditingController searchAcceptOrdersController;
  final ServiceBranchRepository serviceBranchRepository = ServiceBranchRepository();

  AcceptOrderTableWidget({super.key, this.acceptOrdersData, required this.searchAcceptOrdersController});

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

    acceptOrdersData?.acceptOrders?.asMap().forEach((index, acceptOrders) {
      rows.add(
        buildDataRow(context, index, acceptOrders),
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

  TableRow buildDataRow(BuildContext context, int index, AcceptOrders acceptOrders) {

    final bool matchesSearch = acceptOrders.orderNumber?.toLowerCase().contains(searchAcceptOrdersController.text.toLowerCase()) ?? false;
    final Color backgroundColor = index.isEven ? primaryColor.withOpacity(0.2) : tableLightGrey;

    if (searchAcceptOrdersController.text.isEmpty || matchesSearch) {
      return TableRow(
        decoration: BoxDecoration(color: backgroundColor),
        children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(acceptOrders.orderNumber?.toUpperCase() ?? '--', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
                height: 22,
                decoration: acceptOrders.orderType == 'Normal' ?
                BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(color: primaryColor),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ) : acceptOrders.orderType == 'Express' ?
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
                child: Center(child: Text(acceptOrders.orderType ?? '--', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)))),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(acceptOrders.staffName ?? '--', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(acceptOrders.deliveryTime ?? '--', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey)),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: InkWell(
                onTap: () async {
                  await serviceBranchRepository.getAcceptStatus(token: authData.user_token.toString(), orderNum: acceptOrders.orderNumber).then((value) {
                    context.read<ServiceBranchBloc>().add(GetAcceptOrdersEvent(authData.user_token.toString()));
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
                    child: const Center(child: Text('Accept', textAlign: TextAlign.center, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white)))),
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

