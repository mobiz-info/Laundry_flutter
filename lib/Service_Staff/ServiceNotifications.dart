import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceNotifications extends StatefulWidget {
  const ServiceNotifications({Key? key}) : super(key: key);

  @override
  State<ServiceNotifications> createState() => _ServiceNotificationsState();
}

class _ServiceNotificationsState extends State<ServiceNotifications> {
  List<int> selectedIndices = [];

  void toggleSelection(int index) {
    setState(() {
      if (selectedIndices.contains(index)) {
        selectedIndices.remove(index);
      } else {
        selectedIndices.add(index);
      }
    });
  }

  void deleteSelected() {
    setState(() {
      selectedIndices.sort();
      selectedIndices.reversed.forEach((index) {

      });
      selectedIndices.clear();
    });
  }

  final List<String> notifications = [
    'Received your order. Noor will come and pick by 4:00pm',
    'Order No:AB 123 has delivered.',
    'Inv No : 1xxx paid via cash.',
  ];
  final List<String> Date = [
    '9:19am',
    '01-04-2022',
    '01-04-2022',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurple,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("NOTIFICATIONS",style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.w500))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.refresh_outlined,
              color: Colors.deepPurple,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               SizedBox(
                 height: 20,
               ),
               if (selectedIndices.length >= 2)
                 Column(
                   children: [
                     IconButton(
                       icon: Icon(Icons.delete,color: Colors.deepPurple,),
                       onPressed: deleteSelected,
                     ),
                   ],
                 ),
             ],),
            Center(
              child: Text('Today',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,decoration: TextDecoration.underline,
                ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (BuildContext context, int index) {
                    final isSelected = selectedIndices.contains(index);
                    return ListTile(
                      tileColor: isSelected ? Colors.grey : null,
                      dense: true,
                      visualDensity: VisualDensity(vertical: 4),
                      leading: SizedBox(
                        width: 80,
                          child: Center(child: Text(Date[index]))),
                      title: Text(notifications[index]),
                      trailing: Container(
                        height: 20,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: InkWell(
                          onTap: () { },
                          child: Center(
                              child: Text('Delete',style: TextStyle(color: Colors.deepPurple,fontSize: 12),)),
                        ),
                      ),
                      onTap: () {
                        toggleSelection(index);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
