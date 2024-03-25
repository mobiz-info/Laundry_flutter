import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("CHANGE PASSWORD",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500))),
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
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF2196F3))),
                  contentPadding: EdgeInsets.only(left: 10),
                  label: Text('New Password'),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF2196F3))),
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF2196F3))),
                  contentPadding: EdgeInsets.only(left: 10),
                  label: Text('Re Enter Password'),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF2196F3))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: SizedBox(
                width: 150,
                child: ElevatedButton(onPressed: () {  },
                  child: Text('SAVE',style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
