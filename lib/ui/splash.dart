import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase/onboarding/onboarding_page_view.dart';
import 'package:flutter_firebase/welcome/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  Future<void> _checkAppState(BuildContext context) async {
    //kiem tra xem co kOnboardingCompleted
    final isCompleted = await _isOnBoardingCompleted();
    if (isCompleted) {
      if (!context.mounted) {
        return;
      }

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WelcomeScreen(isFirstTimeInstall: false,)));
    }else
      {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => OnboardingPageView()));
      }
  }

  Future<bool> _isOnBoardingCompleted() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final result = prefs.getBool("kOnBoardingCompletef");
      return result ?? false;
    } catch (e) {
      return false;
    }
  }

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _checkAppState(context);
    return Scaffold(
        backgroundColor: Color(0xFF121212),
        body: SafeArea(child: _buildingPage()));
  }

  Widget _buildingPage() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildIconSplash(),
          _buildTextSplash(),
        ],
      ),
    );
  }

  Widget _buildIconSplash() {
    return Image.asset(
      'assets/images/icon_app.png',
      width: 95,
      height: 80,
      fit: BoxFit.contain,
    );
  }

  Widget _buildTextSplash() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Text(
        "UpTodo",
        style: TextStyle(
            color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
      ),
    );
  }
}
