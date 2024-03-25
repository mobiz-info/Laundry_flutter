import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_falcon/Customers/Customer_Home.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../src/Color.dart';


class RechargeWallet extends StatefulWidget {
  const RechargeWallet({Key? key}) : super(key: key);

  @override
  State<RechargeWallet> createState() => _WalletState();
}

class _WalletState extends State<RechargeWallet> {

  final TextEditingController walletAmountController = TextEditingController();
  final CustomerRepository customerRepository = CustomerRepository();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BgGrey,
      appBar: ScreenAppbar(text: "Recharge your Wallet", imagepath: "Assets/Images/wallet_img.png"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              Card(
                elevation: 0,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                      child: Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('Recharging Amount', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                          const SizedBox(width: 28),
                          Expanded(
                            child: TextFormField(
                              controller: walletAmountController,
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
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SvgPicture.asset('Assets/Images/recharge_wallet_img.svg', width: 110, height: 110),
                    const SizedBox(height: 20),
                    //const Text('Select your Mode of payment', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                      leading: SvgPicture.asset('Assets/Images/cash_icon.svg'),
                      title: const Text('Cash', style: TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w300)),
                      trailing:
                      Checkbox(
                        value: true,
                        side: const BorderSide(color: primaryColor),
                        activeColor: primaryColor,
                        checkColor: Colors.white,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity, height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    customerRepository.getWalletRechargeData(token: authData.user_token!, id: authData.user_id.toString(), amount: walletAmountController.text, paymentMode: 'Cash');
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          title: Column(
                            children: [
                              const SizedBox(height: 12),
                              SvgPicture.asset('Assets/Images/recharge_wallet_popup_img.svg'),
                              const SizedBox(height: 32),
                              const Text('Your Request for top up has been Successfully placed...!', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w600)),
                            ],
                          ),
                          content: const Text('Our team will come & collect money', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, color: textgrey, fontWeight: FontWeight.w500)),
                          actions: [
                            const SizedBox(height: 12),
                            SizedBox(
                              height: 42, width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomerHomeScreen()));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white, surfaceTintColor: Colors.white,
                                  side: const BorderSide(width: 1.6, color: primaryColor),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),
                                child: const Text('BACK TO HOME', style: TextStyle(fontSize: 15, color: textgrey)),
                              ),
                            ),
                            const SizedBox(height: 38),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor, shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  ),
                  child: const Text('SUBMIT', style: TextStyle(fontSize: 15.0, color: White, fontWeight: FontWeight.w500)),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
