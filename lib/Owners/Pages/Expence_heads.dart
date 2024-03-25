import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({Key? key}) : super(key: key);

  @override
  State<Expense> createState() => _ExpenceState();
}

class _ExpenceState extends State<Expense> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("EXPENSE HEADS",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500))),
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
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 120,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      setState(() {
                        isPressed = true;
                      });
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(CupertinoIcons.add,size: 16,color: Colors.white,),
                        ),
                        Text('Create',style: TextStyle(color: Colors.white),),
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                elevation: 2,
                surfaceTintColor: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 60,
                            height: 40,
                            alignment: Alignment.center,
                            child: Text(
                              "Sl No.",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        Expanded(
                          child: Container(
                              height: 40,
                              alignment: Alignment.center,
                              child: Text(
                                "Heads",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        Container(
                            width: 120,
                            height: 40,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        color: Colors.blue,
                        height: 0.5,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.5,
                      child: ListView.builder(
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return
                            Row(
                              children: [
                                Container(
                                    width: 60,
                                    height: 40,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "1",
                                    )),
                                Expanded(
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Deepesh",
                                      )),
                                ),
                                Container(
                                    width: 120,
                                    height: 40,
                                    alignment: Alignment.center,
                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.edit,size: 15,color: Colors.blue,),
                                        ),
                                        Icon(Icons.delete,size: 15,color: Colors.blue,)
                                      ],
                                    )
                                ),
                              ],
                            );
                        },),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            if(isPressed)
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width*0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue),
              ),
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Name'),
                      Container(
                        height: 30,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.blue)
                        ),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                        onPressed: () { },
                        child: Text('Add',style: TextStyle(color: Colors.white),)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
