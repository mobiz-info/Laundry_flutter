import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Customers/cart_screen.dart';
import '../BLoCs/CustomerBloc/customer_bloc.dart';
import '../Models/CustomerModel/cart_count_model.dart';
import '../Models/CustomerModel/items_incre_decre_model.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../Utils/common.dart';
import '../src/Color.dart';

class ServicesList extends StatefulWidget {
  final String catId;
  final String subCatId;
  final String orderId;
  final String subCatName;

  const ServicesList({Key? key, required this.catId, required this.subCatId, required this.subCatName, required this.orderId}) : super(key: key);

  @override
  State<ServicesList> createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {
  List<int> counter = [];
  ItemsIncDecData? data;
  CartCountData? countData;
  List<String> priceValue = [];
  int count = 0;
  final CustomerRepository customerRepository = CustomerRepository();
  final String pageTitle = 'Items';

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

    return BlocProvider(
      create: (context) =>
      CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
          ..add(GetOrderItemsEvent(authData.user_token!, authData.user_id, widget.catId, widget.subCatId, widget.orderId)),
      child: Scaffold(
        backgroundColor: BgGrey,
        appBar: ScreenAppbar(
          text: '',
          svgNeed: true,
          imagepath: "Assets/Images/choose_service_bg.svg",
          needCart: true,
          countText: '$count',
          onpressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                CartScreen(orderId: widget.orderId)));
          },
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: BlocBuilder<CustomerBloc, CustomerState>(
            builder: (context, state) {
              print('##########order ID ${widget.orderId}');
              if (state is OrderItemsFetching) {
                return Container(color: Colors.transparent, child: const Center(child: CircularProgressIndicator(color: primaryColor, backgroundColor: Colors.transparent)));
              }
              else if (state is OrderItemsFetched) {
                return state.itemsList?.isEmpty == true ?
                  const Center(
                    child: Text('No Data Found', style: TextStyle(fontSize: 14.0, color: textgrey, fontWeight: FontWeight.w600))
                  ) : ListView(
                  shrinkWrap: true,
                  children: [
                    Text(widget.subCatName ?? '--', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: textgrey)),
                    const SizedBox(height: 10),
                    const Text('Pick the Items', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey)),
                    const SizedBox(height: 18),
                    ListView.builder(
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: state.itemsList?.length,
                        itemBuilder: (BuildContext context, int index) {
                          counter.add(1);
                          priceValue.add(state.itemsList![index].amount.toString());
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
                                        Image.network(baseUrl + (state.itemsList?[index].itemServices?.item?.itemImage ?? '--'), height: 119, width: 111),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(state.itemsList?[index].itemServices?.item?.itemName ?? '--', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textgrey)),
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
                                                          customerRepository.getItemsIncreDecre(
                                                            token: authData.user_token!,
                                                            orderId: widget.orderId,
                                                            priceListId: state.itemsList![index].priceListId.toString(),
                                                            itemServiceId: state.itemsList![index].itemServices!.itemSerId.toString(),
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
                                                          customerRepository.getItemsIncreDecre(
                                                            token: authData.user_token!,
                                                            orderId: widget.orderId,
                                                            priceListId: state.itemsList![index].priceListId.toString(),
                                                            itemServiceId: state.itemsList![index].itemServices!.itemSerId.toString(),
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
                                                  Text('AED ${state.itemsList?[index].amount ?? '--'}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: textgrey)),
                                                ],
                                              ),
                                              const SizedBox(height: 8),
                                              SizedBox(
                                                height: 32,
                                                width: double.infinity,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    customerRepository.getItemAddCart(
                                                        token: authData.user_token!,
                                                        orderId: widget.orderId,
                                                        priceListId: state.itemsList![index].priceListId.toString(),
                                                        itemServiceId: state.itemsList![index].itemServices!.itemSerId.toString(),
                                                        quantity: '${counter[index]}',
                                                        amount: priceValue[index]).then((value) {
                                                      customerRepository.
                                                      getCartCount(token: authData.user_token!, orderId: widget.orderId).then((value) {
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
                                                    style: TextStyle(fontSize: 12.0, color: textgrey, fontWeight: FontWeight.w600),
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
      )
    );
  }
}
