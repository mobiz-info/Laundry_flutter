import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverDues extends StatefulWidget {
  const OverDues({Key? key}) : super(key: key);

  @override
  _OverDuesState createState() => _OverDuesState();
}

class _OverDuesState extends State<OverDues> {

  bool isButtonVisible = false;
  int selectedRowIndex = -1;


  Color color = Color(0xff0d2bd4);
  String? selectedOption;
  int allradionutton = 0;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("OVER DUES",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500))),
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
            SizedBox(height: 20,),
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
                    onTap: () {
                      setState(() {
                        selectedRowIndex = index;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      child: Card(
                        elevation: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.lightBlue),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(screenWidth * 0.03),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: screenHeight * 0.01),
                                Text(
                                  "Customer Name",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Row(
                                  children: [
                                    SizedBox(height: screenHeight * 0.02),
                                    Text("No of Invoice:10"),
                                    SizedBox(width: screenWidth * 0.15),
                                    Text("In Over Due:715"),
                                  ],
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Text("Amount:x"),
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

            if (selectedRowIndex != -1)
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.03),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.lightBlue),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * 0.02),
                        Row(
                          children: [
                            SizedBox(height: screenHeight * 0.02),
                            Text("Date:x/x/x"),
                            SizedBox(width: screenWidth * 0.19),
                            Text("Inv No:xxx"),
                          ],
                        ), SizedBox(height: screenHeight * 0.02),
                        Text("Amt:xx"),
                        SizedBox(height: screenHeight * 0.02),
                        Row(
                          children: [
                            Text("Paid:x"),
                            SizedBox(width: screenWidth * 0.26),
                            Text("Balance:xx"),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text("Days Passed:xx"),
                      SizedBox(height: 20,)
                      ],

                    ),
                  ),
                ),
              ),
            SizedBox(height: 30,)
            ,
            Text("Summary"),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(color: Colors.blue[300],shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: screenHeight * 0.02),
                        Text("Total No of Invoice in Over Due:xxx",style: TextStyle(color: CupertinoColors.white),),
                        SizedBox(height: screenHeight * 0.02),
                        SizedBox(width: screenWidth * 0.26),
                        Text("Amount:xxxx",style: TextStyle(color: CupertinoColors.white)),
                        SizedBox(height: screenHeight * 0.06),
                      ],
                    ),
                  ),
                ),
              ),
            ) 
          ],
        ),
      ),

    );
  }
}
