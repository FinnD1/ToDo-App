import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final bool isFirstTimeInstall;

  const WelcomeScreen({super.key, required this.isFirstTimeInstall});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: isFirstTimeInstall
            ? IconButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                icon: Icon(Icons.arrow_back_ios_new),
                color: Colors.white,
                iconSize: 30,
              )
            : null,
      ),
      body: Column(
        children: [
          _buildTitleAndContent(),
          Spacer(),// like Expanded
          // _buildButtonChangeLanguage(context),
          _buildButtonLogin(context),
          _buildButtonRegister(),
        ],
      ),
    );
  }

  Widget _buildTitleAndContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 30,
        ),
        Text(
          "welcome_title".tr(),
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Lato",
              fontSize: 32,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          "welcome_desc".tr(),
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Lato",
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }


  Widget _buildButtonChangeLanguage(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton(
        onPressed: () {
          final currentLocale = context.locale.toString();
          if(currentLocale=="en") {
            context.setLocale(Locale("vi"));
          }
          else if(currentLocale=="vi"){
            context.setLocale(Locale("en"));
          }
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF8875FF),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        child: Text(
          "Change Language",
          style: TextStyle(color: Colors.white,fontSize: 19,),
        ),
      ),
    );
  }


  Widget _buildButtonLogin(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF8875FF),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        child: Text(
          "LOGIN",
          style: TextStyle(color: Colors.white,fontSize: 19,fontFamily: "Lato"),
        ),
      ),
    );
  }

  Widget _buildButtonRegister() {
    return Container(
      width: double.infinity,
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 24).copyWith(top: 10),
      child:
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape:
            RoundedRectangleBorder(
              side: BorderSide(color: Color(0xFF8875FF)),
                borderRadius: BorderRadius.circular(5))),
        child: Text(
          "Create Account",
          style: TextStyle(color: Colors.white,fontSize: 19,fontFamily: "Lato"),
        ),
      ),
    );
  }
}
