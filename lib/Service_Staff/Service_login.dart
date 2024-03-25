import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceLogin extends StatefulWidget {
  const ServiceLogin({Key? key}) : super(key: key);

  @override
  State<ServiceLogin> createState() => _ServiceLoginState();
}

class _ServiceLoginState extends State<ServiceLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurple,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("SERVICE LOGIN",style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.w500,))),
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
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 30,
              width: MediaQuery.of(context).size.width*0.60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(30)
              ),
              child:
              TextFormField(
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                        width: 35,
                        decoration: BoxDecoration(color: Colors.grey,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30))
                        ),
                        child: Icon(CupertinoIcons.search,color: Colors.deepPurple,)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Search..',
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text('Engage',style: TextStyle(fontSize: 18),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              color: Colors.white,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: Center(child: Text('Sl.No',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold))),
                          ),
                          SizedBox(
                            height: 40,
                            width: 60,
                            child: Center(child: Text('Order No',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold))),
                          ),
                          SizedBox(
                            height: 40,
                            width: 70,
                            child: Center(child: Text('Order Type',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold))),
                          ),
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: Center(child: Text('Staff',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold))),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: Center(child: Text('Delivery Time',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold))),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                            height: 40,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            height: 0.5,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          itemCount: 2,
                          itemBuilder: (context, index) {
                          return
                              Row(
                                children: [
                                  SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Center(
                                        child: Text('1',style: TextStyle(fontSize: 12),)),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 60,
                                    child: Center(
                                        child: Text('108',style: TextStyle(fontSize: 12),)),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 70,
                                    child: Center(
                                        child: Text('Express',style: TextStyle(fontSize: 12),)),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Center(
                                        child: Text('Abdu',style: TextStyle(fontSize: 12),)),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 40,
                                      child: Center(
                                          child: Text('Today 4 : 00 pm',style: TextStyle(fontSize: 12),)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Center(
                                        child:  InkWell(onTap: () { },
                                          child: Container(
                                            height: 20,
                                            width: 50,
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.deepPurple),
                                            child: const Center(child: Text('Start',style: TextStyle(color: Colors.white,fontSize: 10),)),
                                          ),
                                        ),),
                                  ),
                                ],
                              );
                        },),
                      )
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
