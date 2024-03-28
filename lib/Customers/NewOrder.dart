import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Customers/select_delivery_time.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';
import 'choose_account_type.dart';

class CustomerNewOrder extends StatefulWidget {
  const CustomerNewOrder({Key? key}) : super(key: key);

  @override
  State<CustomerNewOrder> createState() => _CustomerNewOrderState();
}

class _CustomerNewOrderState extends State<CustomerNewOrder> {
  int selectedIndex = -1;
  int selectedPickUpIndex = 0;
  String selectedMode = '';
  List<String> imagesList = ["Assets/Images/direct_icon.svg", "Assets/Images/contactless_icon.svg"];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
        ..add(GetDeliveryModeEvent(authData.user_token!)),
      child: Scaffold(
        backgroundColor: BgGrey,
        appBar: ScreenAppbar(
          text: '',
          svgNeed: true,
          imagepath: "Assets/Images/new_order_bg.svg",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Choose Mode of Delivery', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: textgrey)),
                const SizedBox(height: 8),
                BlocBuilder<CustomerBloc, CustomerState>(
                  builder: (context, state) {
                    if (state is DeliveryModeFetching) {
                      return Container(color: Colors.transparent, child: const Center(child: CircularProgressIndicator(color: primaryColor, backgroundColor: Colors.transparent)));
                    }
                    else if (state is DeliveryModeFetched) {
                      final data = state.delivery_mode_list;
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                    selectedMode = data[index].mode!;
                                  });
                                },
                                child: Container(
                                  //height: 59,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(34),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment : CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  data![index].name.toString(),
                                                  style: const TextStyle(fontSize: 12, color: lightGreyText, fontWeight: FontWeight.w600),
                                                ),
                                                const SizedBox(height: 2),
                                                data[index].extraValue == '' ? Container() : Text(
                                                  data[index].extraValue.toString(),
                                                  style: const TextStyle(fontSize: 12, color: primaryColor, fontWeight: FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          selectedIndex == index
                                              ? const CircleAvatar(
                                                  backgroundColor: primaryColor,
                                                  child: Icon(Icons.check_rounded,
                                                  color: Colors.white),
                                                ) :
                                          const CircleAvatar(
                                            backgroundColor: primaryColor,
                                            child: SizedBox(),
                                          )
                                        ],
                                      ),
                                    )
                                ),
                              ),
                            );
                          }
                      );
                    }
                    else if (state is DeliveryModeError) {
                      snackBar(context, message: state.message.toString());
                      return Container(color: BgGrey, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
                    }
                    else {
                      return Container(color: Colors.white, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
                    }
                  }
                ),
                const SizedBox(height: 22),
                const Text('Choose Mode of Pick up', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: textgrey)),
                const SizedBox(height: 20),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 30,
                  ),
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPickUpIndex = index;
                        });
                      },
                      child: AccountTypeCard(
                        imagePath: imagesList[index],
                        title: index == 0 ? 'Direct' : 'Contactless',
                        isSelected: selectedPickUpIndex == index, // Check if the item is selected
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      if(selectedMode == '') {
                        snackBar(context, message: 'Please choose delivery mode');
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectDeliveryTime(deliveryMode: selectedMode, pickUpMode: selectedPickUpIndex.toString())));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: const Text('NEXT',
                      style: TextStyle(fontSize: 16.0, color: White, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          )
        ),
      )
    );
  }
}

