import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Over_dues_300.dart';

class AgeingReport extends StatefulWidget {
  const AgeingReport({Key? key}) : super(key: key);

  @override
  _AgeingReportState createState() => _AgeingReportState();
}

class _AgeingReportState extends State<AgeingReport> {
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

  void _showPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height*0.6,
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height*0.2,
                      decoration:
                      BoxDecoration(border: Border.all(color: Colors.lightBlue)),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(height: 20),
                                Text("Shop Name",
                                    style:
                                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                SizedBox(width: 20),
                                Text("AED",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                SizedBox(height: 20),
                                Text("No of Invoice:10"),
                                SizedBox(width: 15),
                                Text("Amt:715"),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Text("Order due:3:"),
                                SizedBox(width: 20),
                                Text("Amt:715"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("AGEING REPORT",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500))),
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
            Container(
              height: 50,
              width: screenWidth * 0.65,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  ),
                  hintText: 'Customer Name/Mob No',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            SizedBox(
              height: screenHeight * 0.35,
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: _showPopup,
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      child: Card(
                        elevation: 2,
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
                                    Text("Shop Name",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                    SizedBox(width: screenWidth * 0.2),
                                    Text("AED",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 16)),
                                  ],
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Row(
                                  children: [
                                    SizedBox(height: screenHeight * 0.02),
                                    Text("No of Invoice:10"),
                                    SizedBox(width: screenWidth * 0.15),
                                    Text("Amt:715"),
                                  ],
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Row(
                                  children: [
                                    Text("Order due:3:"),
                                    SizedBox(width: screenWidth * 0.22),
                                    Text("Amt:715"),
                                  ],
                                ),
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
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Card(
                elevation: 2,
                child: Container(
                  decoration:
                  BoxDecoration(border: Border.all(color: Colors.lightBlue)),
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * 0.02),
                        Text("Total No of pending",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                        SizedBox(height: screenHeight * 0.02),
                        Row(
                          children: [
                            SizedBox(height: screenHeight * 0.02),
                            Text("Invoices:2100"),
                            SizedBox(width: screenWidth * 0.19),
                            Text("Amt:7150"),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Row(
                          children: [
                            Text("Order due:3:"),
                            SizedBox(width: screenWidth * 0.22),
                            Text("Amt:715"),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text("No of Customers:210"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
