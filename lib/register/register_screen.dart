import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase/welcome/welcome_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WelcomeScreen(
                          isFirstTimeInstall: true,
                        )));
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      body: _buildPageBody(),
    );
  }

  Widget _buildPageBody() {
    return SizedBox(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRegisterTitle(),
                  _buildRegisterInputUser(),
                  _buildRegisterInputPass(),
                  _buildRegisterButtonLogin(),
                  _buildRegisterOrSplit(),
                  // _buildRegisterButtonLoginWithIcon(),
                ],
              ),
            ),
            _buildRegisterText(),
          ]),
    );
  }

  Widget _buildRegisterTitle() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      child: Text(
        "Login",
        style: TextStyle(
            fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget _buildRegisterInputUser() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      // margin: EdgeInsets.only(top: 71),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Username",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: "Enter your Username",
                  hintStyle: TextStyle(color: Color(0xFF535353)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(6),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterInputPass() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24).copyWith(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Password",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: "***********",
                  hintStyle: TextStyle(color: Color(0xFF535353)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(6),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterButtonLogin() {
    return Container(
      padding: EdgeInsets.only(top: 60),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF8687E7),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
          )
        ],
      ),
    );
  }

  //container x text x container
  Widget _buildRegisterOrSplit(){
    return Container(
      color: Colors.red,
      child: Row(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
          ),

        ],
      ),
    );
  }

  Widget _buildRegisterButtonLoginWithIcon() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          margin: EdgeInsets.symmetric(vertical: 24),
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color(0xFF8875FF),
                      ),
                      borderRadius: BorderRadius.circular(5))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(AssetImage("assets/images/google.png")),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Login with Google",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              )),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          margin: EdgeInsets.symmetric(vertical: 24),
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color(0xFF8875FF),
                      ),
                      borderRadius: BorderRadius.circular(5))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(AssetImage("assets/images/apple.png")),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Login with Apple",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }

  Widget _buildRegisterText() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Text("Register",
                  style: TextStyle(
                    color: Colors.white,
                  )))
        ],
      ),
    );
  }
}
