import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListAll extends StatefulWidget {
  const ListAll({Key? key}) : super(key: key);

  @override
  _ListAllState createState() => _ListAllState();
}

class _ListAllState extends State<ListAll> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue, size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(
            child: Text("LIST ALL",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.w500))),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Branch"),
                  SizedBox(width: 30),
                  DropdownButton<String>(
                    hint: Text(
                      "Select",
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    value: selectedOption,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOption = newValue;
                      });
                    },
                    items: <String>[
                      'Option 1',
                      'Option 2',
                      'Option 3',
                      'Option 4'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<int>(
                    activeColor: Colors.lightBlue,
                    value: 0,
                    groupValue: allradionutton,
                    onChanged: (value) {
                      setState(() {
                        allradionutton = value!;
                      });
                    },
                  ),
                  SizedBox(width: 30),
                  Text("All"),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Filter by: '),
                  SizedBox(
                    width: 10,
                  ),
                  DropdownButton(
                    items: [
                      DropdownMenuItem(
                          child: Row(
                            children: [
                              Radio(
                                  value: 0, groupValue: null, onChanged: null),
                              Text('All'),
                            ],
                          ),
                          value: 0),
                      DropdownMenuItem(
                          child: Row(
                            children: [
                              Radio(
                                  value: 1, groupValue: null, onChanged: null),
                              Text('Staff wise'),
                            ],
                          ),
                          value: 1),
                      DropdownMenuItem(
                          child: Row(
                            children: [
                              Radio(
                                  value: 2, groupValue: null, onChanged: null),
                              Text('Area wise'),
                            ],
                          ),
                          value: 2),
                      DropdownMenuItem(
                          child: Row(
                            children: [
                              Radio(
                                  value: 3, groupValue: null, onChanged: null),
                              Text('Active'),
                            ],
                          ),
                          value: 3),
                      DropdownMenuItem(
                          child: Row(
                            children: [
                              Radio(
                                  value: 4, groupValue: null, onChanged: null),
                              Text('Inaactive'),
                            ],
                          ),
                          value: 4),
                    ],
                    onChanged: (value) {
                      // Handle dropdown value change
                    },
                    value: null,
                  ),
                  SizedBox(width: 30.0),
                  // ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[200]),
                  //     onPressed: () {
                  //       // Handle search button click
                  //     },
                  //     child: Icon(Icons.search,color: Colors.blue,)
                  // ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[500]),
                      onPressed: () {
                        // Handle search button click
                      },
                      child: Text(
                        "Load",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text("Search results",
                        style:
                            TextStyle(color: Colors.blue[800], fontSize: 20)),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  surfaceTintColor: Colors.white,
                  elevation: 2,
                  color: Colors.white,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 40,
                                child: Center(
                                    child: Text('Sl.No',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                              ),
                            ),
                            Expanded(
                              flex:2,
                              child: SizedBox(
                                child: Center(
                                    child: Text('Client Name',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                child: Center(
                                    child: Text('Area',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                child: Center(
                                    child: Text('Staff',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                child: Center(
                                    child: Text('Status',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                              ),
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
                          height: MediaQuery.of(context).size.height*0.5,
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 40,
                                      child: Center(child: Text('1')),
                                    ),
                                  ),
                                  Expanded(
                                    flex:2,
                                    child: SizedBox(
                                      child: Center(child: Text('Noor Shaa')),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      child: Center(child: Center(child: Text('Al Nadha'))),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      child: Center(child: Center(child: Text('Abu'))),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      child: Center(child: Center(child: Text('Active'))),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[600],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {
                          // Handle search button click
                        },
                        child: Text("View",
                            style: TextStyle(color: Colors.white))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[600],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {
                          // Handle search button click
                        },
                        child: Text("Edit",
                            style: TextStyle(color: Colors.white))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[600],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {
                          // Handle search button click
                        },
                        child: Text("Delete",
                            style: TextStyle(color: Colors.white))),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
