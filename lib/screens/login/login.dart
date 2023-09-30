import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:swift_wallet/constants.dart';

import 'package:swift_wallet/screens/register/register.dart';
import 'package:swift_wallet/screens/root.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  int currentScene = 1;

  void login() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Root())); 
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            double screenHeight = constraints.maxHeight;
            double screenWidth = constraints.maxWidth;

            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: SizedBox(
                width: double.infinity,
                child: Container(
                  margin: const EdgeInsets.only(top: 25, bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/logo.png',
                                  height: 40,
                                  width: 136,
                                ),
                              ]
                            ),
                          ),
                          LayoutBuilder(
                            builder: (BuildContext context, BoxConstraints constraints){
                              if (currentScene == 1){
                                return view1(screenWidth, screenHeight);
                              } else if (currentScene == 2){
                                return view2(screenWidth, screenHeight);
                              } else {
                                return Container();
                              }
                            } 
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 45),
                        child: Column(
                          children: [
                            const SizedBox(height: 5),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Register()));
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account ? ",
                                    style: GoogleFonts.didactGothic(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Sign Up',
                                    style: GoogleFonts.didactGothic(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              )
                            )
                          ]
                        ),
                      )
                    ]
                  ),
                ),
              ),
            );
          }
        )
      )
    );
  }

  Widget view1(screenWidth, screenHeight) {
    return Column(
      children: [
        const SizedBox(height: 75),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back !',
                style: GoogleFonts.didactGothic(
                  fontSize: 26,
                  fontWeight: FontWeight.w100,
                ),
              ),
              const SizedBox(height: 55),
              inputField(
                width: double.infinity,
                height: 50.toDouble(),
                label: 'Email Address', 
                child: inputBox(
                  hint: 'johndoe@gmail.com',
                  obscure: false
                ),
              ),
              const SizedBox(height: 20),
              inputField(
                width: double.infinity,
                height: 50.toDouble(),
                label: 'Password', 
                child: inputBox(
                  hint: '',
                  obscure: true
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: TextButton(
                  onPressed: () {
                    login();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black, 
                    backgroundColor: primaryButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              TextButton(
                onPressed: () {
                  //
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Forgot Password ? ',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Reset it',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Or',
                    style: GoogleFonts.didactGothic(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        currentScene = 2;
                      });
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, 
                      backgroundColor: const Color(0xFF000000).withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Sign in using PIN',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {}, 
                    icon: const Icon(
                      Icons.fingerprint,
                      color: Colors.white,
                      size: 40,
                    )
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget view2(screenWidth, screenHeight) {
    return Column(
      children: [
        const SizedBox(height: 75),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter PIN',
                style: GoogleFonts.didactGothic(
                  fontSize: 26,
                  fontWeight: FontWeight.w100,
                ),
              ),
              const SizedBox(height: 55),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Pinput(
                    length: 4,
                    onCompleted: (value) {
                      login();
                    },
                    closeKeyboardWhenCompleted: false,
                    defaultPinTheme: PinTheme(
                      width: 45,
                      height: 60,
                      margin: const EdgeInsets.only(top: 60),
                      textStyle: const TextStyle(
                        fontSize: 20, 
                        color: Color(0xFFEAEFF3), 
                        fontWeight: FontWeight.w600
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0x5E606060),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
              
              
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        currentScene = 1;
                      });
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, 
                      backgroundColor: const Color(0xFF000000).withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Sign in using Password',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {}, 
                    icon: const Icon(
                      Icons.fingerprint,
                      color: Colors.white,
                      size: 40,
                    )
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget pinInputBox(){
    return Container(
      width: 43,
      height: 52,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9).withOpacity(0.10),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: const Color(0xFFFFFFFF).withOpacity(0.25),
        ),
      ),
    );
  }

  Widget inputBox({hint, obscure, textAlign = TextAlign.start}){
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFD9D9D9).withOpacity(0.10),
        hintText: hint,
        hintStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        border: Theme.of(context).inputDecorationTheme.border,
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      textAlign: textAlign,
      obscureText: obscure,
    );
  }

  Widget inputField({width, height, label, child}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: width,
          height: height,
          child: child
        ),
      ],
    );
  }
}