import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Pendinglist extends StatefulWidget {
  const Pendinglist({Key? key}) : super(key: key);

  @override
  _PendinglistState createState() => _PendinglistState();
}

class _PendinglistState extends State<Pendinglist> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurple,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("PENDING LIST",style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.w500,))),
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
      body: Column(
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              elevation: 10,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
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
                          Expanded(
                            flex:2,
                            child: Container(
                              height: 40,
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
                            flex:2,
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
                            flex:2,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Delivery Date",
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
                      height: 170,
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(parent: FixedExtentScrollPhysics()),
                        itemCount: 3,
                        itemBuilder: (context, index) {

                          return Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    alignment: Alignment.center,
                                    child: Text("1"),
                                  ),
                                  Expanded(
                                    flex:2,
                                    child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Text("1002"),

                                    ),
                                  ),
                                  Expanded(
                                    flex:2,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text("Normal"),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text("Noor"),
                                    ),
                                  ),
                                  Expanded(
                                    flex:2,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text("21-2-23"),
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

          SizedBox(
            height: 30,
          ),
          // ElevatedButton(onPressed: () {
          //   Navigator.push(context, MaterialPageRoute(builder: (context) {
          //     return Dispatcheditems();
          //   },));
          // }, child: Text("Next"))
        ],
      ),

    );
  }
}
