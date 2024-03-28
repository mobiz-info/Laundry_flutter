import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Customers/recharge_wallet.dart';
import 'package:intl/intl.dart';

import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';

class Wallet extends StatefulWidget {
  final String walletBalance;

  const Wallet({Key? key, required this.walletBalance}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> with SingleTickerProviderStateMixin {

  late TabController tabController;
  final String? tabName = '';

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
        ..add(GetWalletTransactionEvent(authData.user_token!, authData.user_id!)),
      child: Scaffold(
        backgroundColor: BgGrey,
        appBar: ScreenAppbar(text: "My Wallet", imagepath: "Assets/Images/my_wallet_img.png"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: ShapeDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(-0.96, -0.27),
                    end: Alignment(0.96, 0.27),
                    colors: [Color(0xFFA38E23), Color(0xFFD2C99B)],
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('Assets/Images/visa_img.png'),
                            Image.asset('Assets/Images/card_chip_img.png'),
                          ],
                        ),
                        //const SizedBox(height: 8),
                        const Text('Total Balance', style: TextStyle(fontSize: 13.0, color: Colors.white, fontWeight: FontWeight.w500)),
                        Text('AED ${widget.walletBalance}', style: const TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity, height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RechargeWallet()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, surfaceTintColor: Colors.white,
                    side: const BorderSide(width: 1.6, color: primaryColor),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                  ),
                  child: const Text('RECHARGE NOW', style: TextStyle(fontSize: 14.0, color: textgrey),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text('Transaction list', style: TextStyle(fontSize: 13, color: textgrey, fontWeight: FontWeight.w400)),
              const SizedBox(height: 12),
              BlocBuilder<CustomerBloc, CustomerState>(
                builder: (context, state) {
                  print('bloc');
                  if (state is WalletTransactionFetching) {
                    return Container(color: Colors.transparent,
                        child: const Center(child: CircularProgressIndicator(
                            color: primaryColor,
                            backgroundColor: Colors.transparent)));
                  } else if (state is WalletTransactionFetched) {
                    print('fetched');
                    return Expanded(
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
                                  state.walletTransactionList?.all?.isEmpty == true ?
                                  Container(color: BgGrey, child: const Center(child: Text('No Wallet Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w500))))
                                  : ListView.separated(
                                    padding: EdgeInsets.zero,
                                    separatorBuilder: (context, index) => const Divider(color: DividerGrey),
                                    itemCount: state.walletTransactionList!.all!.length,
                                    itemBuilder: (context, index) {
                                      print('1111');
                                      final data = state.walletTransactionList;
                                      return ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        leading: data!.all?[index].transferType == 'Debit' ?
                                        Image.asset('Assets/Images/arrow_up.png')
                                            : Image.asset('Assets/Images/arrow_down.png'),
                                        title: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(formatDateYear(DateTime.parse(data?.all?[index].createdDate.toString() ?? '--')), style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w300)),
                                            Text('Order no: ${data!.all?[index].orderOrderNumber.toString() ?? '--'}', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w300)),
                                            const Text('Used wallet balance', style: TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w400)),
                                          ],
                                        ),
                                        trailing: Text('AED ${data!.all?[index].amount.toString() ?? '--'}', style: TextStyle(fontSize: 13.0, color: data!.all?[index].transferType == 'Debit' ? redColor : greenColor, fontWeight: FontWeight.w500)),
                                      );
                                    },
                                  ),
                                  state.walletTransactionList?.debitDetails?.isEmpty == true ?
                                  Container(color: BgGrey, child: const Center(child: Text('No Debits Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w500))))
                                  : ListView.separated(
                                    separatorBuilder: (context, index) => const Divider(color: DividerGrey),
                                    itemCount: state.walletTransactionList!.debitDetails!.length,
                                    itemBuilder: (context, index) {
                                      print('2222');
                                      final data = state.walletTransactionList;
                                      return ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        leading: Image.asset('Assets/Images/arrow_up.png'),
                                        title: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(formatDateYear(DateTime.parse(data?.debitDetails?[index].createdDate.toString() ?? '--')), style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w300)),
                                            Text('Order no: ${data!.debitDetails?[index].orderOrderNumber.toString() ?? '--'}', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w300)),
                                            const Text('Used wallet balance', style: TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w400)),
                                          ],
                                        ),
                                        trailing: Text('AED ${data!.debitDetails?[index].amount.toString() ?? '--'}', style: const TextStyle(fontSize: 13.0, color: redColor, fontWeight: FontWeight.w500)),
                                      );
                                    },
                                  ),
                                  state.walletTransactionList?.creditType?.isEmpty == true ?
                                  Container(color: BgGrey, child: const Center(child: Text('No Credits Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w500))))
                                  : ListView.separated(
                                    separatorBuilder: (context, index) => const Divider(color: DividerGrey),
                                    itemCount: state.walletTransactionList!.creditType!.length,
                                    itemBuilder: (context, index) {
                                      print('3333');
                                      final data = state.walletTransactionList;
                                      return ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        leading: Image.asset('Assets/Images/arrow_down.png'),
                                        title: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(formatDateYear(DateTime.parse(data?.creditType?[index].createdDate.toString() ?? '--')), style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w300)),
                                            Text('Order no: ${data!.creditType?[index].orderOrderNumber.toString() ?? '--'}', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w300)),
                                            const Text('Used wallet balance', style: TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w400)),
                                          ],
                                        ),
                                        trailing: Text('AED ${data!.creditType?[index].amount.toString() ?? '--'}', style: const TextStyle(fontSize: 13.0, color: greenColor, fontWeight: FontWeight.w500)),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  else if (state is WalletTransactionError) {
                    snackBar(context, message: state.message.toString());
                    return Container(color: BgGrey, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
                  }
                  else {
                    return Container(color: BgGrey, child: const Center(child: Text('No Wallet Transaction', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
                  }
                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatDateYear(DateTime? dateTime) {
    final format = DateFormat('dd-MM-yyyy');
    return format.format(dateTime!);
  }

}
