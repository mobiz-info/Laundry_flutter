import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Order_Status.dart';

class Contactlessmode extends StatefulWidget {
  const Contactlessmode({Key? key}) : super(key: key);

  @override
  _ContactlessmodeState createState() => _ContactlessmodeState();
}

class _ContactlessmodeState extends State<Contactlessmode> {
  Color color = Color(0xff0d2bd4);
  int neworderradio = 0;
  int availableoffersradio = 0;
  int containerradio = 0;
  bool directStaffCheckbox = false;
  bool contactlessCheckbox = false;
  bool isTableRowSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CupertinoColors.white,
          leading: Icon(
            Icons.menu,
            color: Colors.blue[800],
            size: 30,
          ),
          title: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "LOGO",
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                Icon(
                  Icons.circle_outlined,
                  color: Colors.blue[800],
                ),
                SizedBox(width: 10,)
              ],
            ),
          ],
        ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Text(
                "CONTACTLESS MODE",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "New Order",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio<int>(
                      activeColor: Colors.lightBlue,
                      value: 0,
                      groupValue: neworderradio,
                      onChanged: (value) {
                        setState(() {
                          neworderradio = value!;
                        });
                      },
                    ),
                    Text('Normal'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio<int>(
                      hoverColor: Colors.lightBlue,
                      activeColor: Colors.lightBlue,
                      value: 1,
                      groupValue: neworderradio,
                      onChanged: (value) {
                        setState(() {
                          neworderradio = value!;
                        });
                      },
                    ),
                    Text('Express'),
                  ],
                ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Available Offers For You",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<int>(
                    activeColor: Colors.lightBlue,
                    value: 0,
                    groupValue: availableoffersradio,
                    onChanged: (value) {
                      setState(() {
                        availableoffersradio = value!;
                      });
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                    ),
                    height: MediaQuery.of(context).size.height * 0.025,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text('Promocode -20'),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<int>(
                    hoverColor: Colors.lightBlue,
                    activeColor: Colors.lightBlue,
                    value: 1,
                    groupValue: availableoffersradio,
                    onChanged: (value) {
                      setState(() {
                        availableoffersradio = value!;
                      });
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                    ),
                    height: MediaQuery.of(context).size.height * 0.025,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Center(child: Text('Ramadan-10')),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    activeColor: Colors.lightBlue,
                    value: directStaffCheckbox,
                    onChanged: (value) {
                      setState(() {
                        directStaffCheckbox = value!;
                      });
                    },
                  ),
                  Text('Direct Staff'),
                  SizedBox(width: 20),
                  Checkbox(
                    activeColor: Colors.lightBlue,
                    value: contactlessCheckbox,
                    onChanged: (value) {
                      setState(() {
                        contactlessCheckbox = value!;
                      });
                    },
                  ),
                  Text('Contactless'),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Container(
                  height: 30,
                  width: 260,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<int>(
                        activeColor: Colors.lightBlue,
                        value: 0,
                        groupValue: containerradio,
                        onChanged: (value) {
                          setState(() {
                            containerradio = value!;
                          });
                        },
                      ),
                      Text('Add Items'),
                      SizedBox(width: 20),
                      Radio<int>(
                        hoverColor: Colors.lightBlue,
                        activeColor: Colors.lightBlue,
                        value: 1,
                        groupValue: containerradio,
                        onChanged: (value) {
                          setState(() {
                            containerradio = value!;
                          });
                        },
                      ),
                      Row(
                        children: [
                          Text('Skip'),
                          Text(
                            "(Default)",
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              if (containerradio == 0)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Card(
                        elevation: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
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
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 40,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Category",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 80,
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "No of items",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 80,
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Rate",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ), Divider(
                                color: Colors.grey,
                                thickness: .3,
                                indent: 10,
                                endIndent: 10,
                              ),
                              SizedBox(
                                height: 120,
                                child: ListView.builder(
                                  physics: ClampingScrollPhysics(parent: FixedExtentScrollPhysics()),
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 60,
                                              height: 40,
                                              alignment: Alignment.center,
                                              child: Text(""),
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: 40,
                                                alignment: Alignment.center,
                                                child: Text(""),
                                              ),
                                            ),
                                            Container(
                                              width: 80,
                                              height: 40,
                                              alignment: Alignment.center,
                                              child: Text(""),
                                            ),
                                            Container(
                                              width: 80,
                                              height: 40,
                                              alignment: Alignment.center,
                                              child: Text(""),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                          thickness: .3,
                                          indent: 10,
                                          endIndent: 10,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Text("Total",
                              style: TextStyle(color: Colors.black38)),
                        )
                      ],
                    ),
                    Icon(Icons.keyboard_double_arrow_down,
                        color: Colors.blue[900]),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Choose Category"),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.30,
                          height: MediaQuery.of(context).size.height * 0.035,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.lightBlue)),
                          child: Center(child: Text("Press & Fold")),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * .10,
                                width: MediaQuery.of(context).size.width * .22,
                                decoration: BoxDecoration(border: Border.all()),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Text("Shirts"),
                            SizedBox(
                              width: 50,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.lightBlue)),
                              child: Center(child: Text("2")),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * .10,
                                width: MediaQuery.of(context).size.width * .22,
                                decoration: BoxDecoration(border: Border.all()),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Text("Pants"),
                            SizedBox(
                              width: 50,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.lightBlue)),
                              child: Center(child: Text("2")),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * .10,
                                width: MediaQuery.of(context).size.width * .22,
                                decoration: BoxDecoration(border: Border.all()),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Text("Others"),
                            SizedBox(
                              width: 50,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.lightBlue)),
                              child: Center(child: Text("2")),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue,),

                      height: MediaQuery.of(context).size.height * .04,
                      width: MediaQuery.of(context).size.width * .35,
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return Orderstushistory();
                            },));
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                )
              else
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("No of Bags"),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.03,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.lightBlue)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 18,
                        ),
                        Text("Delivery"),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.03,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.lightBlue)),
                          child: Center(
                              child: Text(
                            "Date ",
                            style: TextStyle(color: Colors.black26),
                          )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.51,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.03,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.lightBlue)),
                          child: Center(
                              child: Text(
                            "Time",
                            style: TextStyle(color: Colors.black26),
                          )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue,),
                      height: MediaQuery.of(context).size.height * .04,
                      width: MediaQuery.of(context).size.width * .35,
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return Orderstushistory();
                            },));
                          },
                          child: Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
