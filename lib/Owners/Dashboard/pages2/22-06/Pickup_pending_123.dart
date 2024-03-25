import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Pickup_Pending_Home_122.dart';

class PickUpPending extends StatefulWidget {
  const PickUpPending({Key? key}) : super(key: key);

  @override
  _PickUpPendingState createState() => _PickUpPendingState();
}

class _PickUpPendingState extends State<PickUpPending> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color color = Color(0xff0d2bd4);
  String? selectedOption;
  int allradionutton = 0;

  bool isButtonVisible = false;
  int selectedRowIndex = -1;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("Pickup pending",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500))),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    SizedBox(width: screenWidth * 0.01),
                    Text("All"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    SizedBox(width: screenWidth * 0.01),
                    Text("Staff Value"),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Container(
              height: 50,
              width: screenWidth * 0.6,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 30),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  ),
                  hintText: 'Search',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            SizedBox(
              height: screenHeight * 0.7,
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    child: Container(
                      decoration:
                      BoxDecoration(border: Border.all(color: Colors.lightBlue)),
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.03),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(height: screenHeight * 0.02),
                                Text("Order No:"),
                                SizedBox(width: screenWidth * 0.2),
                                Text("Time:"),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            Text("Client Name:"),
                            SizedBox(height: screenHeight * 0.01),
                            Row(
                              children: [
                                SizedBox(height: screenHeight * 0.02),
                                Text("Building Name:"),
                                SizedBox(width: screenWidth * 0.15),
                                Text("House No:"),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Row(
                              children: [
                                Text("Area:"),
                                SizedBox(width: screenWidth * 0.25),
                                Text("Locality:"),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Text("Staff Assigned:"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: screenWidth * 0.04, top: screenHeight * 0.02),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue[500],
                                    ),
                                    onPressed: () {},
                                    child: Text("Remind",style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // ElevatedButton(onPressed: () {
            //   Navigator.push(context, MaterialPageRoute(builder: (context) {
            //     return PickupPending();
            //   },));
            // }, child: Text("Next"))
          ],
        ),
      ),
    );
  }
}
