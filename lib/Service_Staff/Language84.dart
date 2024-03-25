import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  String language = 'language' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurple,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("LANGUAGE",style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.w500,))),
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: SizedBox(
                  width: 170,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Radio(
                              value: 'English',
                              groupValue: language,
                              onChanged: (value){
                                setState(() {
                                  language = value! ;
                                });//selected value
                              }
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text('English'),
                          ),
                          Container(
                              decoration: BoxDecoration(border: Border.all(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 2,bottom: 2,left: 6,right: 6),
                                child: Text('Defualt',style: TextStyle(fontSize: 10,color: Colors.blue),),
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 'Hindi',
                              groupValue: language,
                              onChanged: (value){
                                setState(() {
                                  language = value! ;
                                });//selected value
                              }
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text('Hindi'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 'Bangla',
                              groupValue: language,
                              onChanged: (value){
                                setState(() {
                                  language=value! ;
                                });//selected value
                              }
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text('Bangla'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 'Urdu',
                              groupValue: language,
                              onChanged: (value){
                                setState(() {
                                  language=value! ;
                                });//selected value
                              }
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text('Urdu'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 'Arabic',
                              groupValue: language,
                              onChanged: (value){
                                setState(() {
                                  language=value! ;
                                });//selected value
                              }
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text('Arabic'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(60),
                child: SizedBox(
                  height: 40,
                  width: 100,
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
                    onPressed: () {
                    },
                    child: Text('SAVE',style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}