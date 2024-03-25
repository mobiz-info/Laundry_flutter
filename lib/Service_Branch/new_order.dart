import 'package:flutter/material.dart';
import 'package:golden_falcon/Service_Branch/delivery_mode.dart';
import '../Models/ServiceBranchModel/order_search_model.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/ServiceBranchRepo/service_branch_repo.dart';
import '../src/Color.dart';

class ServiceNewOrder extends StatefulWidget {
  const ServiceNewOrder({super.key});

  @override
  State<ServiceNewOrder> createState() => _ServiceNewOrderState();
}

class _ServiceNewOrderState extends State<ServiceNewOrder> {

  final ServiceBranchRepository serviceBranchRepository = ServiceBranchRepository();
  String searchMobileNum = '';
  List<OrderSearchData>? list = [];

  void updateSearchMobile(String newSearchMobileNum) async {
      searchMobileNum = newSearchMobileNum;
      if (newSearchMobileNum.length == 10) {
        NewOrderSearchModel result = await serviceBranchRepository.getOrderSearchData(
            token: authData.user_token!,
            mobileNum: searchMobileNum);
        setState(() {
          if(result.data != null) {
            list = result.data;
          }
        });
      } else {
        setState(() {
          list = [];
        });
      }
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
        title: const Text('New Order', style: TextStyle(fontSize: 16, color: primaryColor, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          children: [
            TextField(
              style: const TextStyle(color: textgrey, fontSize: 13, fontWeight: FontWeight.w400),
              onChanged: updateSearchMobile,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Search by phone number',
                hintStyle: TextStyle(color: lightGreyText, fontSize: 13, fontWeight: FontWeight.w400),
                prefixIcon: Icon(Icons.search_outlined, color: lightGreyText, size: 22),
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: formBorderColor)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: formBorderColor)),
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView.builder(
                  itemCount: list?.length,
                  itemBuilder: (BuildContext context, index) {
                    OrderSearchData data = list![index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Customer name :', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                    SizedBox(height: 8),
                                    Text('Customer type :', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                    SizedBox(height: 8),
                                    Text('Building Name/No :', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                    SizedBox(height: 8),
                                    Text('Floor No :', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                    SizedBox(height: 8),
                                    Text('House No :', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                    SizedBox(height: 8),
                                    Text('Mobile No :', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                  ],
                                ),
                                const SizedBox(width: 18),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(data.name ?? '--', style: const TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 8),
                                      Text(data.customerType ?? '--', style: const TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 8),
                                      Text(data.buildingName ?? '--', style: const TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 8),
                                      Text(data.floorNumber ?? '--', style: const TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 8),
                                      Text(data.flatNumber ?? '--', style: const TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 8),
                                      Text(data.mobile ?? '--', style: const TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              height: 42,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DeliveryMode(customerId: data.customerId.toString())));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Create a New Order',
                                  style: TextStyle(fontSize: 14, color: White),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}

