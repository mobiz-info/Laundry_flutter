import 'package:flutter/material.dart';

import '../Utils/ScreenAppbar.dart';
import '../src/Color.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({Key? key}) : super(key: key);

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BgGrey,
      appBar: ScreenAppbar(
        text: 'Terms & Conditions',
        needAction: true,
        svgNeed: true,
        imagepath: "Assets/Images/terms_conditions_img.svg",
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text('Last Updated on', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: textgrey)),
                  SizedBox(width: 4),
                  Text('05.03.2024', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: primaryColor)),
                ],
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    child: const Icon(Icons.brightness_1, size: 8.0, color: primaryColor),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(child: Text('We shall not be responsible for any items not collected within a period of two months.', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey))),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    child: const Icon(Icons.brightness_1, size: 8.0, color: primaryColor),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(child: Text('We shall not be responsible for value left in the pockets of your garments.', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey))),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    child: const Icon(Icons.brightness_1, size: 8.0, color: primaryColor),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(child: Text('We shall not be responsible for any change of color or shrinkage of garments', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey))),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    child: const Icon(Icons.brightness_1, size: 8.0, color: primaryColor),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(child: Text('Compensation for damaged garments shall be limited to a maximum of five times cleaning charge.', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textgrey))),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    child: const Icon(Icons.brightness_1, size: 8.0, color: primaryColor),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(child: Text('NO COMPLAINTS WILL BE ACCEPTED 48 HOURS AFTER THE DELIVERY.', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: textgrey))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

