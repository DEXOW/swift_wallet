import 'package:flutter/material.dart';
import 'package:swift_wallet/constants.dart';

import 'package:swift_wallet/screens/get_started/tips_widget.dart';
import 'package:swift_wallet/screens/register/register.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => GetStartedState();
}

class GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage('assets/logo.png')),
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
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Register()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryButtonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Get Started',
                                style: TextStyle(
                                  color: tertiaryTextColor,
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