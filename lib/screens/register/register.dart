import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swift_wallet/constants.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => RegisterState();
}

class RegisterState extends State<Register> {
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
                              children: 
                                [
                                  Image.asset(
                                    'assets/logo.png',
                                    height: 40,
                                    width: 136,
                                  ),
                                ]
                            ),
                          ),
                          view2(screenWidth, screenHeight)
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 45),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 45,
                                  height: 45,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: primaryButtonColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: const Icon(CupertinoIcons.back, color: Colors.black, size: 20, weight: 60,),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                SizedBox(
                                  width: 210,
                                  height: 45,
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black, 
                                      backgroundColor: primaryButtonColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      'Next',
                                      style: GoogleFonts.didactGothic(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an account? ',
                                    style: GoogleFonts.didactGothic(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Log In',
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

  Widget view1(double screenWidth, double screenHeight){
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
                'Become a member.',
                style: GoogleFonts.didactGothic(
                  fontSize: 26,
                  fontWeight: FontWeight.w100,
                ),
              ),
              const SizedBox(height: 55),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  inputField(
                    width: (screenWidth-45) * 0.4,
                    height: 50.toDouble(),
                    label: 'First Name', 
                    child: inputBox('John', false)
                  ),
                  inputField(
                    width: (screenWidth-45) * 0.4,
                    height: 50.toDouble(),
                    label: 'Last Name', 
                    child: inputBox('Doe', false)
                  ),
                ],
              ),
              const SizedBox(height: 20),
              inputField(
                width: double.infinity,
                height: 50.toDouble(),
                label: 'Other Names', 
                child: inputBox('Mark', false)
              ),
            ],
          ),
        ),
        const SizedBox(height: 55),
      ],
    );
  }

  Widget view2(double screenWidth, double screenHeight) {
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
                'Are you eligible ?',
                style: GoogleFonts.didactGothic(
                  fontSize: 26,
                  fontWeight: FontWeight.w100,
                ),
              ),
              const SizedBox(height: 55),
              inputField(
                width: screenWidth-(45*2),
                height: 50.toDouble(),
                label: 'Date of Birth', 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 70,
                      height: 60,
                      margin: const EdgeInsets.only(right: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9).withOpacity(0.10),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.25),
                        ),
                      ),
                      child: Text(
                        'DD',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.25),
                        ),
                      ),
                    ),
                    Container(
                      width: 85,
                      height: 60,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9).withOpacity(0.10),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.25),
                        ),
                      ),
                      child: Text(
                        'MMM',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.25),
                        ),
                      ),
                    ),
                    Container(
                      width: 90,
                      height: 60,
                      margin: const EdgeInsets.only(left: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9).withOpacity(0.10),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.25),
                        ),
                      ),
                      child: Text(
                        'YYYY',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.25),
                        ),
                      ),
                    ),
                  ],
                )
              ),
              const SizedBox(height: 20),
              inputField(
                width: 285.toDouble(),
                height: 50.toDouble(),
                label: 'Country', 
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9).withOpacity(0.10),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.25),
                    ),
                  ),
                  child: CountryCodePicker(
                    onChanged: (value) {
                      print(value);
                    },
                    initialSelection: 'LK',
                    favorite: const ['+94'],
                    showCountryOnly: true,
                    showOnlyCountryWhenClosed: true,
                    showFlagMain: false,
                    alignLeft: true,
                    backgroundColor: primaryBgColor,
                    dialogBackgroundColor: primaryBgColor,
                    barrierColor: primaryBgColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 55),
      ],
    );
  }

  Widget inputBox(String hint, bool obscure){
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFD9D9D9).withOpacity(0.10),
        hintText: hint,
        hintStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.25),
          ),
        ),
      ),
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