import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListTile(
              title: Text("English"),
              onTap: () {
                setState(() {

                });
                LocaleNotifier.of(context)!.change('en');
              }
            ),
            ListTile(
              title: Text("Arabic"),
              onTap: () {
                setState(() {

                });
                LocaleNotifier.of(context)!.change('ar');
              }
            ),
          ],
        ),
      ),
    );
  }
}
