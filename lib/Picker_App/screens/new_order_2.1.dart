import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/PickerBloc/picker_bloc.dart';
import 'package:golden_falcon/Picker_App/screens/new_order_2_2.dart';
import 'package:golden_falcon/Picker_App/src/colors.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Repositories/PickerRepo/picker_repo.dart';

import '../../Utils/common.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/drawer.dart';

class NewOrderScreen2_1 extends StatefulWidget {
  final String categId;
  const NewOrderScreen2_1({super.key, required this.categId});

  @override
  State<NewOrderScreen2_1> createState() => _NewOrderScreen2_1State();
}

class _NewOrderScreen2_1State extends State<NewOrderScreen2_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pickerPrimaryColor,
        leading: BackButton(
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
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
        )..add(PckSubCategoryFetchEvent(authData.user_token.toString(), widget.categId)),
        child: BlocBuilder<PickerBloc, PickerState>(
          builder: (context, state) {
            if (state is PckSubCategoryFetchingState) {
              return Center(child: Text('Loading..'),);
            } else if (state is PckSubCategoryFetchedState) {
              if (state.subCategList.length > 0)
                return ListView.builder(
                itemCount: state.subCategList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      authData.setSubCatId(state.subCategList[index].subCatId);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewOrderScreen_2_2(),));
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
                                          baseUrl+state.subCategList[index].subServiceMaster.subCatImage,
                                          fit: BoxFit.fill,
                                        )),
                                    SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.subCategList[index].subServiceMaster.subCatName,
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
                return Center(child: Text("No Data!"),);
            } else {
              return Center(child: Text("Error loading Data"),);
            }
          },
        ),
      ),
    );
  }
}
