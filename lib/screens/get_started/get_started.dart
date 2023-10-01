import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:swift_wallet/providers/theme_provider.dart';

import 'package:swift_wallet/screens/get_started/tips_widget.dart';
class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => GetStartedState();
}

class GetStartedState extends State<GetStarted> {
  late SystemUiOverlayStyle _currentStyle;
  late AppThemeProvider themeDataProvider;

  @override
  Widget build(BuildContext context) { 
    themeDataProvider = Provider.of<AppThemeProvider>(context);
    _currentStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: themeDataProvider.darkTheme ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: themeDataProvider.darkTheme ? const Color(0xFF23272A) : const Color(0xFFF5F5F5),
      systemNavigationBarIconBrightness: themeDataProvider.darkTheme ? Brightness.light : Brightness.dark,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          systemOverlayStyle: _currentStyle,
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            double screenHeight = constraints.maxHeight;
            double screenWidth = constraints.maxWidth;
            return Scaffold(
              body: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: screenHeight * 0.7,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/logo.svg',
                            height: 50,
                            colorFilter: ColorFilter.mode(Theme.of(context).iconTheme.color!, BlendMode.srcIn),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const TipsWidget(),
                          const SizedBox(height: 40),
                          SizedBox(
                            width: screenWidth * 0.8,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              style: Theme.of(context).elevatedButtonTheme.style,
                              child: const Text(
                                'Get Started',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}