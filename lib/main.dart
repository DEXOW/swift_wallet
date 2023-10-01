import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:swift_wallet/constants.dart';
import 'package:swift_wallet/providers/global_provider.dart';
import 'package:swift_wallet/providers/theme_provider.dart';

import 'package:swift_wallet/providers/user_provider.dart';
import 'package:swift_wallet/screens/get_started/get_started.dart';
import 'package:swift_wallet/screens/login/login.dart';
import 'package:swift_wallet/screens/register/register.dart';
import 'package:swift_wallet/screens/root.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => AppThemeProvider(),
    child: Consumer<AppThemeProvider>(builder: (context, state, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Swift Wallet',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: state.darkTheme ? ThemeMode.dark : ThemeMode.light,
        home: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: state.darkTheme ? Brightness.light : Brightness.dark,
            systemNavigationBarColor: state.darkTheme ? const Color(0xFF23272A) : const Color(0xFFF5F5F5),
            systemNavigationBarIconBrightness: state.darkTheme ? Brightness.light : Brightness.dark,
          ),
          child:  const GetStarted(),
        ),
        initialRoute: '/get-started',
        routes: {
          '/get-started': (context) => const GetStarted(),
          '/register':(context) => const Register(),
          '/login':(context) => const Login(),
          '/root':(context) => const Root(),
        },
      );
    }),
  );
}