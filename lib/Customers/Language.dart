import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/ScreenAppbar.dart';
import '../src/Color.dart';

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
      backgroundColor: BgGrey,
      appBar: ScreenAppbar(text: "Select your Language", imagepath: "Assets/Images/lang_img.png"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              Card(
                elevation: 0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Radio(
                              fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
                              value: 'English',
                              groupValue: language,
                              onChanged: (value){
                                setState(() {
                                  language = value! ;
                                });//selected value
                              }
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('English', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: textgrey)),
                          ),
                          Container(
                              decoration: BoxDecoration(border: Border.all(color: primaryColor),
                                  borderRadius: BorderRadius.circular(30)),
                              child: const Padding(
                                padding: EdgeInsets.only(top: 2,bottom: 2,left: 6,right: 6),
                                child: Text('Default',style: TextStyle(fontSize: 10,color: primaryColor),),
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
                              value: 'Hindi',
                              groupValue: language,
                              onChanged: (value){
                                setState(() {
                                  language = value! ;
                                });//selected value
                              }
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Hindi', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: textgrey)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
                              value: 'Bangla',
                              groupValue: language,
                              onChanged: (value){
                                setState(() {
                                  language=value! ;
                                });//selected value
                              }
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Bangla', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: textgrey)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
                              value: 'Urdu',
                              groupValue: language,
                              onChanged: (value){
                                setState(() {
                                  language=value! ;
                                });//selected value
                              }
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Urdu', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: textgrey)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
                              value: 'Arabic',
                              groupValue: language,
                              onChanged: (value){
                                setState(() {
                                  language=value! ;
                                });//selected value
                              }
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Arabic', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: textgrey)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    'SAVE',
                    style: TextStyle(fontSize: 16.0, color: White),
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

