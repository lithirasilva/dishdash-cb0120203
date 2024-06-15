import 'package:flutter/material.dart';
import 'package:modernlogintute/Themes/themeswitch_provider.dart';
import 'package:provider/provider.dart';
import 'pages/login.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeSwitch(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeSwitch>(builder: (context, themeSwitch, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(
          onTap: () {},
        ),
        theme: Provider.of<ThemeSwitch>(context).themeData,
      );
    });
  }
}
