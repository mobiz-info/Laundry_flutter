import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bag extends StatefulWidget {
  const Bag({Key? key}) : super(key: key);

  @override
  State<Bag> createState() => _BagState();
}

class _BagState extends State<Bag> {
  String selectedOption='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                  bottom: Radius.elliptical(200, 50)),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.cyan, Colors.blue.shade900])),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 55),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, color: CupertinoColors.white),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 55),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                )),
          )
        ],
        toolbarHeight: 130,
        title: const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: Text(
                'LOGO',
                style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            )),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(200, 50),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  'BAGS',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                      color: Colors.blue[900]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15,top: 20),
                  child: Text('No of Bags'),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text('Green'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20,),
                      child: Container(
                        width: 70,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(color: Colors.green)),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text('Orange'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20,),
                      child: Container(
                        width: 70,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(color: Colors.orange)),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text('Yellow'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        width: 70,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(color: Colors.yellow)),
                      ),
                    ),
                  ],
                ),
              ],),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20,right: 20,left: 34),
                    child: Text('Total'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20,bottom: 20),
                    child: Container(
                      width: 70,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: Colors.blue)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text('Mode of Payment',style: TextStyle(fontSize: 18),),
            ),
            SizedBox(
              width: 180,
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Cash on Delivery',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        },
                      ),
                      Text('Cash on Delivery')
                    ],
                  ),
            Row(
              children: [
                Radio<String>(
                  value: 'Online Payment',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
                Text('Online Payment')
              ],
            ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue[700])),
                onPressed: () {},
                child: Text('Save & Continue',style: TextStyle(color: Colors.white),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Your Order is Confirmed',style: TextStyle(fontSize: 16),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Order No is : xxxxxxxxx'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Your Order will be delivered next 24 hrs'),
                      )
                    ],
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
