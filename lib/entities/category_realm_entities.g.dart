// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_realm_entities.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CategoryRealmEntities extends $CategoryRealmEntities
    with RealmEntity, RealmObjectBase, RealmObject {
  CategoryRealmEntities(
    ObjectId id,
    String name, {
    int? iconCodePoint,
    String? backgroundColorHex,
    String? iconColorHex,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'iconCodePoint', iconCodePoint);
    RealmObjectBase.set(this, 'backgroundColorHex', backgroundColorHex);
    RealmObjectBase.set(this, 'iconColorHex', iconColorHex);
  }

  CategoryRealmEntities._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  int? get iconCodePoint =>
      RealmObjectBase.get<int>(this, 'iconCodePoint') as int?;
  @override
  set iconCodePoint(int? value) =>
      RealmObjectBase.set(this, 'iconCodePoint', value);

  @override
  String? get backgroundColorHex =>
      RealmObjectBase.get<String>(this, 'backgroundColorHex') as String?;
  @override
  set backgroundColorHex(String? value) =>
      RealmObjectBase.set(this, 'backgroundColorHex', value);

  @override
  String? get iconColorHex =>
      RealmObjectBase.get<String>(this, 'iconColorHex') as String?;
  @override
  set iconColorHex(String? value) =>
      RealmObjectBase.set(this, 'iconColorHex', value);

  @override
  Stream<RealmObjectChanges<CategoryRealmEntities>> get changes =>
      RealmObjectBase.getChanges<CategoryRealmEntities>(this);

  @override
  CategoryRealmEntities freeze() =>
      RealmObjectBase.freezeObject<CategoryRealmEntities>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(CategoryRealmEntities._);
    return const SchemaObject(ObjectType.realmObject, CategoryRealmEntities,
        'CategoryRealmEntities', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('iconCodePoint', RealmPropertyType.int, optional: true),
      SchemaProperty('backgroundColorHex', RealmPropertyType.string,
          optional: true),
      SchemaProperty('iconColorHex', RealmPropertyType.string, optional: true),
    ]);
  }
}
