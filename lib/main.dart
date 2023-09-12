import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swift_wallet/constants.dart';

import 'package:swift_wallet/screens/get_started/get_started.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: primaryBgColor,
        splashColor: Colors.transparent,
        highlightColor: primaryBgColor,
        hoverColor: Colors.transparent,
      ),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: primaryBgColor),
        child:  const GetStarted(),
      ),
    );
  }
}