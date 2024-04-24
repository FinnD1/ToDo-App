import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconpicker/IconPicker/icons.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class CreateOrEditCategory extends StatefulWidget {
  const CreateOrEditCategory({super.key});

  @override
  State<CreateOrEditCategory> createState() => _CreateOrEditCategoryState();
}

class _CreateOrEditCategoryState extends State<CreateOrEditCategory> {
  final _nameCategoryTextController = TextEditingController();

  final List<Color> _colorDataSource = [];
  Color? colorSelected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _colorDataSource.addAll([
      Color(0xFFC9CC41),
      Color(0xFF66CC41),
      Color(0xFF41CCA7),
      Color(0xFF4181CC),
      Color(0xFF41A2CC),
      Color(0xFF41A2CC),
      Color(0xFF41A2CC),
      Color(0xFF41A2CC),
      Color(0xFF41A2CC),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "create_category_title",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ).tr(),
      ),
      body: _buildBodyPageScreen(),
    );
  }

  Widget _buildBodyPageScreen() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            //Khi dung expanded thi nó sẽ chiếm hết không gian và đấy thg còn lại xuống cuối cùng
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCategoryTextField(),
                _buildCategoryChooseIcon(),
                _buildCategoryChooseColor(),
              ],
            ),
          ),
          _buildCategoryButton(),

        ],
      ),
    );
  }

  Widget _buildCategoryTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle("Category name"),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: TextFormField(
              controller: _nameCategoryTextController,
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

  Widget _buildCategoryChooseIcon() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      margin: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle("Category Icon"),
          GestureDetector(
            onTap: () {
              print("hello");
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color(0xFFFFFFFF).withOpacity(0.21),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  "Choose category Icon",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ).tr(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChooseColor() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      margin: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle("Category Color"),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 36,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final color = _colorDataSource.elementAt(index);
                final isSelected = colorSelected == color;
                return GestureDetector(
                  onTap: () {
                    print("heliiiii $index");
                    setState(() {
                      colorSelected=color;
                    });
                  },
                  child: Container(
                    width: 36,
                    height: 36,
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: color,
                    ),
                    child: isSelected ? Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 25,
                          )
                        : null,
                  ),
                );
              },
              itemCount: _colorDataSource.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(){
    return Container(
      margin:
      EdgeInsets.symmetric(horizontal: 24).copyWith(top: 20, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
              onPressed: () {
              },
              child: Text("Cancel",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.44),
                      fontFamily: "Lato"))),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              _createCategory();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8875FF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
            child: Text("CREATE Category",
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

  Widget _buildTitle(String titleLabel) {
    return Text(
      titleLabel,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white.withOpacity(0.87)),
    );
  }

  void _createCategory(){
    final categoryName = _nameCategoryTextController.text;
    //save cac thong tin vao local data
    print(categoryName);

  }

  void _chooseIcon(){
    // IconData iconData= await
    //chua xong xem lai #10
  }
}
