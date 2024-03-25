import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../BLoCs/ServiceBranchBloc/service_branch_bloc.dart';
import '../Models/ServiceBranchModel/gen_invoice_search_model.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/ServiceBranchRepo/service_branch_repo.dart';
import '../src/Color.dart';

class GenerateInvoice extends StatefulWidget {
  const GenerateInvoice({super.key});

  @override
  State<GenerateInvoice> createState() => _GenerateInvoiceState();
}

class _GenerateInvoiceState extends State<GenerateInvoice> {
  final ServiceBranchRepository serviceBranchRepository = ServiceBranchRepository();
  final TextEditingController searchInvoiceController = TextEditingController();
  var data;

  @override
  void dispose() {
    searchInvoiceController.dispose();
    super.dispose();
  }

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
          title: const Text('Generate Invoice', style: TextStyle(fontSize: 16, color: primaryColor, fontWeight: FontWeight.w500)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: BlocProvider(
              create: (context) =>
              ServiceBranchBloc(RepositoryProvider.of<ServiceBranchRepository>(context))
                ..add(GetGenInvoiceEvent(authData.user_token.toString())),
              child: BlocBuilder<ServiceBranchBloc, ServiceBranchState>(
                  builder: (context, state) {
                    if (state is GenInvoiceFetching) {
                      return Container(color: Colors.transparent,
                          child: const Center(child: CircularProgressIndicator(
                              color: primaryColor,
                              backgroundColor: Colors.transparent)));
                    } else if (state is GenInvoiceFetched) {
                      if (searchInvoiceController.text.isEmpty) {
                        data = state.generateInvoiceData;
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: searchInvoiceController,
                            onChanged: (value) async {
                              searchInvoiceController.text = value;
                              GenInvoiceSearchModel searchResult = await serviceBranchRepository.getSearchInvoiceData(
                                  token: authData.user_token!,
                                  orderNum: searchInvoiceController.text);
                              if (searchResult.data != null) {
                                data = searchResult.data;
                              }
                              setState(() {});
                            },
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
                          Text('${data?.ordersCount ?? '--'} orders to generate invoice', style: const TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w300)),
                          const SizedBox(height: 8),
                          ListView.builder(
                              physics: const ScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: data?.orders?.length,
                              itemBuilder: (itemBuilder, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Order number :', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                                  SizedBox(height: 8),
                                                  Text('Order type :', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                                  SizedBox(height: 8),
                                                  Text('Staff :', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                                  SizedBox(height: 8),
                                                  Text('Delivery type :', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                                  SizedBox(height: 8),
                                                  Text('Number of items :', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                                ],
                                              ),
                                              const SizedBox(width: 18),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(data?.orders?[index].orderNumber?.toUpperCase() ?? '--', style: const TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                                  const SizedBox(height: 8),
                                                  Container(
                                                    //height: 24,
                                                      width: 80,
                                                      decoration: data?.orders?[index].orderType == 'Normal' ?
                                                      BoxDecoration(
                                                        color: Colors.white70,
                                                        border: Border.all(color: primaryColor),
                                                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                                                      ) : data?.orders?[index].orderType == 'Express' ?
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
                                                      child: Center(child: Text(data?.orders?[index].orderType ?? '--', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: textgrey)))),
                                                  const SizedBox(height: 8),
                                                  Text(data?.orders?[index].staffName ?? '--', style: const TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                                  const SizedBox(height: 8),
                                                  Text(data?.orders?[index].pickupMode ?? '--', style: const TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                                  const SizedBox(height: 8),
                                                  Text(data?.orders?[index].quantity.toString() ?? '--', style: const TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 12),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                                height: 30,
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
                                                child: const Center(child: Text('Generate Invoice', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white)))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                          )
                        ],
                      );
                    }
                    else {
                      return Container(color: BgGrey, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))));
                    }
                  }
              ),
            ),
          ),
        )
    );
  }

}

