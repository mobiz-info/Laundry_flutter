import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';
import 'outstanding_screen.dart';

class PayOutstanding extends StatefulWidget {
  final String overDueAmt;
  final String walletBalance;
  final String orderNum;
  final String pay;

  const PayOutstanding({Key? key, required this.overDueAmt, required this.walletBalance, required this.orderNum, required this.pay}) : super(key: key);

  @override
  State<PayOutstanding> createState() => _PayOutstandingState();
}

class _PayOutstandingState extends State<PayOutstanding> {

  final CustomerRepository customerRepository = CustomerRepository();
  bool isExpanded = false;
  String selectedOption = 'Choose Payment method';
  List<String> paymentMethods = ['Wallet', 'Cash'];
  final TextEditingController totalPayableController = TextEditingController();
  var selectedWallet;

  @override
  Widget build(BuildContext context) {

    // double overDueAmt = double.parse(widget.overDueAmt);
    // double walletBalance = double.parse(widget.walletBalance);
    // double payableAmount = double.tryParse(totalPayableController.text) ?? 0.0;


    return Scaffold(
      backgroundColor: BgGrey,
      appBar: ScreenAppbar(
        text: 'Pay Outstanding',
        svgNeed: true,
        imagepath: "Assets/Images/outstanding_img.svg",
        needAction: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Net Payable Amount', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey)),
                  Text('AED ${widget.overDueAmt}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textgrey)),
                ],
              ),
              const SizedBox(height: 22),
              BlocProvider(
                create: (context) => CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
                  ..add(GetCartPaymentListEvent(authData.user_token.toString())),
                child:
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Container(
                        height: 46,
                        width: double.infinity,
                        //padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: primaryColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18),
                              child: Text(selectedOption, style: const TextStyle(fontSize: 13, color: textgrey)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Icon(isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                                size: 38, color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: double.infinity,
                      height: isExpanded ? 120 : 0,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: BlocBuilder<CustomerBloc, CustomerState>(
                          builder: (context, state) {
                            if (state is CartPaymentListFetching) {
                              return const Center(child: CircularProgressIndicator(color: primaryColor));
                            } else if (state is CartPaymentListFetched) {
                              final data = state.cartPaymentList;
                              return ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: data?.length,
                                itemBuilder: (BuildContext context, int index) =>
                                    ListTile(
                                      title: Text('${data?[index].paymentMethod}', style: const TextStyle(fontSize: 12, color: textgrey)),
                                      onTap: () {
                                        setState(() {
                                          selectedOption = '${data?[index].paymentMethod}';
                                          isExpanded = false;
                                        });
                                        if (selectedOption == 'Wallet') {
                                          if (double.parse(widget.overDueAmt) > double.parse(widget.walletBalance)) {
                                            snackBar(context, message: 'Insufficient Wallet Balance. Select Cash Method');
                                          } else {
                                            customerRepository.getPayOutstandingData(token: authData.user_token!,
                                                paymentMtd: selectedOption, amtPayable: widget.overDueAmt).then((value) {
                                              setState(() {
                                                selectedWallet = value.data?.walletBal;
                                              });
                                            });
                                          }
                                        }
                                      },
                                    ),
                              );
                            } else {
                              return const Center(child: Text('No Data'));
                            }
                          }
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              selectedOption == 'Wallet' && double.parse(widget.overDueAmt) > double.parse(widget.walletBalance) ? Container() :
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Wallet Balance', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey)),
                  selectedOption == 'Wallet' ? Text('AED $selectedWallet', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textgrey))
                      : Text('AED ${widget.walletBalance}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textgrey)),
                ],
              ),
              const SizedBox(height: 22),
              selectedOption == 'Wallet' && double.parse(widget.overDueAmt) < double.parse(widget.walletBalance) ? Container() :
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total Payable', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey)),
                  const SizedBox(width: 82),
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: TextFormField(
                        controller: totalPayableController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          suffix: const Text('AED', textAlign: TextAlign.center),
                          suffixStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: textgrey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: const BorderSide(
                              color: primaryColor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: const BorderSide(
                              color: primaryColor,
                              width: 1.0,
                            ),
                          ),
                        ),
                        style: const TextStyle(color: textgrey),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              selectedOption == 'Wallet' && double.parse(widget.overDueAmt) > double.parse(widget.walletBalance) ? Container() :
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedOption == 'Choose Payment method') {
                      snackBar(context, message: 'Please choose payment method');
                    } else if (selectedOption == 'Cash' && totalPayableController.text.isEmpty){
                      snackBar(context, message: 'Please enter payable amount');
                    } else {
                      if (widget.pay == 'IndividualPay') {
                        customerRepository.getOutstandingProceedIndivData(
                            token: authData.user_token.toString(),
                            orderNum: widget.orderNum,
                            amountPayable: totalPayableController.text.toString(),
                            paymentMtd: selectedOption
                        ).then((value) {
                          Navigator.pop(context);
                        });
                      } else {
                        customerRepository.getOutstandingProceedComData(
                            token: authData.user_token.toString(),
                            netPayable: widget.overDueAmt,
                            amountPayable: totalPayableController.text.toString(),
                            paymentMtd: selectedOption
                        ).then((value) {
                          Navigator.pop(context);
                        });
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text('Proceed', style: TextStyle(fontSize: 16.0, color: White, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

