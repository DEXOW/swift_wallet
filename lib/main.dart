import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:swift_wallet/constants.dart';
import 'package:swift_wallet/providers/global_provider.dart';

import 'package:swift_wallet/providers/user_provider.dart';
import 'package:swift_wallet/screens/get_started/get_started.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserDataProvider()),
        ChangeNotifierProvider.value(value: GlobalProvider()),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swift Wallet',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: primaryBgColor),
        child:  const GetStarted(),
      ),
    );
  }
}