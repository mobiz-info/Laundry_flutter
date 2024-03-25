import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Picker_App/screens/new_order_2.1.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../../Utils/common.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/drawer.dart';

class NewOrderScreen2 extends StatefulWidget {
  final String cstId;
  const NewOrderScreen2({super.key, required this.cstId});

  @override
  State<NewOrderScreen2> createState() => _NewOrderScreen2State();
}

class _NewOrderScreen2State extends State<NewOrderScreen2> {
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
      body: BlocProvider(
        create: (context) => PickerBloc(
          RepositoryProvider.of<PickerRepository>(context),
        )..add(PckCategoryFetchEvent(authData.user_token.toString(), authData.user_id.toString())),
        child: BlocBuilder<PickerBloc, PickerState>(
          builder: (context, state) {
            if (state is PckCategoryFetchingState) {
              print(state.toString());
              return Center(child: Text('Loading'),);
            } else if (state is PckCategoryFetchedState) {
              print(state.toString());
              if (state.categList.length > 0)
                return ListView.builder(
                itemCount: state.categList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      authData.setCatId(state.categList[index].categoryId);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewOrderScreen2_1(categId: state.categList[index].categoryId),));
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
                                          baseUrl+state.categList[index].serviceMaster.categoryImage,
                                          fit: BoxFit.fill,
                                        )),
                                    SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.categList[index].serviceMaster.categoryName,
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
                return Center(child: Text("No Data"),);
            } else {
              print(state.toString());
              return Center(child: Text("Error Fetching Data"),);
            }
          },
        ),
      ),
    );
  }
}
