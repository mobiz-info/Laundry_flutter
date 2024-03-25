import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../src/dimen.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => WalletScreenState();
}

class WalletScreenState extends State<WalletScreen> {
  bool isExpanded = false;
   String selectedOption='';
  String Bank = 'Select Your Bank';
  List<String> elements = ['Select Your Bank','State Bank of India','Federal Bank','Canara Bank','Punjab National Bank',];
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
        child:Appbar(text: 'Wallet',),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              height: 150,
              width: 280,
              decoration: BoxDecoration(
                  border: Border.all(color:pickerPrimaryColor)),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("Your Current Balance : 100"),
                ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 15),
                          child: ElevatedButton(onPressed: () { },
                            child: Text('Recharge',style: TextStyle(color: Colors.white),),
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.indigo.shade900)),
                          ),
                        ),
                      ],
                    ),
              ]),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Align(
              alignment: Alignment.center,
                child: Icon(Icons.keyboard_double_arrow_down,color: pickerPrimaryColor,size: 25,)),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              height: isExpanded ? 450 : 250,
              width: 280,
              decoration: BoxDecoration(
                  border: Border.all(color: pickerPrimaryColor)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    Center(
                      child: Container(
                        margin:  EdgeInsets.only(top: size.height * 0.02),
                        child: Text('Recharge',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,decoration: TextDecoration.underline,
                              color: pickerPrimaryColor
                          ),),
                      ),
                    ),
                    Spacer(),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text('Amount'),
                        ),
                        Container(
                          width: size.width * 0.15,
                          height: size.height *0.05,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: pickerPrimaryColor)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: '0'
                              ),
                            ),
                          )
                        ),
                      ],
                    ),
                    Spacer(),
                    Text('Mode of payment'),
                    Row(
                      children: [
                      Radio<String>(
                        value: 'cash',
                        groupValue: selectedOption,
                        onChanged: (value) {
                        setState(() {
                          isExpanded = false;
                        selectedOption = value!;
                    });
                    },
                    ),
                      Text('Cash'),
                      Radio<String>(
                        value: 'cheque',
                        groupValue: selectedOption,
                        onChanged: (value) {
                        setState(() {
                          isExpanded = true;
                        selectedOption = value!;
                    });
                    },
                    ),
                      Text('Cheque'),
                      Radio<String>(
                        value: 'online',
                        groupValue: selectedOption,
                        onChanged: (value) {
                        setState(() {
                          isExpanded = false;
                        selectedOption = value!;
                    });
                    },
                    ),
                      Text('Online'),
                    ],
                    ),
                      if(isExpanded)
                            Container(
                              width: 200,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.indigo.shade900),
                              ),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: 'Enter Cheque No.'
                                ),
                              ),
                            ),
                    if(isExpanded)
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        width: 200,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.indigo.shade900),
                        ),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: 'Enter Cheque Date'
                          ),
                        ),
                      ),
                    ),
                    if(isExpanded)
                    Padding(
                      padding: const EdgeInsets.only(top: 15,bottom: 15),
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(border: Border.all(color: Colors.indigo.shade900)),
                        child: DropdownButtonFormField(
                            validator: (d) {
                                  String x= d! as String;
                              if (x.contains('Select Your Bank')) {
                                return 'Select Your Bank';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefix: SizedBox(
                                width: 10,
                              ),
                                hintText: 'Select Your Bank',
                            ),
                            value: Bank,
                            items: elements.map((e) => DropdownMenuItem(value: e,child: Text(e),)).toList(),
                            onChanged: (v) {
                              setState(() {
                                Bank = v! as String;
                              });
                            }),
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20,bottom: 15),
                          child: ElevatedButton(onPressed: () { },
                            child: Text('CONTINUE',style: TextStyle(color: Colors.white)),
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.indigo[900])),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/Images/bg.png'), fit: BoxFit.fill),
        ),
        child: BottomDrawer(),
      ),
    );
  }
}
