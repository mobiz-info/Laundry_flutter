import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Areas extends StatefulWidget {
  const Areas({Key? key}) : super(key: key);

  @override
  State<Areas> createState() => _AreasState();
}

class _AreasState extends State<Areas> {
  String character = 'All' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("SERVICEABLE AREAS",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500))),
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
        child: Column(
          children: [
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
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 30,
                width: 250,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
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
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(bottom: 10),
                    hintText: 'Search..',
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Text('Sl. No',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              title: Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text('Area Name',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.5,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return
                      ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('1'),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Text('Diera'),
                        ),
                        trailing: Checkbox(
                          checkColor: Colors.white,
                          value: false,
                          onChanged: (bool? value) {
                            setState(() {
                            });
                          },
                        ),
                      );
                },),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue[700])),
                  onPressed: () {},
                  child: Text('SAVE',style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
