import 'package:UserPreferences/src/share_prefs/user_preferencese.dart';
import 'package:UserPreferences/src/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences'),
        backgroundColor: (prefs.secondColor) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Second Color: ${prefs.secondColor}'),
          Divider(),
          Text('Gender ${prefs.gender}'),
          Divider(),
          Text('Name ${prefs.name}'),
          Divider(),
        ],
      ),
    );
  }
}
