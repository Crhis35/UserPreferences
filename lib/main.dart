import 'package:UserPreferences/src/pages/home_page.dart';
import 'package:UserPreferences/src/pages/settings_page.dart';
import 'package:UserPreferences/src/share_prefs/user_preferencese.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = new UserPreferences();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferences',
      debugShowCheckedModeBanner: false,
      initialRoute: prefs.lastPage,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingsPage.routeName: (BuildContext context) => SettingsPage(),
      },
    );
  }
}
