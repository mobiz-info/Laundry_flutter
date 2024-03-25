import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Reprint_invoice extends StatelessWidget {
  const Reprint_invoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurple,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("Reprint Invoice",style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.w500,))),
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
      body:  Column(
        children: [
          SizedBox(height:40),
          Padding(

            padding: const EdgeInsets.all(8.0),
            child: Card(
              surfaceTintColor: Colors.white,
              elevation: 2,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width + 250,
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width +
                              250, // Ensure it has a width
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      child: Center(
                                          child: Text('Sl.No',
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold))),
                                    ),
                                  ),SizedBox(width: 10,),
                                  Expanded(
                                    flex: 2,
                                    child: SizedBox(
                                      child: Center(
                                          child: Text('Cust Name',
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold))),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: SizedBox(
                                      child: Center(
                                          child: Text('Staff Name',
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold))),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox(
                                      child: Center(
                                          child: Text('Order N.o',
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold))),
                                    ),
                                  ),SizedBox(width: 5,),
                                  Expanded(
                                    flex: 2,
                                    child: SizedBox(
                                      child: Center(
                                          child: Text('InvNumber',
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold))),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox(
                                      child: Center(
                                          child: Text('Invoice Date',
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold))),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox(),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  height: 0.5,
                                  width: MediaQuery.of(context).size.width+250,
                                  color: Colors.deepPurple,
                                ),
                              ),
                              // Add the ListView inside a SizedBox with a specific height
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.7,
                                child: ListView.builder(
                                  itemCount: 20,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            child: Center(child: Text('1')),
                                          ),
                                        ),SizedBox(width: 10,),
                                        Expanded(
                                          flex:2,
                                          child: SizedBox(
                                            child:
                                            Center(child: Text('Abhi')),
                                          ),
                                        ),
                                        Expanded(
                                          flex:2,
                                          child: SizedBox(
                                            child:
                                            Center(child: Text('Noor')),
                                          ),
                                        ),
                                        Expanded(
                                          flex:3,
                                          child: SizedBox(
                                            child:
                                            Center(child: Text('1245')),
                                          ),
                                        ),SizedBox(width: 5,),
                                        Expanded(
                                          flex:2,
                                          child: SizedBox(
                                            child:
                                            Center(child: Text('1678')),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: SizedBox(
                                            height: 40,
                                            child: Center(
                                                child: Text(
                                                    'Today 4 : 00 pm')),
                                          ),
                                        ),
                                        Expanded(
                                          flex:3,
                                          child: SizedBox(
                                            child: InkWell(
                                              onTap: () {
                                              },
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(30),
                                                        color: Colors
                                                            .deepPurple),
                                                    child: const Center(
                                                        child: Padding(
                                                          padding: EdgeInsets.only(left: 5,right: 5),
                                                          child: Text(
                                                            'Reprint Invoice',
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 10),
                                                          ),
                                                        )),
                                                  ),
                                                  SizedBox(width: 10,),
                                                  CircleAvatar(
                                                    radius: 10,
                                                    child: Image(image: AssetImage("Assets/Images/whatsapp-icon-logo-8CA4FB831E-seeklogo.com.png"),),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );

                                    // ... Your previous code ...
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
