import 'package:flutter/material.dart';

import '../src/Color.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BgGrey,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {Navigator.pop(context);},
            child: const Icon(Icons.arrow_back, color: primaryColor)),
        surfaceTintColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(side: BorderSide(width: 1, color: primaryColor),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
        centerTitle: true,
        title: const Text('Order Details', style: TextStyle(fontSize: 20, color: primaryColor, fontWeight: FontWeight.w400)),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Order number', style: TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w400)),
                          SizedBox(height: 14),
                          Text('Order type', style: TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w400)),
                          SizedBox(height: 14),
                          Text('Staff', style: TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w400)),
                        ],
                      ),
                      const SizedBox(width: 38),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('108', style: TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w400)),
                          const SizedBox(height: 14),
                          Container(
                              height: 24, width: 100,
                              decoration:
                              BoxDecoration(
                                color: Colors.white70,
                                border: Border.all(color: primaryColor),
                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                              ),
                              child: const Center(child: Text('Normal', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: textgrey)))),
                          const SizedBox(height: 14),
                          const Text('Abu', style: TextStyle(fontSize: 14, color: textgrey, fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: const Column(
                      children: [
                        Text('Delivery Time', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey)),
                        Text('12:00 PM - 1:00 PM', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: primaryColor)),
                        Text('09 Jan 2024', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: primaryColor)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text('Delivery address', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: textgrey)),
                  const SizedBox(height: 8),
                  const Text('Jason Roy , House name ,Floor no,Building number. 8089790114', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey)),
                  const SizedBox(height: 18),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: ListView.builder(
                        physics: const ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                            child: Row(
                              children: [
                                Image.asset('Assets/Images/service_list_img.png', height: 64, width: 61),
                                const SizedBox(width: 12),
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text( 'Shirts / Wash & Fold', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textgrey)),
                                      SizedBox(height: 2),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('No of Items', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey)),
                                          Text('2', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textgrey)),
                                        ],
                                      ),
                                      SizedBox(height: 8)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                    ),
                  ),
                  const SizedBox(height: 28),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        height: 38,
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
                        child: const Center(child: Text('Engage Now', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white)))),
                  ),
                ]
          ),
        ),
      ),
    );
  }
}

