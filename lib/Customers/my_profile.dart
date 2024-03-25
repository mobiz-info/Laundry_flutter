import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Utils/ScreenAppbar.dart';
import '../src/Color.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  final List<String> svgPaths = [
    'Assets/Images/help_icon.svg',
    'Assets/Images/help_icon.svg',
    'Assets/Images/help_icon.svg',
    'Assets/Images/help_icon.svg'
  ];

  final List<String> names = [
    'Edit Profile',
    'Select Language',
    'Saved Address',
    'Change Password'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BgGrey,
      appBar: ScreenAppbar(
          text: "My Profile",
          svgNeed: true,
          imagepath: "Assets/Images/user_icon.svg"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 39,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: DividerGrey),
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 24),
                            SvgPicture.asset('Assets/Images/orders_profile_icon.svg'),
                            const SizedBox(width: 12),
                            const Text('Orders', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 39,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: DividerGrey),
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 24),
                            SvgPicture.asset('Assets/Images/wallet_icon.svg'),
                            const SizedBox(width: 12),
                            const Text('Wallet', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 39,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: DividerGrey),
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 24),
                            SvgPicture.asset('Assets/Images/rewards_icon.svg'),
                            const SizedBox(width: 12),
                            const Text('Rewards', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 39,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: DividerGrey),
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 24),
                            SvgPicture.asset('Assets/Images/help_icon.svg'),
                            const SizedBox(width: 12),
                            const Text('Help', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                //height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: DividerGrey),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Account Settings',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: textgrey),
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: svgPaths.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: SvgPicture.asset(svgPaths[index]),
                              title: Text(names[index], style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey)),
                              trailing: const Icon(Icons.arrow_forward_ios_rounded, color: DividerGrey),
                            ),
                          );
                        }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

