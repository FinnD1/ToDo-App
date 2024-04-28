import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Color(0xFF121212),
        leading: IconButton(onPressed: () {
          print("Menu 123");
        }, icon: Icon(Icons.menu_outlined,color: Colors.white,)),
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text("Index",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              print("avatar thanh cong");
            },
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/avatar.png"),
            ),
          ),
        ],
      ),
      body: _buildHomeBody(),
    );
  }

  Widget _buildHomeBody(){
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/Checklist-rafiki 1.png",fit: BoxFit.fill,width: 227,height: 227,),
          const Text("What do you want to do today?",style: TextStyle(
            fontSize: 20,color: Colors.white,fontFamily: "Lato"
          ),),
          const Text("Tap + to add your task",style: TextStyle(
            fontSize: 16,color: Colors.white,fontFamily: "Lato"
          ),),
        ],
      ),
    );
  }
}
