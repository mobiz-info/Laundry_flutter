import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Customers/add_address.dart';

import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';

class MyAddresses extends StatefulWidget {
  const MyAddresses({Key? key}) : super(key: key);

  @override
  State<MyAddresses> createState() => _MyAddressesState();
}

class _MyAddressesState extends State<MyAddresses> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BgGrey,
      appBar: ScreenAppbar(
        text: 'My Addresses',
        svgNeed: true,
        imagepath: "Assets/Images/my_addresses_icon.svg",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: BlocProvider(
              create: (context) =>
              CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
                ..add(GetMyAddressesListEvent(authData.user_token!)),
            child: BlocBuilder<CustomerBloc, CustomerState>(
              builder: (context, state) {
                if (state is MyAddressesListFetching) {
                  return Container(color: Colors.transparent,
                      child: const Center(child: CircularProgressIndicator(
                          color: primaryColor,
                          backgroundColor: Colors.transparent)));
                }
                else if (state is MyAddressesListFetched) {
                  final data = state.myAddressesData;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.add_location_outlined, color: primaryColor),
                          const SizedBox(width: 6),
                          InkWell(
                              onTap: () async {
                                await Navigator.push(context, MaterialPageRoute(builder: (context) => const AddAddress()));
                                context.read<CustomerBloc>().add(GetMyAddressesListEvent(authData.user_token!));
                              },
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 1),
                                decoration: const BoxDecoration(
                                    border: Border(bottom: BorderSide(color: primaryColor, width: 1))
                                ),
                                child: const Text('Add a New Address', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w500)),
                              )
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text('${data?.adressCount ?? '--'} Saved Addresses', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w400)),
                      ListView.builder(
                          physics: const ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: data?.addressList?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(data?.addressList?[index].name ?? '--', style: const TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w500)),
                                      const SizedBox(height: 4),
                                      Text(data?.addressList?[index].buildingNameNo ?? '--', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w400)),
                                      Text('${data?.addressList?[index].floorNo ?? '--'}, ${data?.addressList?[index].flatNoHouseNo ?? '--'}', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 4),
                                      Text(data?.addressList?[index].personInchargeMob ?? '--', style: const TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                      ),
                    ],
                  );
                }
                else if (state is MyAddressesListError) {
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
          ),
        ),
      ),
    );
  }
}

