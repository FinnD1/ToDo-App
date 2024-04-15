//dong vai tro la giao man hinh
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/ultils/enums/onboarding_page_positions.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingChildPage extends StatelessWidget {
  final OnboardingPagePosition onboardingPagePosition;
  final VoidCallback nextOnPressed;
  final VoidCallback backOnPressed;
  final VoidCallback skipOnPressed;

  const OnboardingChildPage({super.key, required this.onboardingPagePosition, required this.nextOnPressed, required this.backOnPressed, required this.skipOnPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildSkipButton(),
              _buildOnboardingImage(),
              _buildOnboardingPageControl(),
              _buildOnboardingTitleAndContent(),
              _buildOnboardingNextAndPrevButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkipButton() {
    return Container(
      margin: EdgeInsets.only(top: 14),
      alignment: AlignmentDirectional.centerStart,
      child: TextButton(
          onPressed: () {
            skipOnPressed();
          },
          child: Text(
            "SKIP",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.44),
                fontFamily: GoogleFonts.lato().fontFamily),
          )),
    );
  }

  Widget _buildOnboardingImage() {
    return Image.asset(
      onboardingPagePosition.onboardingPageImage(),
      height: 296,
      width: 201,
      fit: BoxFit.contain,
    );
  }

  Widget _buildOnboardingPageControl() {
    /*
    O page 1 thi sang o 1 va xam o 2 va 3

     */

    return Container(
      margin: EdgeInsets.symmetric(vertical: 50),
      // alignment: AlignmentDirectional.centerStart,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //vi tri 1
          Container(
            width: 26,
            height: 4,
            decoration: BoxDecoration(
                color: onboardingPagePosition == OnboardingPagePosition.page1
                    ? Colors.white
                    : Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(56)),
          ),
          //vi tri 2
          Container(
            width: 26,
            height: 4,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                //Toan tu 3 ngoi tra ve tru orr false
                //<đkien trả về T F>?<Mệnh đề A>:<Mệnh đề B>
              //Neu TRUE thi menh de a sẽ được thực thi
              //Nếu FALSE thì mệnh đề B sẽ được thực thi
                color: onboardingPagePosition == OnboardingPagePosition.page2
                    ? Colors.white
                    : Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(56)),
          ),
          //vi tri 3
          Container(
            width: 26,
            height: 4,
            decoration: BoxDecoration(
                color: onboardingPagePosition == OnboardingPagePosition.page3
                    ? Colors.white
                    : Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(56)),
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingTitleAndContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 38),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          onboardingPagePosition.onboardingPageTitle(),
          style: TextStyle(
              color: Colors.white.withOpacity(0.87),
              fontFamily: "Lato",
              fontSize: 36,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 42,
        ),
        Text(
          onboardingPagePosition.onboardingPageContent(),
          style: TextStyle(
            color: Colors.white.withOpacity(0.87),
            fontFamily: "Lato",
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }

  Widget _buildOnboardingNextAndPrevButton() {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: 24).copyWith(top: 207, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
              onPressed: () {
                backOnPressed.call();
              },
              child: Text("Back",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.44),
                      fontFamily: "Lato"))),
          ElevatedButton(
            onPressed: () {
              nextOnPressed.call();
              //cach 2 nextOnPress
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8875FF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
            child: Text(
              onboardingPagePosition == OnboardingPagePosition.page3
                  ? "GET STARTED"
                  : "NEXT",
              style: TextStyle(
                  color: Colors.white.withOpacity(0.87),
                  fontFamily: "Lato",
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
