import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/src/Color.dart';
import 'package:share_plus/share_plus.dart';

import '../Utils/ScreenAppbar.dart';

class ShareScreen extends StatefulWidget {
  const ShareScreen({Key? key}) : super(key: key);

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: BgGrey,
          appBar: ScreenAppbar(text: "Share App", imagepath: "Assets/Images/share_img.png"),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                children: [
                  Card(
                    elevation: 0,
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(height: 30,),
                        const Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Refer your friend and get'),
                            SizedBox(width: 6),
                            Text('5 AED',style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),)
                          ],
                        ),
                        const SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                          height: 150,
                          width: MediaQuery.of(context).size.width*0.6,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                              child: Image.asset('Assets/Images/share_bg.png',fit: BoxFit.fill,)),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        Share.share('Check Out this new Laundry App');
                      },
                      child: Text(
                        'SHARE NOW',
                        style: TextStyle(fontSize: 16.0, color: White),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
