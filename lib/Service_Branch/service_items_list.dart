import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_falcon/Service_Branch/service_cart.dart';

import '../BLoCs/ServiceBranchBloc/service_branch_bloc.dart';
import '../Models/ServiceBranchModel/ser_items_inc_dec_model.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/ServiceBranchRepo/service_branch_repo.dart';
import '../Utils/common.dart';
import '../src/Color.dart';

class ServiceItemsList extends StatefulWidget {
  final String catId;
  final String subCatId;
  final String customerId;
  final String orderId;

  const ServiceItemsList({Key? key, required this.catId, required this.subCatId, required this.customerId, required this.orderId}) : super(key: key);

  @override
  State<ServiceItemsList> createState() => _ServiceItemsListState();
}

class _ServiceItemsListState extends State<ServiceItemsList> {
  List<int> counter = [];
  List<String> priceValue = [];
  SerItemsIncDecData? data;
  int count = 0;
  final ServiceBranchRepository serviceBranchRepository = ServiceBranchRepository();

  void incrementCounter(int index) {
    setState(() {
      counter[index]++;
    });
  }

  void decrementCounter(int index) {
    setState(() {
      if (counter[index] > 1) {
        counter[index]--;
      }
    });
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
        actions: [
          Stack(
            children: [
              IconButton(
                icon: SvgPicture.asset('Assets/Images/cart_icon.svg'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ServiceCart(orderId: widget.orderId)));
                },
              ),
              Positioned(
                right: 10, top: 5,
                child: Container(
                  height: 14, width: 14,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                  child: Center(
                    child: Text(count.toString() ?? '0', textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: BlocProvider(
          create: (context) =>
          ServiceBranchBloc(RepositoryProvider.of<ServiceBranchRepository>(context))
            ..add(GetServiceItemsListEvent(authData.user_token.toString(), widget.catId, widget.subCatId, widget.customerId, widget.orderId)),
          child: BlocBuilder<ServiceBranchBloc, ServiceBranchState>(
            builder: (context, state) {
              if (state is ServiceItemsListFetching) {
                return Container(color: Colors.transparent,
                    child: const Center(child: CircularProgressIndicator(
                        color: primaryColor,
                        backgroundColor: Colors.transparent)));
              } else if (state is ServiceItemsListFetched) {
                final data = state.serviceItemsListData;
                  return data?.isEmpty == true ?
                    const Center(
                        child: Text('No Data Found', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))
                    ) : ListView(
                      shrinkWrap: true,
                      children: [
                        Text(data?.first.itemServices?.category?.serviceMaster?.categoryName ?? '', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: textgrey)),
                        const SizedBox(height: 10),
                        const Text('Pick the Items', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey)),
                        const SizedBox(height: 18),
                        ListView.builder(
                            physics: const ScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: data?.length,
                            itemBuilder: (BuildContext context, int index) {
                              counter.add(1);
                              priceValue.add(data![index].amount.toString());
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6),
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                        child: Row(
                                          children: [
                                            Image.network(baseUrl + (data?[index].itemServices?.item?.itemImage ?? '--'), height: 119, width: 111),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(data?[index].itemServices?.item?.itemName ?? '--', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textgrey)),
                                                  const SizedBox(height: 6),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      const Text('No of Items', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey)),
                                                      const SizedBox(width: 16),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              decrementCounter(index);
                                                              serviceBranchRepository.getItemsIncDec(
                                                                token: authData.user_token!,
                                                                orderId: widget.orderId,
                                                                priceListId: data[index].priceListId.toString(),
                                                                itemServiceId: data[index].itemServices!.itemSerId.toString(),
                                                                quantity: '${counter[index]}',
                                                              ).then((value) {
                                                                setState(() {
                                                                  priceValue[index] = '${value.data?.amount}';
                                                                });
                                                              });
                                                              print('decrement ${counter}');
                                                            },
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors.white,
                                                                  borderRadius: BorderRadius.circular(6),
                                                                  border: Border.all(color: incDecBorderColor, width: 1.8)
                                                              ),
                                                              child: const Center(
                                                                  child: Icon(
                                                                    Icons.remove,
                                                                    color: primaryColor,
                                                                    size: 18,
                                                                  )),
                                                            ),
                                                          ),
                                                          const SizedBox(width: 12),
                                                          Text('${counter[index]}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey)),
                                                          const SizedBox(width: 12),
                                                          InkWell(
                                                            onTap: () {
                                                              incrementCounter(index);
                                                              serviceBranchRepository.getItemsIncDec(
                                                                token: authData.user_token!,
                                                                orderId: widget.orderId,
                                                                priceListId: data[index].priceListId.toString(),
                                                                itemServiceId: data[index].itemServices!.itemSerId.toString(),
                                                                quantity: '${counter[index]}',
                                                              ).then((value) {
                                                                setState(() {
                                                                  priceValue[index] = '${value.data?.amount}';
                                                                });
                                                              });
                                                              print('increment ${counter}');
                                                            },
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors.white,
                                                                  borderRadius: BorderRadius.circular(6),
                                                                  border: Border.all(color: incDecBorderColor, width: 1.8)
                                                              ),
                                                              child: const Center(
                                                                  child: Icon(
                                                                    Icons.add,
                                                                    color: primaryColor,
                                                                    size: 18,
                                                                  )),
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(height: 6),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      const Text('Rate', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey)),
                                                      priceValue[index] != null ? Text('AED ${priceValue[index]}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: textgrey)) :
                                                      Text('AED ${data?[index].amount ?? '--'}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: textgrey)),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 8),
                                                  SizedBox(
                                                    height: 32,
                                                    width: double.infinity,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        serviceBranchRepository.getItemsAddCart(
                                                            token: authData.user_token!,
                                                            orderId: widget.orderId,
                                                            priceListId: data[index].priceListId.toString(),
                                                            itemServiceId: data[index].itemServices!.itemSerId.toString(),
                                                            quantity: '${counter[index]}',
                                                            amount: priceValue[index]).then((value) {
                                                              serviceBranchRepository.getSerCartCount(token: authData.user_token!, orderId: widget.orderId).then((value) {
                                                                setState(() {
                                                                  count = value.data!.cartCount!;
                                                                });
                                                          });
                                                        });
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: Colors.white,
                                                        surfaceTintColor: Colors.white,
                                                        elevation: 0,
                                                        side: const BorderSide(width: 1.0, color: primaryColor),
                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                                      ),
                                                      child: const Text(
                                                        'ADD TO CART',
                                                        style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w600),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                    )
                                ),
                              );
                            }
                        ),
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
    );
  }
}

