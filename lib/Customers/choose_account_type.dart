import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_falcon/Customers/corporate.dart';
import 'package:golden_falcon/Customers/personal.dart';
import '../Utils/ScreenAppbar.dart';
import '../src/Color.dart';

class ChooseAccountType extends StatefulWidget {
  const ChooseAccountType({Key? key}) : super(key: key);

  @override
  State<ChooseAccountType> createState() => _ChooseAccountTypeState();
}

class _ChooseAccountTypeState extends State<ChooseAccountType> {
  int selectedIndex = -1;
  List<String> imagesList = ["Assets/Images/direct_icon.svg", "Assets/Images/contactless_icon.svg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BgGrey,
      appBar: ScreenAppbar(
          text: "Choose Account Type",
          svgNeed: true,
          imagepath: "Assets/Images/choose_type_img.svg"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 24, // Horizontal spacing between items
                  mainAxisSpacing: 30, // Vertical spacing between items
                ),
                itemCount: 2, // Number of items in the grid
                shrinkWrap: true, // Allow the GridView to fit its content
                physics: const NeverScrollableScrollPhysics(), // Disable GridView scrolling
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Update the selected index when an item is tapped
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: AccountTypeCard(
                      imagePath: imagesList[index],
                      title: index == 0 ? 'Home' : 'Corporate',
                      isSelected: selectedIndex == index, // Check if the item is selected
                    ),
                  );
                },
              ),
              const SizedBox(height: 38),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedIndex == 0) {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Personal()));
                    } else if (selectedIndex == 1) {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Corporate()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text('Continue'.toUpperCase(),
                    style: const TextStyle(fontSize: 16, color: White, fontWeight: FontWeight.w600),
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

class AccountTypeCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final bool isSelected;

  AccountTypeCard({
    required this.imagePath,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 138, width: 138,
      decoration: BoxDecoration(
        color: isSelected ? primaryColor : Colors.white, // Change background color when selected
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
              child: SvgPicture.asset(imagePath),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF99A4AA),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}