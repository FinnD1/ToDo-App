import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_firebase/ultils/enums/color_extension.dart';
import 'package:flutter_iconpicker/IconPicker/icons.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:realm/realm.dart';

import '../entities/category_realm_entities.dart';

class CreateOrEditCategory extends StatefulWidget {
  const CreateOrEditCategory({super.key});

  @override
  State<CreateOrEditCategory> createState() => _CreateOrEditCategoryState();
}

class _CreateOrEditCategoryState extends State<CreateOrEditCategory> {
  final _nameCategoryTextController = TextEditingController();
  IconData? iconSelected;

  final List<Color> _colorDataSource = [];
  Color colorSelected = Colors.white;
  Color iconColorSelected = Colors.white;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final storage=Configuration.defaultRealmPath;
    print(storage);
    print(storage);
    print(storage);

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
                _buildCategoryItemAndTextColor(),
                _buildCategoryPreview(),
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
              onChanged: (value) {
                setState(() {
                  //dungf để  gõ và hiển thị luôn trên preview chứ k bị delay
                });
              },
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
            onTap: _chooseIcon,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color(0xFFFFFFFF).withOpacity(0.21),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: iconSelected != null
                    ? Icon(
                        iconSelected,
                        color: Colors.white,
                        size: 26,
                      )
                    : Text(
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
          GestureDetector(
            onTap: _onChooseCategoryBackgroundColor,
            child: Container(
              width: 36,
              height: 36,
              margin: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: colorSelected,
              ),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(top: 10),
          //   width: double.infinity,
          //   height: 36,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //       final color = _colorDataSource.elementAt(index);
          //       final isSelected = colorSelected == color;
          //       return GestureDetector(
          //         onTap: () {
          //           print("heliiiii $index");
          //           setState(() {
          //             colorSelected=color;
          //           });
          //         },
          //         child: Container(
          //           width: 36,
          //           height: 36,
          //           margin: EdgeInsets.only(right: 12),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(18),
          //             color: color,
          //           ),
          //           child: isSelected ? Icon(
          //                   Icons.done,
          //                   color: Colors.white,
          //                   size: 25,
          //                 )
          //               : null,
          //         ),
          //       );
          //     },
          //     itemCount: _colorDataSource.length,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildCategoryItemAndTextColor() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      margin: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle("Category Text and Icon Color"),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: GestureDetector(
              onTap: _onChooseCategoryTextAndIconColor,
              child: Container(
                width: 36,
                height: 36,
                margin: EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: iconColorSelected,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton() {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: 24).copyWith(top: 20, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
              onPressed: () {},
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
            child: Text(
              "CREATE Category",
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

  Widget _buildCategoryPreview() {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: 24).copyWith(top: 20, bottom: 24),
      child: Column(
        children: [
          _buildTitle("Preview"),
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorSelected,
            ),
            child: Icon(
              iconSelected,
              color: iconColorSelected,
              size: 30,
            ),
          ),
          Text(
            _nameCategoryTextController.text,
            style: TextStyle(color: iconColorSelected, fontSize: 14),
          )
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

  void _createCategory() {
    final categoryName = _nameCategoryTextController.text;
    if (categoryName.isEmpty || colorSelected == null) {
      return;
    }
    //mo realm de luu du lieu
    var config = Configuration.local([CategoryRealmEntities.schema]);
    var realm = Realm(config);

    final backgroundColorHex = colorSelected.toHex();
    var category = CategoryRealmEntities(
        ObjectId(),
        categoryName,
        iconCodePoint: iconSelected?.codePoint,
        backgroundColorHex: backgroundColorHex,
        iconColorHex: iconColorSelected.toHex());
    realm.write(() {
      realm.add(category);
    });
    //save cac thong tin vao local data
    print(categoryName);
    print(realm);
    print("Bundled realm location: " + realm.config.path);
    //clear du lieu nhap vao va thong bao len cho nguoi dung
    _nameCategoryTextController.text="";
    iconSelected=null;
    colorSelected = Colors.white;
    iconColorSelected = Colors.white;
    setState(() {
      _buildCategoryPreview();
    });
    //show alert len cho nguoi dung
    _showAlert("Done","create category successfully");
    // #10 con doan cuoi 5p chua xem het
  }

  void _chooseIcon() async {
    IconData? iconData = await showIconPicker(context, iconPackModes: [IconPack.roundedMaterial,]);
    setState(() {
      iconSelected = Icons.access_time;
      iconData=Icons.access_time_rounded;
    });
    //chua xong xem lai #10
  }

  void _onChooseCategoryBackgroundColor() async {
    showDialog(
        context: context,
        builder: (context) {
          //ccach 1
          // return AlertDialog(
          //   content: SingleChildScrollView(
          //     child: ColorPicker(
          //       pickerColor: colorSelected,
          //       onColorChanged: (Color newColor){
          //         setState(() {
          //           colorSelected=newColor;
          //         });
          //       },
          //     ),
          //   ),
          // );
          return AlertDialog(
            content: SingleChildScrollView(
              child: MaterialPicker(
                pickerColor: colorSelected,
                onColorChanged: (Color newColor) {
                  setState(() {
                    colorSelected = newColor;
                  });
                },
              ),
            ),
          );
        });
  }

  void _onChooseCategoryTextAndIconColor() async {
    showDialog(
        context: context,
        builder: (context) {
          // ccach 1
          return AlertDialog(
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: iconColorSelected,
                onColorChanged: (Color newColor) {
                  setState(() {
                    iconColorSelected = newColor;
                  });
                },
              ),
            ),
          );
        });
  }

  void _showAlert(String title,String message){
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        alignment: Alignment.center,
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("OK"))
        ],
      );
    },);
  }
}
