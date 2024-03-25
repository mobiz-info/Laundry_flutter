import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Owners/Pages/AssignStaff.dart';

class Assign extends StatefulWidget {
  const Assign({Key? key}) : super(key: key);

  @override
  State<Assign> createState() => _AssignState();
}

class _AssignState extends State<Assign> {
  String character = 'All' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("ASSIGN STAFF TO LOCALITY",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500))),
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
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 15),
                child: Text(
                  'Home',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue[900]),
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('Branch'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15,bottom: 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue)),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(bottom: 10),
                        prefix: SizedBox(
                          width: 10,
                        ),
                        hintText: 'Select',
                      ), items: [
                      DropdownMenuItem(child: Text('select'))
                    ],
                      onChanged: (value) {  },
                    ),
                  ),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: '',
                  groupValue: character,
                  onChanged: (value) {
                    setState(() {
                      character = value!;
                    });
                  },
                ),
                Text('All'),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue[700])),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AssignStaff(),));
                    },
                    child: Text('Add New',style: TextStyle(color: Colors.white),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width*0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.blue)),
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
                              child: Icon(CupertinoIcons.search)),
                        ),
                        contentPadding: EdgeInsets.only(bottom: 13),
                        border: InputBorder.none,
                        hintText: 'Search..',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Container(
                  width: 60,
                  child: Center(child: Text('Sl.No',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                ),
                Container(
                  width: 110,
                  child: Center(child: Text('Emp Name',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                ),
                Expanded(
                  child: Container(
                    child: Center(child: Text('Area',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                  ),
                ),
                Container(
                  width: 100,
                  child: Center(child: Text('Locality',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                ),
              ],),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 30),
              child: Container(
                height: 1,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.5,
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                return
                  Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 60,
                            child: Center(child: Text('1')),
                          ),
                          Container(
                            width: 110,
                            child: Center(child: Text('Deepesh')),
                          ),
                          Expanded(
                            child: Container(
                              child: Center(child: Text('Al Nahda')),
                            ),
                          ),
                          Container(
                            width: 100,
                            child: Center(child: Text('Doha Street')),
                          ),
                        ],),
                      Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: () {

                          }, icon: Icon(Icons.edit,size: 16,color: Colors.blue,)),
                          Row(
                            children: [
                              IconButton(onPressed: () {

                              }, icon: Icon(Icons.delete,size: 16,color: Colors.blue,))
                            ],
                          )
                        ],
                      )
                    ],
                  );
              },),
            )
          ],
        ),
      ),
    );
  }
}
