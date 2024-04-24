import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/category/create_or_edit_category.dart';
import 'package:flutter_firebase/main/main_page.dart';
import 'package:flutter_firebase/onboarding/onboarding_page_view.dart';
import 'package:flutter_firebase/register/register_screen.dart';
import 'package:flutter_firebase/ui/splash.dart';
import 'package:flutter_firebase/welcome/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
//them chuyen ngon ngu giong nhu odoo
  runApp(EasyLocalization(supportedLocales: [
    Locale("vi"),
    Locale("en"),
  ], path: 'assets/translations', child: const MyApp()));
}

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
