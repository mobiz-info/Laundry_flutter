import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';

class OurBranches extends StatefulWidget {
  const OurBranches({Key? key}) : super(key: key);

  @override
  State<OurBranches> createState() => _OurBranchesState();
}

class _OurBranchesState extends State<OurBranches> {

  final CustomerRepository customerRepository = CustomerRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BgGrey,
      appBar: ScreenAppbar(
        text: 'Our Nearest Branch',
        needAction: true,
        svgNeed: true,
        imagepath: "Assets/Images/our_branches_icon.svg",
      ),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) =>
          CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
            ..add(GetBranchesEvent(authData.user_token!)),
          child: BlocBuilder<CustomerBloc, CustomerState>(
            builder: (context, state) {
              if (state is OurBranchesFetching) {
                return Container(color: Colors.transparent,
                    child: const Center(child: CircularProgressIndicator(
                        color: primaryColor,
                        backgroundColor: Colors.transparent)));
              }
              else if (state is OurBranchesFetched) {
                final data = state.branchesData;
                return state.branchesData?.branches?.isEmpty == true ?
                const SizedBox(
                  height: 98,
                  child: Center(
                      child: Text('No Branches Found', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))
                  ),
                ) : ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data?.branches?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data?.branches?[index].branchName ?? '--', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textgrey)),
                                const SizedBox(height: 4),
                                Text(data?.branches?[index].locationName ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey)),
                                Text(data?.branches?[index].branchAddress ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey)),
                                const SizedBox(height: 4),
                                Text(data?.branches?[index].branchPhone ?? '--', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textgrey)),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                );
              }
              else if (state is OurBranchesError) {
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
    );
  }
}

