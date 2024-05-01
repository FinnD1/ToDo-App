import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase/welcome/welcome_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey =GlobalKey<FormState>();
  var _validateMode= AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,//answer When the keyboard appears, the Flutter widgets resize. How to prevent this? :>
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => WelcomeScreen(
            //               isFirstTimeInstall: true,
            //             )));
            Navigator.pop(context);
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
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Form(
              key: _formKey,
              autovalidateMode: _validateMode,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRegisterTitle(),
                  _buildRegisterInputUser(),
                  _buildRegisterInputPass(),
                  _buildRegisterButtonLogin(),
                  _buildRegisterOrSplit(),
                  _buildRegisterButtonLoginWithIcon(),
                ],
              ),
            ),
          ),
          _buildRegisterText(),
        ]);
  }

  Widget _buildRegisterTitle() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 53),
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
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: "Enter your Username",
                  hintStyle: TextStyle(color: Color(0xFF535353)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(6),
                  )),
              validator: (String? value){
                if(value==null || value.isEmpty)
                  {
                    return "Email is required";//yeu cau nhap email khong the rong
                  }
                final bool emailValid =
                RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value);
                if(emailValid){
                  return null;
                }
                else{
                  return "Email khong hop le";
                }
                return null;
            },
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
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: "***********",
                  hintStyle: TextStyle(color: Color(0xFF535353)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(6),
                  )),
              validator: (String? value){
                if(value ==null || value.isEmpty)
                  {
                    return "Password is required";
                  }
                if(value.length<6)
                  {
                    return "Password phai nhap 6 ki tu tro len";
                  }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterButtonLogin() {
    return Container(
      padding: EdgeInsets.only(top: 69),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
                onPressed: _onHandedLoginSubmit,
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
      padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 31),
      height: 48,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
          const Text("Or",style: TextStyle(color: Colors.white,fontSize: 16),),
          Expanded(
            child: Container(
              height: 1,
              width: double.infinity,
              color: Colors.white,
            ),
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
          margin: EdgeInsets.only(top: 29,bottom: 20),
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
                  Image.asset("assets/images/google.png",height: 24,width: 24,fit: BoxFit.fill,),
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
          margin: EdgeInsets.symmetric(vertical: 10),
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
                  Image.asset("assets/images/apple.png",height: 24,width: 24,fit: BoxFit.fill,),
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

  void _onHandedLoginSubmit(){
    if(_validateMode== AutovalidateMode.disabled)//check realtime validate
      {
        setState(() {
          _validateMode=AutovalidateMode.always;
        });
      }
    final isValid=_formKey.currentState!.validate();
    if (isValid){
      //Call API lofin , call Firebase login
    }else{
      // khong lam j ca
    }
  }
}
