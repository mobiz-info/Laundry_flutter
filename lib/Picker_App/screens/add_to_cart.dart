import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Picker_App/src/colors.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Repositories/PickerRepo/picker_repo.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Models/PickerModel/add_to_cart_model.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/drawer.dart';

class AddToCartScreen extends StatefulWidget {
  final List data;
  const AddToCartScreen({super.key, required this.data});

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  List<AddCartList> cartData = [];
  final PickerRepository pickerRepository = PickerRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
        child: Appbar(
          text: 'New Order Form - 2',
        ),
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/Images/bg.png'), fit: BoxFit.fill),
        ),
        child: BottomDrawer(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: pickerPrimaryColor),
              ),
              child: Column(
                children: [
                  Text("Details"),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Total Quantity : "),
                      Text(widget.data[0]['quantity']),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Total Amount : "),
                      Text(widget.data[0]['amount']),
                    ],
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    child: Text("Add to Cart", style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      Map<String, String> data = {
                        "price_list_id": widget.data[0]['price_list_id'],
                        "item_ser_id": widget.data[0]['item_ser_id'],
                        "quantity": widget.data[0]['quantity'],
                        "amount": widget.data[0]['amount'],
                        "order_id": widget.data[0]['order_id']
                      };
                      // BlocProvider.of<PickerBloc>(context).add(PckAddtoCartEvent(data, authData.user_token.toString()));
                      pickerRepository.addToCart(token: authData.user_token.toString(), body: data).then((value) {
                        if (value.status == true) {
                          print(value);
                          cartData.add(value.data as AddCartList);
                        }
                      });

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: pickerPrimaryColor,
                    ),
                  )
                ]
              )
            ),
            SizedBox(height: 12),
            BlocListener<PickerBloc, PickerState>(
              listener: (context, state) {
                if (state is PckAddedtoCartState) {
                  cartData.add(state.adCrtList as AddCartList);
                }
              },
              child: cartData.length > 0 ?
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    border: TableBorder.all(
                      color: pickerPrimaryColor
                    ),
                    columns: [
                      DataColumn(label: Center(child: Text("Sl.No"),)),
                      DataColumn(label: Center(child: Text("Item Name"),)),
                      DataColumn(label: Center(child: Text("Item Qty"),)),
                      DataColumn(label: Center(child: Text("Amount"),)),
                      DataColumn(label: Center(child: Text("Action"),)),
                    ],
                    rows: List<DataRow>.generate(
                      cartData.length,
                      (index) {
                        return DataRow(
                          cells: [
                            DataCell(Center(child: Text('${index + 1}'))),
                            DataCell(Center(child: Text('${cartData[index].itemService.item.itemName}'))),
                            DataCell(Center(child: Text('${cartData[index].quantity}'))),
                            DataCell(Center(child: Text('${cartData[index].amount}'))),
                            DataCell(Center(child: ElevatedButton(onPressed: (){}, child: Text("data")))),
                          ]
                        );
                      },
                    ),
                  ),
                ),
              ) :
              Container(),
            )

          ],
        ),
      ),
    );
  }
}
