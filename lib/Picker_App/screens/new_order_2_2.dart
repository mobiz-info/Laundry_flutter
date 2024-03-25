import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/PickerBloc/picker_bloc.dart';
import 'package:golden_falcon/Picker_App/screens/add_to_cart.dart';
import 'package:golden_falcon/Picker_App/src/colors.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Repositories/PickerRepo/picker_repo.dart';

import '../../Utils/common.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/drawer.dart';

class NewOrderScreen_2_2 extends StatefulWidget {
  const NewOrderScreen_2_2({super.key});

  @override
  State<NewOrderScreen_2_2> createState() => _NewOrderScreen_2_2State();
}

class _NewOrderScreen_2_2State extends State<NewOrderScreen_2_2> {
  TextEditingController qtyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pickerPrimaryColor,
        leading: BackButton(color: Colors.white, onPressed: () => Navigator.pop(context),),
        title: Text("New Order Form - 2", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/Images/bg.png'), fit: BoxFit.fill),
        ),
        child: BottomDrawer(),
      ),
      body: BlocProvider(
        create: (context) => PickerBloc(
          RepositoryProvider.of<PickerRepository>(context),
        )..add(PckItemFetchEvent(authData.user_token.toString(), authData.pck_cat_id, authData.pck_sub_cat_id, authData.pck_ord_cstmr_id)),
        child: BlocBuilder<PickerBloc, PickerState>(
          builder: (context, state) {
            if (state is PckItemFetchingState) {
              print(state.toString());
              return Center(child: Text("Loading..."),);
            } else if (state is PckItemFetchedState) {
              print(state.toString());
              print(state.pckItemList.length);
              if (state.pckItemList.length > 0)
                return ListView.builder(
                itemCount: state.pckItemList.length,
                itemBuilder: (context, index) {
                  final lstData = state.pckItemList[index];
                  return InkWell(
                    onTap: () {
                      // authData.setSubCatId(state.pckItemList[index][index].priceListId);
                      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => NewOrderScreen_2_2(),), (route) => false);
                    //   {
                    //     "price_list_id": "dccee787-9c9a-4630-b90f-b0b8bd8374b6",
                    //   "item_ser_id": "636914fb-e8c7-4d09-98b9-bfb3155d9967",
                    //   "quantity":4,
                    //   "amount":40,
                    //   "order_id":"d1108501-7906-4702-8d72-e068b7677be3"
                    //
                    // }
                      print(authData.pck_ord_id);
                      print(state.pckItemList[index][index].amount);
                      print(state.pckItemList[index][index].itemServices.itemSerId);
                      print(state.pckItemList[index][index].priceListId);

                      showDialog(
                        context: context,
                        builder: (context) => new AlertDialog(
                          title: new Text('Enter Item quantity'),
                          content: Container(
                            height:100,
                            width:200,
                            child:Padding(
                              padding: const EdgeInsets.only(top:9.0),
                              child: TextField(
                                  textCapitalization: TextCapitalization.sentences,
                                  controller: qtyController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(8),),
                                    ),
                                    labelText: "Item Quantity",
                                  )),
                            )),
                          actions: <Widget>[
                            new ElevatedButton(
                              onPressed: () {
                                int itm_prc = int.parse(state.pckItemList[index][index].amount);
                                int itm_qty = int.parse(qtyController.text);
                                int total_prc = itm_qty * itm_prc;
                                List data = [
                                  {
                                    "price_list_id": state
                                        .pckItemList[index][index].priceListId,
                                    "item_ser_id": state
                                        .pckItemList[index][index]
                                        .itemServices
                                        .itemSerId,
                                    "quantity": qtyController.text.trim(),
                                    "amount": total_prc.toString(),
                                    "order_id": authData.pck_ord_id
                                  }
                                ];
                                qtyController.clear();
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => AddToCartScreen(data: data),), (route) => false); // dismisses only the dialog and returns nothing
                              },
                              child: new Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Card(
                        elevation: 10,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.blue[100],
                                          borderRadius:
                                          BorderRadius.circular(30),
                                        ),
                                        child: Image.network(
                                          // baseUrl+state.pckItemList[index][index].itemServices.item.itemImage,
                                          baseUrl+lstData[index].itemServices.item.itemImage,
                                          fit: BoxFit.fill,
                                        )),
                                    SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.pckItemList[index][index].itemServices.item.itemName,
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          state.pckItemList[index][index].amount,
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
              else
                return Center(child: Text("No List Data"));
            } else {
              print(state.toString());
              return Center(child: Text("No Data"));
            }
          },
        ),
      ),
    );
  }
}
