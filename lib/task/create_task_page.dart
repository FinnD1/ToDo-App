import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase/category/category_list_page.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final _nameTaskTextController = TextEditingController();
  final _descTaskTextController = TextEditingController();
  // final CalendarDatePicker2 _
  List<DateTime?> _singleDatePickerValueWithDefaultValue = [
    DateTime.now().add(const Duration(days: 1)),
  ];

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
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: CalendarDatePicker2(
                                    config: CalendarDatePicker2Config(
                                      firstDayOfWeek: 1,
                                      calendarType: CalendarDatePicker2Type.range,
                                      selectedDayTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                                      selectedDayHighlightColor: Colors.purple[800],
                                      centerAlignModePicker: true,
                                      customModePickerIcon: SizedBox(height: 10,),
                                    ),
                                    value: _singleDatePickerValueWithDefaultValue,
                                    onValueChanged: (dates) => setState(() {
                                      _singleDatePickerValueWithDefaultValue = dates;
                                      print(dates);
                                      print(_singleDatePickerValueWithDefaultValue);
                                    })
                                ));
                          });
                    },
                    icon: Image.asset(
                      "assets/images/timer.png",
                      width: 24,
                      height: 24,
                      fit: BoxFit.fill,
                    )),
                IconButton(
                    onPressed: _showDialogChooseCategory,
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

  void _showDialogChooseCategory(){
    showGeneralDialog(context: context, pageBuilder: (_,__,___){
      return CategoryListPage();
    });
  }
}
