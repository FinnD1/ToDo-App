import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase/entities/category_realm_entities.dart';
import 'package:realm/realm.dart';

class CategoryListPage extends StatelessWidget {
  const CategoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent, body: _buildBodyPage());
  }

  Widget _buildBodyPage() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Color(0xFF363636),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildListTitle(),
            Divider(
              color: Colors.red,
            ),
            _buildListGridView(),
            _buildListButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildListTitle(){
    return Text(
      "Choose Category",
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
  Widget _buildListGridView(){
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 0.7),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFCCFF80),
              ),
              child: Icon(
                Icons.add,
                color: Color(0xFF21A300),
                size: 30,
              ),
            ),
            Text(
              "Grocery",
              style: TextStyle(color: Colors.white, fontSize: 14),
            )
          ],
        );
      },
      itemCount: 10,
    );
  }
  Widget _buildListButton(){
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // _createCategory();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF8875FF),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5))),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text(
            "Add Category",
            style: TextStyle(
                color: Colors.white.withOpacity(0.87),
                fontFamily: "Lato",
                fontSize: 16),
          ),
        ),
      ),
    );
  }

  Future<void>  _getCreateCategoryList() async{
    final config=Configuration.local([CategoryRealmEntities.schema]);
    final realm=Realm(config);
    final category=realm.all<CategoryRealmEntities>();
    //#12  chua xong
  }
}
