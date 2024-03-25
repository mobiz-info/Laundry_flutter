import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golden_falcon/Customers/Customer_Home.dart';
import '../Repositories/AuthRepo/auth_repository.dart';
import '../Repositories/CustomerRepo/customer_repository.dart';
import '../Utils/ScreenAppbar.dart';
import '../src/Color.dart';
import 'Edit.dart';

class FeedbackScreen extends StatefulWidget {
  final String selectedEmojiText;
  final String orderId;

  const FeedbackScreen({Key? key, required this.selectedEmojiText, required this.orderId}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {

  TextEditingController feedbackController = TextEditingController();
  late String fetchChangeEmojiText;
  final CustomerRepository customerRepository = CustomerRepository();

  @override
  void initState() {
    super.initState();
    fetchChangeEmojiText = widget.selectedEmojiText;
  }

  void fetchedChangeEmoji(String emojiText) {
    setState(() {
      fetchChangeEmojiText = emojiText;
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
                      onTap: () => fetchedChangeEmoji(fetchEmojiText(i)),
                      child: Column(
                        children: [
                          widget.selectedEmojiText == fetchEmojiText(i)?
                          CircleAvatar(
                            radius: 29, backgroundColor: greenColor,
                            child: CircleAvatar(radius: 28, backgroundColor: BgGrey,
                                child: SvgPicture.asset(fetchEmojiImage(i))),
                          )
                              : SvgPicture.asset(fetchEmojiImage(i)),
                          const SizedBox(height: 4),
                          Text(fetchEmojiText(i),
                            style: TextStyle(fontSize: 8, fontWeight: FontWeight.w500, color: widget.selectedEmojiText == fetchEmojiText(i) ? greenColor : lightGreyText),
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
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    customerRepository.getOrderStatusFBData(token: authData.user_token!, orderId: widget.orderId, review: widget.selectedEmojiText, feedback: feedbackController.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerHomeScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    elevation: 0,
                    side: const BorderSide(width: 1.0, color: primaryColor),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('SEND FEEDBACK', style: TextStyle(fontSize: 12, color: textgrey, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String fetchEmojiImage(int index) {
    switch (index) {
      case 0:
        return "Assets/Images/emoji1.svg";
      case 1:
        return "Assets/Images/emoji2.svg";
      case 2:
        return "Assets/Images/emoji3.svg";
      case 3:
        return "Assets/Images/emoji4.svg";
      case 4:
        return "Assets/Images/emoji5.svg";
      default:
        return "";
    }
  }

  String fetchEmojiText(int index) {
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

