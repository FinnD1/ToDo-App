import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/category/create_or_edit_category.dart';
import 'package:flutter_firebase/main/main_page.dart';
import 'package:flutter_firebase/onboarding/onboarding_page_view.dart';
import 'package:flutter_firebase/register/register_screen.dart';
import 'package:flutter_firebase/task/create_task_page.dart';
import 'package:flutter_firebase/ui/splash.dart';
import 'package:flutter_firebase/welcome/welcome_screen.dart';
// import 'package:flutter/services.dart';
// import 'package:realm/realm.dart';
// import 'dart:io';
//
// import 'entities/category_realm_entities.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final realm = await initBundledRealm("assets/bundle.realm");
  await EasyLocalization.ensureInitialized();
//them chuyen ngon ngu giong nhu odoo
  runApp(EasyLocalization(supportedLocales: [
    Locale("vi"),
    Locale("en"),
  ], path: 'assets/translations', child: const MyApp()));
}

// Future<Realm> initBundledRealm(String assetKey) async {
//   final config = Configuration.local([CategoryRealmEntities.schema]);
//   final file = File(config.path);
//   if (!await file.exists()) {
//     final realmBytes = await rootBundle.load(assetKey);
//     await file.writeAsBytes(
//         realmBytes.buffer
//             .asUint8List(realmBytes.offsetInBytes, realmBytes.lengthInBytes),
//         mode: FileMode.write);
//   }
//   return Realm(config);
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      home: const MainPage(),
    );
  }
}
