import 'package:flutter/material.dart';

import 'package:UserPreferences/src/share_prefs/user_preferencese.dart';
import 'package:UserPreferences/src/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final prefs = new UserPreferences();

  bool _secondColor;
  int _gender;
  String _name;

  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _gender = prefs.gender;
    prefs.lastPage = SettingsPage.routeName;
    _secondColor = prefs.secondColor;
    _textController = new TextEditingController(text: prefs.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setttings'),
        backgroundColor: (prefs.secondColor) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _secondColor,
              title: Text('Second Color'),
              onChanged: (value) {
                setState(() {
                  _secondColor = value;
                  prefs.secondColor = value;
                });
              },
            ),
            RadioListTile(
              value: 1,
              groupValue: _gender,
              title: Text('Masculino'),
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
              value: 2,
              groupValue: _gender,
              title: Text('Femenino'),
              onChanged: _setSelectedRadio,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration:
                    InputDecoration(labelText: 'Name', helperText: 'Name'),
                onChanged: (value) {
                  prefs.name = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _setSelectedRadio(int value) {
    prefs.gender = value;
    _gender = value;
    setState(() {});
  }
}
