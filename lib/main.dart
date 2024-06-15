import 'package:flutter/material.dart';
import 'package:modernlogintute/Themes/themeswitch_provider.dart';
import 'package:provider/provider.dart';
import 'pages/login.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeSwitch(), // Create instance of ThemeSwitch
      child: const MyApp(), // Wrap MyApp with ChangeNotifierProvider
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeSwitch>(
      builder: (context, themeSwitch, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginPage(
            onTap: () {},
          ),
          theme: Provider.of<ThemeSwitch>(context)
              .themeData, // Set theme from Provider
        );
      },
    );
  }
}
