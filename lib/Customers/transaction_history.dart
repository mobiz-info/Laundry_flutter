import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/CustomerModel/transaction_history_model.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> with SingleTickerProviderStateMixin {

  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  final CustomerRepository customerRepository = CustomerRepository();
  TransactionHistoryData? transactionHistoryData;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BgGrey,
      appBar: ScreenAppbar(text: "Transaction History",
          imagepath: "Assets/Images/transaction_history_img.svg",
        needAction: true,
        svgNeed: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final DateTime? fromDatePicked = await showDatePicker(
                          builder: (context, child) {
                            return Theme(
                                data: ThemeData().copyWith(
                                  colorScheme: const ColorScheme.light(
                                    primary: primaryColor,
                                    onPrimary: Colors.white,
                                    surface: Colors.white,
                                    onSurface: textgrey,
                                  ),
                                  dialogBackgroundColor:Colors.blue.shade50,
                                ), child: child!);
                          },
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101));
                  
                      if(fromDatePicked != null) {
                        String formattedDate = DateFormat('dd-MM-yyyy').format(fromDatePicked);
                        setState(() {
                          fromDateController.text = formattedDate;
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                    child: Container(
                      width: 108,
                      height: 39,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: primaryColor),
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Align(alignment: Alignment.center, child: Text(
                          fromDateController.text.isNotEmpty
                              ? fromDateController.text
                              : 'From Date', textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: lightGreyText))),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: InkWell( 
                    onTap: () async {
                      final DateTime? toDatePicked = await showDatePicker(
                          builder: (context, child) {
                            return Theme(
                                data: ThemeData().copyWith(
                                  colorScheme: const ColorScheme.light(
                                    primary: primaryColor,
                                    onPrimary: Colors.white,
                                    surface: Colors.white,
                                    onSurface: textgrey,
                                  ),
                                  dialogBackgroundColor:Colors.blue.shade50,
                                ), child: child!);
                          },
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101));
                  
                      if(toDatePicked != null) {
                        String formattedDate = DateFormat('dd-MM-yyyy').format(toDatePicked);
                        setState(() {
                          toDateController.text = formattedDate;
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                    child: Container(
                      width: 108,
                      height: 39,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: primaryColor),
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Align(alignment: Alignment.center, child: Text(
                          toDateController.text.isNotEmpty
                              ? toDateController.text
                              : 'To Date', textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: lightGreyText))),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if (fromDateController.text.isEmpty) {
                        snackBar(context, message: 'Please choose From Date');
                      } else if (toDateController.text.isEmpty) {
                        snackBar(context, message: 'Please choose To Date');
                      } else {
                        customerRepository.getTransactionData(token: authData.user_token!, fromDate: fromDateController.text, toDate: toDateController.text).then((value) {
                          setState(() {
                            transactionHistoryData = value.data;
                          });
                        });
                      }
                    },
                    child: Container(
                      width: 108,
                      height: 39,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        border: Border.all(color: primaryColor),
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: const Align(alignment: Alignment.center, child: Text('LOAD', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white))),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            if (transactionHistoryData != null)
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Transaction list', style: TextStyle(fontSize: 15.0, color: textgrey, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 42,
                            decoration: BoxDecoration(
                              color: Colors.grey[350],
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: TabBar(
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: primaryColor,
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: textgrey,
                              tabs: const [
                                Tab(text: 'All'),
                                Tab(text: 'Debits'),
                                Tab(text: 'Credits'),
                              ],
                              controller: tabController,
                              indicatorSize: TabBarIndicatorSize.tab,
                            ),
                          ),
                          const SizedBox(height: 18),
                          Expanded(
                            child: TabBarView(
                              controller: tabController,
                              children: [
                                transactionHistoryData?.all?.isEmpty == true ?
                                Container(color: BgGrey, child: const Center(child: Text('No Wallet Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w500))))
                                : ListView.separated(
                                  separatorBuilder: (context, index) => const Divider(color: DividerGrey),
                                  itemCount: transactionHistoryData?.all?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: transactionHistoryData?.all?[index].transferType == 'Debit' ?
                                      Image.asset('Assets/Images/arrow_up.png')
                                          : Image.asset('Assets/Images/arrow_down.png'),
                                      title: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(formatDateYear(DateTime.parse(transactionHistoryData?.all?[index].createdDate ?? '--')), style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w300)),
                                          Text('Order no: ${transactionHistoryData?.all?[index].orderOrderNumber.toString() ?? '--'}', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w300)),
                                          Text(transactionHistoryData?.all?[index].message.toString() ?? '--', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                      trailing: Text('AED ${transactionHistoryData?.all?[index].amount.toString() ?? '--'}', style: TextStyle(fontSize: 13.0, color: transactionHistoryData!.all?[index].transferType == 'Debit' ? redColor : greenColor, fontWeight: FontWeight.w500)),
                                    );
                                  },
                                ),
                                transactionHistoryData?.debitDetails?.isEmpty == true ?
                                Container(color: BgGrey, child: const Center(child: Text('No Wallet Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w500))))
                                : ListView.separated(
                                  separatorBuilder: (context, index) => const Divider(color: DividerGrey),
                                  itemCount: transactionHistoryData?.debitDetails?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: transactionHistoryData?.debitDetails?[index].transferType == 'Debit' ?
                                      Image.asset('Assets/Images/arrow_up.png')
                                          : Image.asset('Assets/Images/arrow_down.png'),
                                      title: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(formatDateYear(DateTime.parse(transactionHistoryData?.debitDetails?[index].createdDate ?? '--')), style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w300)),
                                          Text('Order no: ${transactionHistoryData?.debitDetails?[index].orderOrderNumber.toString() ?? '--'}', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w300)),
                                          Text(transactionHistoryData?.debitDetails?[index].message.toString() ?? '--', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                      trailing: Text('AED ${transactionHistoryData?.debitDetails?[index].amount.toString() ?? '--'}', style: const TextStyle(fontSize: 13.0, color: redColor, fontWeight: FontWeight.w500)),
                                    );
                                  },
                                ),
                                transactionHistoryData?.creditType?.isEmpty == true ?
                                Container(color: BgGrey, child: const Center(child: Text('No Wallet Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w500))))
                                : ListView.separated(
                                  separatorBuilder: (context, index) => const Divider(color: DividerGrey),
                                  itemCount: transactionHistoryData?.creditType?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: transactionHistoryData?.creditType?[index].transferType == 'Debit' ?
                                      Image.asset('Assets/Images/arrow_up.png')
                                          : Image.asset('Assets/Images/arrow_down.png'),
                                      title: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(formatDateYear(DateTime.parse(transactionHistoryData?.creditType?[index].createdDate ?? '--')), style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w300)),
                                          Text('Order no: ${transactionHistoryData?.creditType?[index].orderOrderNumber.toString() ?? '--'}', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w300)),
                                          Text(transactionHistoryData?.creditType?[index].message.toString() ?? '--', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                      trailing: Text('AED ${transactionHistoryData?.creditType?[index].amount.toString() ?? '--'}', style: const TextStyle(fontSize: 13.0, color: greenColor, fontWeight: FontWeight.w500)),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatDateYear(DateTime? dateTime) {
    final format = DateFormat('dd-MM-yyyy');
    return format.format(dateTime!);
  }

}

