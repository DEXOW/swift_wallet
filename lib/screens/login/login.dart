import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:swift_wallet/firebase/fire_auth.dart';
import 'package:swift_wallet/providers/user_provider.dart';
import 'package:swift_wallet/validate.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  late UserDataProvider userDataProvider;
  int currentScene = 1;
  final controllers = {
    'email': TextEditingController(),
    'password': TextEditingController(),
  };
  final _formKey1 = GlobalKey<FormState>();

  void login() {
    Navigator.pushReplacementNamed(context, '/root');
  }

  @override
  Widget build(BuildContext context){
    userDataProvider = Provider.of<UserDataProvider>(context);

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
                                SvgPicture.asset(
                                  'assets/logo.svg',
                                  height: 40,
                                  colorFilter: ColorFilter.mode(Theme.of(context).iconTheme.color!, BlendMode.srcIn),
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
                                userDataProvider.clearData();
                                Navigator.pushReplacementNamed(context, '/register');
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
                                      color: Theme.of(context).textTheme.bodySmall!.color,
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
    return Form(
      key: _formKey1,
      child: Column(
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
                    controller: controllers['email'],
                    validator: (value) => Validate.validateEmail(email: value),
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
                    controller: controllers['password'],
                    validator: (value) => Validate.validateLoginPassword(password: value),
                    obscure: true
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey1.currentState!.validate()) {
                        User? user = await FireAuth.signInUsingEmailPassword(email: (controllers['email'] as TextEditingController).text.trim(), password: (controllers['password'] as TextEditingController).text, context: context);
                        if (user != null){
                          if (context.mounted){
                            print(user.email);
                            login();
                          }
                        }
                      }
                    },
                    style: Theme.of(context).elevatedButtonTheme.style,
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
                          color: Theme.of(context).textTheme.bodySmall!.color,
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
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          currentScene = 2;
                        });
                      },
                      style: Theme.of(context).elevatedButtonTheme.style,
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
                      onPressed: () {
                        login();
                      }, 
                      icon: Icon(
                        Icons.fingerprint,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                        size: 40,
                      )
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
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
                      textStyle: TextStyle(
                        fontSize: 20, 
                        color: Theme.of(context).textTheme.bodyMedium!.color, 
                        fontWeight: FontWeight.w600
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).inputDecorationTheme.fillColor,
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
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentScene = 1;
                      });
                    },
                    style: Theme.of(context).elevatedButtonTheme.style,
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
                    icon: Icon(
                      Icons.fingerprint,
                      color: Theme.of(context).textTheme.bodySmall!.color,
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
        color: Theme.of(context).inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: Theme.of(context).inputDecorationTheme.border!.borderSide.color,
        ),
      ),
    );
  }

  Widget inputBox({hint, controller, required Function(String? value) validator, obscure, textAlign = TextAlign.start}){
    return TextFormField(
      controller: controller,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        hintText: hint,
        hintStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        border: Theme.of(context).inputDecorationTheme.border,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
        Container(
          constraints: BoxConstraints(
            maxWidth: width,
            minHeight: height,
          ),
          child: child
        ),
      ],
    );
  }
}