import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_falcon/BLoCs/CustomerBloc/customer_bloc.dart';
import 'package:golden_falcon/Customers/Edit.dart';
import 'package:golden_falcon/Customers/Services_screen.dart';
import 'package:golden_falcon/Customers/Wallet.dart';
import 'package:golden_falcon/Customers/complaint_screen.dart';
import 'package:golden_falcon/Customers/contact_us_screen.dart';
import 'package:golden_falcon/Customers/my_addresses.dart';
import 'package:golden_falcon/Customers/order_status.dart';
import 'package:golden_falcon/Customers/our_branches.dart';
import 'package:golden_falcon/Customers/pricing_screen.dart';
import 'package:golden_falcon/Customers/sidebar_feedback.dart';
import 'package:golden_falcon/Customers/terms_conditions.dart';
import 'package:golden_falcon/Customers/transaction_history.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Repositories/CustomerRepo/customer_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Loginscreen.dart';
import '../Models/Carousal.dart';
import '../Utils/ScreenAppbar.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';
import 'NewOrder.dart';
import 'create_new_password.dart';
import 'outstanding_screen.dart';

class CustomerHomeScreen extends StatefulWidget {
  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {

  final CustomerRepository customerRepository = CustomerRepository();

  Future<void> showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Padding(
            padding: EdgeInsets.only(top: 18),
            child: Text('Logout', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: textgrey, fontWeight: FontWeight.w600)),
          ),
          content: const Text('Are you sure you want to logout?', textAlign: TextAlign.center,  style: TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w400)),
          actions: [
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 42, width: 120,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
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
        );
      },
    );
  }

  void closeAppUsingExit() {
    exit(0);
  }

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
        content: const Text('Do you really want to exit?', textAlign: TextAlign.center,  style: TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w400)),
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
                    onPressed: () {
                      closeAppUsingExit();
                      context.read<CustomerBloc>().add(GetBalanceEvent(authData.user_token!, authData.user_id.toString()));
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
        CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
          ..add(GetBalanceEvent(authData.user_token!, authData.user_id.toString())),
      child: BlocBuilder<CustomerBloc, CustomerState>(
          builder: (context, state) {
            if (state is CustomerBalanceFetching) {
              return Container(color: Colors.white,
                  child: const Center(child: CircularProgressIndicator(
                      color: primaryColor,
                      backgroundColor: Colors.transparent)));
            }
            else if (state is CustomerBalanceFetched) {
              return Scaffold(
                backgroundColor: BgGrey,
                appBar: ScreenAppbar(
                  text: "Hai",
                  name: state.data?.name ?? '--',
                  svgNeed: true,
                  imagepath: "Assets/Images/user_dp.svg",
                  needAction: true,
                  needRadius: false,
                  needAlign: false,
                ),
                drawer: Drawer(
                  shadowColor: Colors.transparent,
                  backgroundColor: BgGrey,
                  child: ListView(
                    padding: const EdgeInsets.all(0),
                    children: [
                      Theme(
                        data: Theme.of(context).copyWith(
                          dividerTheme: const DividerThemeData(color: Colors.transparent),
                        ),
                        child: DrawerHeader(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: primaryColor),
                              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                          ),
                          child: Center(
                            child: Image.asset('Assets/Images/golden_falcon_logo.png'),
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                        leading: SizedBox(width: 20, height: 20, child: SvgPicture.asset('Assets/Images/edit_icon.svg')),
                        title: const Text('Edit Profile', style: TextStyle(fontSize: 14, color: textgrey)),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Edit()));
                        },
                      ),
                      Divider(color: lightGreyText.withOpacity(0.8)),
                      ListTile(
                        dense: true,
                        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                        leading: SizedBox(width: 20, height: 20, child: SvgPicture.asset('Assets/Images/order_report_icon.svg')),
                        title: const Text('Order History', style: TextStyle(fontSize: 14, color: textgrey)),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderStatus()));
                        },
                      ),
                      Divider(color: lightGreyText.withOpacity(0.8)),
                      ListTile(
                        dense: true,
                        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                        leading: SizedBox(width: 20, height: 20, child: SvgPicture.asset('Assets/Images/transaction_history_icon.svg')),
                        title: const Text('Transaction History', style: TextStyle(fontSize: 14, color: textgrey)),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const TransactionHistory()));
                        },
                      ),
                      Divider(color: lightGreyText.withOpacity(0.8)),
                      ListTile(
                        dense: true,
                        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                        leading: SizedBox(width: 20, height: 20, child: SvgPicture.asset('Assets/Images/complaints_icon.svg')),
                        title: const Text('Complaints', style: TextStyle(fontSize: 14, color: textgrey)),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ComplaintScreen()));
                        },
                      ),
                      Divider(color: lightGreyText.withOpacity(0.8)),
                      ListTile(
                        dense: true,
                        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                        leading: SizedBox(width: 20, height: 20, child: SvgPicture.asset('Assets/Images/change_password_icon.svg')),
                        title: const Text('Change Password', style: TextStyle(fontSize: 14, color: textgrey)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CreateNewPassword(mobileNumber: authData.username.toString())),
                          );
                        },
                      ),
                      Divider(color: lightGreyText.withOpacity(0.8)),
                      ListTile(
                        dense: true,
                        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                        leading: SizedBox(width: 20, height: 20, child: SvgPicture.asset('Assets/Images/new_address_icon.svg')),
                        title: const Text('Add Address', style: TextStyle(fontSize: 14, color: textgrey)),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const MyAddresses()));
                        },
                      ),
                      Divider(color: lightGreyText.withOpacity(0.8)),
                      ListTile(
                        dense: true,
                        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                        leading: SizedBox(width: 20, height: 20, child: SvgPicture.asset('Assets/Images/feed_back_icon.svg')),
                        title: const Text('Feedbacks', style: TextStyle(fontSize: 14, color: textgrey)),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SideBarFeedback()));
                        },
                      ),
                      Divider(color: lightGreyText.withOpacity(0.8)),
                      ListTile(
                        dense: true,
                        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                        leading: SizedBox(width: 20, height: 20, child: SvgPicture.asset('Assets/Images/branches_icon.svg')),
                        title: const Text('Our Branches', style: TextStyle(fontSize: 14, color: textgrey)),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const OurBranches()));
                        },
                      ),
                      Divider(color: lightGreyText.withOpacity(0.8)),
                      ListTile(
                        dense: true,
                        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                        leading: SizedBox(width: 20, height: 20, child: SvgPicture.asset('Assets/Images/terms_conditions_icon.svg')),
                        title: const Text('Terms and Conditions', style: TextStyle(fontSize: 14, color: textgrey)),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const TermsConditions()));
                        },
                      ),
                      Divider(color: lightGreyText.withOpacity(0.8)),
                      ListTile(
                        dense: true,
                        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                        leading: SizedBox(width: 20, height: 20, child: SvgPicture.asset('Assets/Images/logout_icon.svg')),
                        title: const Text('Log Out', style: TextStyle(fontSize: 14, color: textgrey)),
                        onTap: () {
                          showLogoutConfirmationDialog(context);
                        },
                      ),
                      Divider(color: lightGreyText.withOpacity(0.8)),
                      const SizedBox(height: 28),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Text('VERSION : 1.0.0', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, letterSpacing: 2.8, fontWeight: FontWeight.w500, color: textgrey)),
                      ),
                      const SizedBox(height: 68),
                    ],
                  ),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerHomeScreen()));
                        break;
                      case 1:
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactUsScreen()));
                        break;
                      case 2:
                        showExitPopup();
                        break;
                    }
                  },
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Image.asset('Assets/Images/home_bottombar_icon.png'),
                      label: 'Home',
                      activeIcon: Container(
                        decoration: const BoxDecoration(
                          color: primaryColor, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Image.asset('Assets/Images/home_bottombar_icon.png'),
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset('Assets/Images/contact_us_icon.svg'),
                      label: 'Contact Us',
                      activeIcon: Container(
                        decoration: const BoxDecoration(
                          color: primaryColor, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset('Assets/Images/contact_us_icon.svg'),
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset('Assets/Images/exit_icon.svg'),
                      label: 'Exit',
                      activeIcon: Container(
                        decoration: const BoxDecoration(
                          color: primaryColor, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset('Assets/Images/exit_icon.svg'),
                        ),
                      ),
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  child: Column(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SlidingCarousel(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomerNewOrder())),
                                            child: IconContainer(
                                                'Assets/Images/new_order_icon.svg',
                                                'New Order'),
                                          ),
                                          const SizedBox(height: 12),
                                          GestureDetector(
                                            // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Orderstushistory())),
                                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderStatus())),
                                            child: IconContainer(
                                                'Assets/Images/order_status_icon.svg',
                                                'Order History'),
                                          ),
                                          const SizedBox(height: 12),
                                          GestureDetector(
                                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ServicesScreen())),
                                            child: IconContainer(
                                                'Assets/Images/service_icon.svg',
                                                'Services'),
                                          ),
                                          const SizedBox(height: 12),
                                          GestureDetector(
                                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PricingScreen())),
                                            child: IconContainer(
                                                'Assets/Images/price_icon.svg',
                                                'Our Tariffs'),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: double.infinity,
                                              child: Card(
                                                elevation: 0,
                                                color: Colors.transparent,
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OutstandingScreen())).then((value) {
                                                      context.read<CustomerBloc>().add(GetBalanceEvent(authData.user_token!, authData.user_id.toString()));
                                                    });
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets.all(18.0),
                                                    decoration: ShapeDecoration(
                                                      gradient: const LinearGradient(
                                                        begin: Alignment(-0.96, -0.27),
                                                        end: Alignment(0.96, 0.27),
                                                        colors: [Color(0xFFA38E23), Color(0xFFBEB16D)],
                                                      ),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(16),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              const Row(
                                                                children: [
                                                                  Text('Current Outstanding',
                                                                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white),
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(height: 16.0),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    '${state.data?.outstanding} AED',
                                                                    style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        //const SizedBox(width: 20),
                                                        const Column(
                                                          children: [
                                                            CircleAvatar(
                                                              radius: 16,
                                                              backgroundColor: Colors.white,
                                                              child: Icon(Icons.keyboard_arrow_right_rounded, color: primaryColor, size: 22),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            state.data?.todaysDelivery?.isEmpty == true ? Container() : const SizedBox(height: 8),
                                            state.data?.todaysDelivery?.isEmpty == true ?
                                            Container() :
                                            SizedBox(
                                              width: double.infinity,
                                              child: Card(
                                                elevation: 0,
                                                child: Container(
                                                  padding: const EdgeInsets.all(18.0),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(16),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Text('Order Delivery Today !',
                                                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey),
                                                      ),
                                                      const SizedBox(height: 12),
                                                      ListView.builder(
                                                        shrinkWrap: true,
                                                          itemCount: state.data?.todaysDelivery?.length,
                                                          itemBuilder: (BuildContext context, int index) {
                                                            return Text('Order No: ${state.data?.todaysDelivery?[index].orderNumber ?? '--'}, '
                                                                'Amount: ${state.data?.todaysDelivery?[index].totalAmount ?? '--'} AED',
                                                              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: textgrey),
                                                            );
                                                          }
                                                      ),
                                                      const SizedBox(height: 12),
                                                      SizedBox(
                                                        width: double.infinity,
                                                        height: 28,
                                                        child: ElevatedButton(
                                                          onPressed: () async {
                                                            List<String> orderNumbers = [];
                                                            for (int index = 0; index < (state.data?.todaysDelivery?.length ?? 0); index++) {
                                                              String? orderNumber = state.data!.todaysDelivery?[index].orderNumber;
                                                              if (orderNumber != null) {
                                                                orderNumbers.add(orderNumber.toString());
                                                              }
                                                            }
                                                            if (orderNumbers.isNotEmpty) {
                                                              await customerRepository.getNotAvailableData(
                                                                token: authData.user_token!,
                                                                orderNumbers: orderNumbers,
                                                              ).then((value) {
                                                                context.read<CustomerBloc>().add(GetBalanceEvent(authData.user_token!, authData.user_id.toString()));
                                                              });
                                                            }
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor: notAvaiColor,
                                                            surfaceTintColor: Colors.white,
                                                            elevation: 0,
                                                            side: const BorderSide(width: 1, color: notAvaiColor),
                                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                                          ),
                                                          child: const Text('Not available', style: TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.w400),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            SizedBox(
                                              width: double.infinity,
                                              child: Card(
                                                elevation: 0,
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OutstandingScreen())).then((value) {
                                                      context.read<CustomerBloc>().add(GetBalanceEvent(authData.user_token!, authData.user_id.toString()));
                                                    });
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets.all(18.0),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(16),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const Text('My Wallet Balance',
                                                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textgrey),
                                                        ),
                                                        const SizedBox(height: 24.0),
                                                        Row(
                                                          children: [
                                                            Image.asset('Assets/Images/wallet_img.png'),
                                                            const SizedBox(width: 16.0),
                                                            Expanded(
                                                              child: Text(
                                                                '${state.data?.walletBalance} AED',
                                                                style: const TextStyle(fontSize: 18, color: primaryColor, fontWeight: FontWeight.w600),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(height: 14.0),
                                                        SizedBox(
                                                          width: double.infinity,
                                                          height: 36,
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              Navigator.push(context, MaterialPageRoute(builder: (context) => Wallet(walletBalance: state.data!.walletBalance.toString())),
                                                              );
                                                            },
                                                            style: ElevatedButton.styleFrom(
                                                              backgroundColor: Colors.white,
                                                              surfaceTintColor: Colors.white,
                                                              elevation: 0,
                                                              side: const BorderSide(width: 1, color: primaryColor,),
                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                                            ),
                                                            child: const Text('TOP UP NOW', style: TextStyle(fontSize: 12, color: primaryColor, fontWeight: FontWeight.w600),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                const SizedBox(height: 22),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Powered by", style: TextStyle(color: textgray, fontSize: 12)),
                                      const SizedBox(width: 4),
                                      GestureDetector(
                                          onTap: () {
                                            launchURLApp();
                                          },
                                          child: const Text('Mobiz', style: TextStyle(fontSize: 12, color: textgrey,
                                              fontWeight: FontWeight.w600, decoration: TextDecoration.underline)))
                                    ]),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            else if (state is CustomerBalanceError) {
              Future.delayed(const Duration(milliseconds: 500), () {
                snackBar(context, message: state.message.toString());
              });
              return Container(color: BgGrey, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
            }
            else {
              return Container(color: BgGrey, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
            }
          }
      ),

    );

  }

  launchURLApp() async {
    var url = Uri.parse("https://www.mobiztechnologies.com/");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}

class IconContainer extends StatelessWidget {
  final String imagePaths;
  final String name;
  final double? sizeWidth;
  final double? sizeHeigth;
  final bool? changeNeed;
  final Color? color;
  final double? sizeFont;

  IconContainer(this.imagePaths, this.name, {this.sizeWidth, this.sizeHeigth, this.changeNeed, this.color, this.sizeFont});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 91, width: 98,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Align( alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: changeNeed == true ? sizeWidth : 42, height: changeNeed == true ? sizeHeigth : 42,
                //child: Image.asset(imagePaths)
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: SvgPicture.asset(imagePaths),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              name, textAlign: TextAlign.center,
              style: TextStyle(
                color: changeNeed == true ? color: textgrey,
                fontWeight: FontWeight.w500,
                fontSize: changeNeed == true ? sizeFont : 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


