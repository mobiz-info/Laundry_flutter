import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Dispatchdashboard extends StatefulWidget {
  const Dispatchdashboard({Key? key}) : super(key: key);

  @override
  _DispatchdashboardState createState() => _DispatchdashboardState();
}

class _DispatchdashboardState extends State<Dispatchdashboard> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color color = Color(0xff0d2bd4);
  String? selectedOption;
  int allradionutton=0;

  bool isButtonVisible = false;
  int selectedRowIndex = -1;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          iconTheme: IconThemeData(color: Colors.blue,size: 30),
          elevation: 0,
          backgroundColor: CupertinoColors.white,
          title: Center(child: Text("DISPATCH DASHBOARD",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500))),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                Icons.refresh_outlined,
                color: Colors.blue,
                size: 30,
              ),
            ),
          ],
        ),
        body:
        SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Branch"),
                    SizedBox(width: 30),
                    DropdownButton<String>(
                      hint: Text("Select",style: TextStyle(fontSize: 10,color: Colors.grey),),
                      value: selectedOption,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedOption = newValue;
                        });
                      },
                      items: <String>[
                        'Option 1',
                        'Option 2',
                        'Option 3',
                        'Option 4'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Radio<int>(
                      activeColor: Colors.lightBlue,
                      value: 0,
                      groupValue: allradionutton,
                      onChanged: (value) {
                        setState(() {
                          allradionutton = value!;
                        });
                      },
                    ),
                    SizedBox(width: 30),
                    Text("All"),
                  ],
                ),

                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text("Ready for Delivery"),
                      ],
                    ),
                    SizedBox(width: 30), // Add spacing between the columns if needed
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                      children: [
                        Row(
                          children: [
                            Text("Express :"),
                            Text("10"),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Normal :"),
                            Text("100"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    surfaceTintColor: CupertinoColors.white,
                    elevation: 2,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height*0.5,
                            width: MediaQuery.of(context).size.width,
                            child:ListView.builder(
                                itemCount: 1,
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (context,index) {
                                  return Column(children: [
                                    SizedBox(
                                        height: 40,
                                        width: MediaQuery.of(context).size.width,
                                        child: Row(children: [
                                          Expanded(child: Container(
                                              alignment: Alignment.center,
                                              child: Text("Staff Name", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))),
                                          Expanded(child: Container(
                                              alignment: Alignment.center,

                                              child: Text("Status", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))),
                                          Expanded(child: Container(
                                              alignment: Alignment.center,

                                              child: Text("Ready for Delivery", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))),
                                          Expanded(child: Container(
                                              alignment: Alignment.center,

                                              child: Text("Dispatched", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))),
                                          Expanded(child: Container(
                                              alignment: Alignment.center,

                                              child: Text("Delivered", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))),
                                        ])),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height*0.4,
                                      width:MediaQuery.of(context).size.width,
                                      child: ListView.separated(
                                        separatorBuilder: (context, index) {
                                          return  Divider(
                                            color: Colors.grey,
                                            thickness: .3,
                                            indent: 10,
                                            endIndent: 10,
                                          );
                                        },
                                          padding: EdgeInsets.zero,
                                          physics: const ClampingScrollPhysics(),
                                          itemCount: 12,
                                          itemBuilder: (BuildContext context,int rowIndex){
                                            return  SizedBox(
                                              height: 40,
                                              width: MediaQuery.of(context).size.width,

                                              child: ListView.builder(
                                                  itemCount: 1,
                                                  scrollDirection: Axis.horizontal,
                                                  itemBuilder: (context,index) {
                                                    return Container(
                                                        height: 40,
                                                        width: MediaQuery.of(context).size.width,
                                                        child: Row(children: [
                                                          Expanded(child: Container(
                                                              alignment: Alignment.center,

                                                              child: Text("ABCD", style: TextStyle(color: Colors.black),))),
                                                          Expanded(child: Container(
                                                              alignment: Alignment.center,
                                                              child: Text("Onfield", style: TextStyle(color: Colors.black),))),
                                                          Expanded(child: Container(
                                                              alignment: Alignment.center,
                                                              child: Text("10", style: TextStyle(color: Colors.black),))),
                                                          Expanded(child: Container(
                                                              alignment: Alignment.center,
                                                              child: Text("5", style: TextStyle(color: Colors.black),))),
                                                          Expanded(child: Container(
                                                              alignment: Alignment.center,
                                                              child: Text("3", style: TextStyle(color: Colors.black),))),


                                                        ]));
                                                  }),
                                            );


                                          }),)

                                  ]);

                                })),
                      ),
                    ),
                  ),
                ),


                SizedBox(height: 30,),
const Text("Delivery Planner"),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Card(color: Colors.blue[200],child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("4pm-6pm"),
                      )),
                    ],
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    surfaceTintColor: CupertinoColors.white,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.50,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                    itemCount: 1,
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    physics: const ClampingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height*0.06,
                                            width: MediaQuery.of(context).size.width,
                                            child: Row(
                                              children: [
                                                Expanded(

                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Order No",
                                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex:2,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Client Name",
                                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Staff",
                                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Inv No.",
                                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Amt",
                                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Status",
                                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height*0.44,
                                            width: MediaQuery.of(context).size.width,
                                            child: ListView.separated(
                                              separatorBuilder: (context, index) {
                                                return  Divider(
                                                  color: Colors.grey,
                                                  thickness: .3,
                                                  indent: 10,
                                                  endIndent: 10,
                                                );
                                              },
                                              padding: EdgeInsets.zero,
                                              physics: const ClampingScrollPhysics(),
                                              itemCount: 6,
                                              itemBuilder: (BuildContext context, int rowIndex) {
                                                final isEvenRow = rowIndex % 2 == 0;
                                                final backgroundColor = isEvenRow ? Colors.yellow : Colors.white;

                                                return SizedBox(
                                                  height: 40,
                                                  width: MediaQuery.of(context).size.width,
                                                  child: ListView.builder(
                                                    itemCount: 1,
                                                    scrollDirection: Axis.horizontal,
                                                    itemBuilder: (context, index) {
                                                      return Container(
                                                        height: 40,
                                                        width: MediaQuery.of(context).size.width,
                                                        color: backgroundColor,
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                alignment: Alignment.center,
                                                                child: Text(
                                                                  "1",
                                                                  style: TextStyle(color: Colors.black),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex:2,
                                                              child: Container(
                                                                alignment: Alignment.center,
                                                                child: Text(
                                                                  "Deepesh",
                                                                  style: TextStyle(color: Colors.black),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                alignment: Alignment.center,
                                                                child: Text(
                                                                  "Hr",
                                                                  style: TextStyle(color: Colors.black),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                alignment: Alignment.center,
                                                                child: Text(
                                                                  "150",
                                                                  style: TextStyle(color: Colors.black),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                alignment: Alignment.center,
                                                                child: Text(
                                                                  "500",
                                                                  style: TextStyle(color: Colors.black),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                alignment: Alignment.center,
                                                                child: Text(
                                                                  "600",
                                                                  style: TextStyle(color: Colors.black),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),Text("*Express orders in Yellow Background")
                ,SizedBox(
                  height: 100,
                )
              ]),
        )  );
  }
}
