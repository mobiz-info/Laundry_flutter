import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/ServiceBloc/service_bloc.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Repositories/ServiceRepository/service_repository.dart';

class Dispatcheditems extends StatefulWidget {
  const Dispatcheditems({Key? key}) : super(key: key);

  @override
  _DispatcheditemsState createState() => _DispatcheditemsState();
}

class _DispatcheditemsState extends State<Dispatcheditems> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceBloc(
        RepositoryProvider.of<ServiceRepository>(context),
      )..add(ServiceDispatchedOrderEvent(authData.user_token.toString(), authData.user_id.toString())),
      child: BlocBuilder<ServiceBloc, ServiceState>(
          builder: (context, state) {
            if (state is ServiceDispatchedOrderListFetchingState) {
              return Scaffold(
                appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.deepPurple,size: 30),
                  elevation: 0,
                  backgroundColor: CupertinoColors.white,
                  title: Center(child: Text("DISPATCHED",style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.w500,))),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.refresh_outlined,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                body: Center(child: CircularProgressIndicator(),),
              );
            } else if (state is ServiceDispatchedOrderListFetchedState) {
              return Scaffold(
                appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.deepPurple,size: 30),
                  elevation: 0,
                  backgroundColor: CupertinoColors.white,
                  title: Center(child: Text("DISPATCHED",style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.w500,))),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.refresh_outlined,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                body: state.dispatchedOrderList.length > 0 ?
                SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Card(
                        surfaceTintColor: Colors.white,
                        elevation: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 40,
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Sl No.",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Order No",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Order Type",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Staff",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Contact No",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Delivery Time",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ), Divider(
                                color: Colors.grey,
                                thickness: .3,
                                indent: 10,
                                endIndent: 10,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.7,
                                child: ListView.builder(
                                  physics: ClampingScrollPhysics(parent: FixedExtentScrollPhysics()),
                                  itemCount: state.dispatchedOrderList.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: Text("${index + 1}"),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: 40,
                                                alignment: Alignment.center,
                                                child: Text("${state.dispatchedOrderList[index].orderNumber}"),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: Text("${state.dispatchedOrderList[index].orderType}"),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: Text("${state.dispatchedOrderList[index].staff.name}"),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: Text("${state.dispatchedOrderList[index].staff.curMobile}"),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: Text("${state.dispatchedOrderList[index].deliveryTime}"),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                          thickness: .3,
                                          indent: 10,
                                          endIndent: 10,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30,),

                  ]),
                ) :
                Center(child: Text("No Dispatched Orders!"),),
              );
            } else {
              return Scaffold(
                appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.deepPurple,size: 30),
                  elevation: 0,
                  backgroundColor: CupertinoColors.white,
                  title: Center(child: Text("DISPATCHED",style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.w500,))),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.refresh_outlined,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                body: Center(child: Text("Something went wrong!"),),
              );
            }
          },
      ),
    );
  }
}
