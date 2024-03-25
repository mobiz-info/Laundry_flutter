
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/src/Color.dart';

class SlidingCarousel extends StatefulWidget {
  @override
  _SlidingCarouselState createState() => _SlidingCarouselState();
}

class _SlidingCarouselState extends State<SlidingCarousel> {
  List<String> carouselImages = [
    'Assets/Images/golden_falcon_logo.png',
    'Assets/Images/golden_falcon_logo.png',
    // 'Assets/Images/Dashboard/banner_1.png',
    // 'Assets/Images/Dashboard/offers/banner_2.jpg',
    // 'Assets/Images/Dashboard/offers/banner_3.webp',
    // 'Assets/Images/Dashboard/offers/banner_4.jpg',
  ];

  int currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (currentIndex < carouselImages.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      _pageController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      //borderRadius: BorderRadius.circular(20),
      borderRadius: BorderRadius.zero,
      child: Column(
        children: [
          Container(
            //margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
            margin: const EdgeInsets.only(bottom: 10),
            height: MediaQuery.of(context).size.height * 0.15,
            child: PageView.builder(
              controller: _pageController,
              itemCount: carouselImages.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return ClipRRect(
                  //borderRadius: BorderRadius.circular(20),
                  borderRadius: BorderRadius.zero,
                  child: Image.asset(
                    carouselImages[index],
                    // fit: BoxFit.cover,
                    fit: BoxFit.fitHeight,
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: carouselImages.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = entry.key;
                    _pageController.animateToPage(
                      currentIndex,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  });
                },
                child: Container(
                  width: 5.0,
                  height: 5.0,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == entry.key ? primaryColor : DividerGrey,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
