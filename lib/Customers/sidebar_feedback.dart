import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_falcon/Customers/Customer_Home.dart';

import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../components/common_methods.dart';
import '../src/Color.dart';
import 'Edit.dart';

class SideBarFeedback extends StatefulWidget {
  const SideBarFeedback({Key? key}) : super(key: key);

  @override
  State<SideBarFeedback> createState() => _SideBarFeedbackState();
}

class _SideBarFeedbackState extends State<SideBarFeedback> {

  TextEditingController feedbackController = TextEditingController();
  final CustomerRepository customerRepository = CustomerRepository();
  String selectedEmojiText = '';

  void selectEmoji(String emojiText) {
    setState(() {
      selectedEmojiText = emojiText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BgGrey,
      appBar: ScreenAppbar(
        text: 'Feedback',
        svgNeed: true,
        imagepath: "Assets/Images/feedback_icon.svg",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Your Feeback help us to Improve.', style: TextStyle(fontSize: 18, color: textgrey, fontWeight: FontWeight.w400)),
              const SizedBox(height: 8),
              const Text('Please let us know your experience', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400)),
              const SizedBox(height: 38),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < 5; i++)
                    GestureDetector(
                      onTap: () => selectEmoji(getEmojiText(i)),
                      child: Column(
                        children: [
                          selectedEmojiText == getEmojiText(i)?
                          CircleAvatar(
                            radius: 29, backgroundColor: greenColor,
                            child: CircleAvatar(radius: 28, backgroundColor: BgGrey,
                                child: SvgPicture.asset(getEmojiImage(i), height: 36, width: 36)),
                          )
                              : SvgPicture.asset(getEmojiImage(i), height: 36, width: 36),
                          const SizedBox(height: 4),
                          Text(getEmojiText(i),
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: selectedEmojiText == getEmojiText(i) ? greenColor : lightGreyText),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 38),
              CustomTextField(
                hintText: 'Type your message here...',
                controllerName: feedbackController,
                needPadding: true,
                boxHeight: 192,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 120),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 48, width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedEmojiText.isEmpty) {
                      snackBar(context, message: 'Please select an emoji');
                    } else if (feedbackController.text.isEmpty) {
                      snackBar(context, message: 'Please enter your message');
                    } else {
                      customerRepository.getSideBarFBData(token: authData.user_token!, review: selectedEmojiText, feedback: feedbackController.text);
                      snackBar(context, message: 'Feedback sent successfully', type: MessageType.success);
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CustomerHomeScreen()));
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    elevation: 0,
                    side: const BorderSide(width: 1.6, color: primaryColor),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('SEND FEEDBACK', style: TextStyle(fontSize: 16, color: textgrey, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getEmojiImage(int index) {
    switch (index) {
      case 0:
        return "Assets/Images/excellent_emoji.svg";
      case 1:
        return "Assets/Images/good_emoji.svg";
      case 2:
        return "Assets/Images/average_emoji.svg";
      case 3:
        return "Assets/Images/poor_emoji.svg";
      case 4:
        return "Assets/Images/very_poor_emoji.svg";
      default:
        return "";
    }
  }

  String getEmojiText(int index) {
    switch (index) {
      case 0:
        return "Excellent";
      case 1:
        return "Good";
      case 2:
        return "Average";
      case 3:
        return "Poor";
      case 4:
        return "Very Poor";
      default:
        return "";
    }
  }

}

