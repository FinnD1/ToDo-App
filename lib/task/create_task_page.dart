import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final _nameTaskTextController = TextEditingController();
  final _descTaskTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF363636),
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(25),
          child: _buildBodyPage(),
        ),
      ),
    );
  }

  Widget _buildBodyPage() {
    return Form(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildTaskNameField(),
        _buildTaskDescField(),
        _buildTaskActionField(),
      ],
    ));
  }

  Widget _buildTaskNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Add Task",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Lato",
              fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: TextFormField(
            controller: _nameTaskTextController,
            //cho phep lay text sau khi go ra
            style: TextStyle(color: Colors.white, fontSize: 16),
            decoration: InputDecoration(
                hintText: "Category name",
                hintStyle: TextStyle(color: Color(0xFFAFAFAF), fontSize: 16),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        BorderSide(width: 1, color: Color(0xFF979797)))),
          ),
        ),
      ],
    );
  }

  Widget _buildTaskDescField() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Add Description",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "Lato",
                fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: TextFormField(
              controller: _descTaskTextController,
              //cho phep lay text sau khi go ra
              style: TextStyle(color: Colors.white, fontSize: 16),
              decoration: InputDecoration(
                  hintText: "Category name",
                  hintStyle: TextStyle(color: Color(0xFFAFAFAF), fontSize: 16),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF979797)))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskActionField() {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/images/timer.png",
                      width: 24,
                      height: 24,
                      fit: BoxFit.fill,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/images/flag.png",
                      width: 24,
                      height: 24,
                      fit: BoxFit.fill,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/images/tag.png",
                      width: 24,
                      height: 24,
                      fit: BoxFit.fill,
                    )),
              ],
            ),
          ),
          IconButton(
              onPressed: () {}, icon: Image.asset("assets/images/send.png")),
        ],
      ),
    );
  }
}
