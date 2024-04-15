//class cha Quan ly quage con di chuyen giua cac pahe con
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/ultils/enums/onboarding_page_positions.dart';
import 'package:flutter_firebase/welcome/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding_child_page.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        // physics: const NeverScrollableScrollPhysics(),//nếu muốn người dùng k vuốt nữa mà bắt buộc ấn nút next
        children: [
          //truyen vao cac widhet con muon hien thi
          OnboardingChildPage(onboardingPagePosition: OnboardingPagePosition.page1, nextOnPressed: () {
            _pageController.jumpToPage(1);
          }, backOnPressed: () {
            print("hi111");
          }, skipOnPressed: () {
            _markOnBoardingCompleted();
            _goToWelcomePage();
            },),
          OnboardingChildPage(onboardingPagePosition: OnboardingPagePosition.page2, nextOnPressed: () {
            _pageController.jumpToPage(2);
          }, backOnPressed: () {
            _pageController.jumpToPage(0);
          }, skipOnPressed: () {
            _markOnBoardingCompleted();
            _goToWelcomePage();
           },),
          OnboardingChildPage(onboardingPagePosition: OnboardingPagePosition.page3, nextOnPressed: () {
            _markOnBoardingCompleted();
            _goToWelcomePage();
          }, backOnPressed: () {
            _pageController.jumpToPage(1);
          }, skipOnPressed: () {
            _markOnBoardingCompleted();
            _goToWelcomePage();
          },),
        ],
      ),
    );
  }

  void _goToWelcomePage(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> WelcomeScreen(isFirstTimeInstall: true,)));
  }

  Future<void> _markOnBoardingCompleted() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("kOnBoardingCompletef", true);
    } catch (e) {
      print(e);
      return;
    }
  }
}
