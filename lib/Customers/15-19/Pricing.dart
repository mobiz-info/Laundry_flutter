import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Repositories/CustomerRepo/customer_repository.dart';
import 'package:golden_falcon/Utils/common.dart';

import '../../BLoCs/CustomerBloc/customer_bloc.dart';
import 'Transaction_History.dart';

class Pricing extends StatefulWidget {
  const Pricing({Key? key}) : super(key: key);

  @override
  _PricingState createState() => _PricingState();
}

class _PricingState extends State<Pricing> {
  String selectedCategoryId = '';
  Map<String, String> data = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue, size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(
            child: Text("PRICING",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.w500))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedCategoryId = "";
                  data = {};
                });
              },
              child: Icon(
                Icons.refresh_outlined,
                color: Colors.blue,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            if (selectedCategoryId.isEmpty)
              BlocProvider(
              create: (context) => CustomerBloc(
                RepositoryProvider.of<CustomerRepository>(context),
              )..add(GetCategoryEvent(
                  authData.user_token!, authData.user_id.toString())),
              child: BlocBuilder<CustomerBloc, CustomerState>(
                builder: (context, state) {
                  if (state is CategoryGettingState) {
                    print(state.toString());
                    return Center(child: Text('Loading..!'),);
                  } else if (state is CategoryGotState) {
                    print(state.toString());

                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Column(
                        children: [
                          Center(child: Text('Select Category'),),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.cList.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: (){
                                    setState(() {
                                      selectedCategoryId = state.cList[index].categoryId;
                                    });
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
                                                        baseUrl+state.cList[index].serviceMaster.categoryImage,
                                                        fit: BoxFit.fill,
                                                      )),
                                                  SizedBox(width: 20),
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        state.cList[index].categoryName,
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
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    print(state.toString());
                    return Center(child: Text('No Data!'),);
                  }
                },
              ),
            ),
            SizedBox(height: 20),
            if (selectedCategoryId.isNotEmpty && data.isEmpty)
              BlocProvider(
                create: (context) => CustomerBloc(
                  RepositoryProvider.of<CustomerRepository>(context),
                )..add(GetSubCategoryEvent(
                    authData.user_token!, selectedCategoryId)),
                child: BlocBuilder<CustomerBloc, CustomerState>(
                  builder: (context, state) {
                    if (state is SubCategoryGettingState) {
                      print(state.toString());
                      return Center(child: Text('Loading..!'),);
                    } else if (state is SubCategoryGotState) {
                      print(state.toString());
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: Column(
                          children: [
                            Center(child: Text('Select Sub Category'),),
                            Expanded(
                              child: ListView.builder(
                                itemCount: state.scList.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){
                                      setState(() {
                                        data = {
                                          "id": authData.user_id.toString(),
                                          "category_id": selectedCategoryId,
                                          "sub_cat_id": state.scList[index].subCatId,
                                        };
                                      });
                                      print(data);
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
                                                          baseUrl+state.scList[index].subServiceMaster.subCatImage,
                                                          fit: BoxFit.fill,
                                                        )),
                                                    SizedBox(width: 20),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          state.scList[index].subCatName,
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
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Center(child: Text('No Data..'),);
                    }
                  },
                ),
              ),
            if (data.isNotEmpty)
              BlocProvider(
                create: (context) => CustomerBloc(
                  RepositoryProvider.of<CustomerRepository>(context),
                )..add(GetItemEvent(authData.user_token!, data)),
                child: BlocBuilder<CustomerBloc, CustomerState>(
                  builder: (context, state) {
                    if (state is ItemGettingState) {
                      return Center(child: Text('Loading..'),);
                    } else if (state is ItemGotState) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: state.itemData.length,
                          itemBuilder: (context, index) {
                            return Padding(
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
                                                  borderRadius: BorderRadius.circular(30),
                                                ),
                                                child: Image.asset("Assets/Images/customer_pricing_shirt.jpg",fit: BoxFit.fill,)
                                            ),
                                            SizedBox(width: 20),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Shirt Men',
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  ' AED 6.93',
                                                  style: TextStyle(fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        // Add more pricing items here
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Center(child: Text('No Data..'),);
                    }
                  },
                ),
              )

          ],
        ),
      ),
    );
  }
}
