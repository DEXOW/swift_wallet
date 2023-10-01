import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swift_wallet/models/navbar.dart';
import 'package:swift_wallet/providers/theme_provider.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  State<AppSettings> createState() => AppSettingsState();
}

class AppSettingsState extends State<AppSettings> {
  late AppThemeProvider appThemeProvider;
  late bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    appThemeProvider = Provider.of<AppThemeProvider>(context);
    isDarkMode = appThemeProvider.darkTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            // double screenHeight = MediaQuery.of(context).size.height;
            // double screenWidth = MediaQuery.of(context).size.width;

            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: SizedBox(
                width: double.infinity,
                child: Container(
                  margin: const EdgeInsets.only(top: 25, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(  
                        children: [
                          Container( //Appbar
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Image.asset(
                                  'assets/logo.png',
                                  height: 30,
                                  width: 99,
                                ),
                              ]
                            ),
                          ),
                          const SizedBox(height: 25),
                        ]
                      ),
                      Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height - 207,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(height: 45),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/images/app_settings_large_icon.png',
                                  ),
                                  const SizedBox(height: 15),
                                  const Text(
                                    'App Settings',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 50),
                              Container(
                                height: 50,
                                width: 250,
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Dark Mode',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Switch(
                                      activeTrackColor: const Color(0xFF3FDA7F),
                                      activeColor: Colors.white,
                                      inactiveTrackColor: const Color(0xFF303030),
                                      value: isDarkMode, 
                                      onChanged: (value) {
                                        setState(() {
                                          isDarkMode = value;
                                        });
                                        isDarkMode ? appThemeProvider.switchthemedark() : appThemeProvider.switchthemelight();
                                      }
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ),
                      ),
                    ]
                  ),
                ),
              ),
              bottomNavigationBar: const Navbar(),
            );
          }
        ),
      ), 
    );
  }
}