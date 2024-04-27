// thu vien realm dung de luu tru du lieu local tren may
import 'package:realm/realm.dart';  // import realm package

part 'category_realm_entities.g.dart'; // declare a part file.

@RealmModel() // define a data model class named `_Car`.
class $CategoryRealmEntities {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late int? iconCodePoint;//de luu icon trong flutter
  late String? backgroundColorHex;//color hex string
  late String? iconColorHex;//color hex string
}