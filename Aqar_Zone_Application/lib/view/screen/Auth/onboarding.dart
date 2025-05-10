import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/static/app_colors.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      "image": "images/AqarZoneBlue1.png",
      "title": "Welcome_to_Aqar_Zone".tr(),
      "desc": "Discover_properties_easily_and_conveniently_in_your_area".tr(),
    },
    {
      "image": "images/AqarZoneBlue1.png",
      "title": "Easy search".tr(),
      "desc": "Search_using_smart_filters_according_to_your_desire".tr(),
    },
    {
      "image": "images/AqarZoneBlue1.png",
      "title": "Direct_contact".tr(),
      "desc": "Contact_the_owner_directly_without_an_intermediary".tr(),
    },
  ];

  void _goNext() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  void _skipToLast() {
    _pageController.jumpToPage(_pages.length - 1);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  Widget _buildPage(Map<String, String> data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(data["image"]!, height: 250),
        const SizedBox(height: 40),
        Text(
          data["title"]!.tr(),
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          data["desc"]!.tr(),
          style: const TextStyle(fontSize: 16, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_pages.length, (index) {
        bool isActive = index == _currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 24 : 10,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? AppColors.blue : AppColors.gold,
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (_, index) => Padding(
              padding: const EdgeInsets.all(24.0),
              child: _buildPage(_pages[index]),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: _buildDots(),
          ),
          Positioned(
            bottom: 40,
            left: 24,
            child: TextButton(
              onPressed: _skipToLast,
              child: Text(
                "skip".tr(),
                style: TextStyle(fontSize: 16, color: AppColors.gold),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            right: 24,
            child: ElevatedButton(
              onPressed: _goNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                _currentPage == _pages.length - 1
                    ? "Start Now".tr()
                    : "Next".tr(),
                style: const TextStyle(fontSize: 16, color: AppColors.gold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
