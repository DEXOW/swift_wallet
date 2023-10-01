import 'dart:io';

import 'package:intl/intl.dart';
import 'package:camera/camera.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:swift_wallet/models/camera.dart';
import 'package:swift_wallet/providers/user_provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => RegisterState();
}

class RegisterState extends State<Register> {
  late UserDataProvider userDataProvider;
  late DateTime selectedDate;
  int minAllowedAge = 18;
  int currentScene = 1;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
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
                              } else if (currentScene == 3){
                                return view3(screenWidth, screenHeight);
                              } else if (currentScene == 4){
                                return view4(screenWidth, screenHeight);
                              } else if (currentScene == 5){
                                return view5(screenWidth, screenHeight);
                              } else if (currentScene == 6){
                                return view6(screenWidth, screenHeight);
                              } else if (currentScene == 7){
                                return view7(screenWidth, screenHeight);
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 45,
                                  height: 45,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (currentScene == 1) {
                                        setState(() {
                                          Navigator.pop(context);
                                        });
                                      } else if (currentScene > 1){
                                        setState(() {
                                          currentScene--;
                                        });
                                      }
                                    },
                                    style: Theme.of(context).elevatedButtonTheme.style,
                                    child: const Icon(CupertinoIcons.back, size: 20, weight: 60,),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                SizedBox(
                                  width: 210,
                                  height: 45,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (currentScene < 7){
                                        setState(() {
                                          currentScene++;
                                        });
                                      } else {
                                        Navigator.pushReplacementNamed(context, '/login');
                                      }
                                    },
                                    style: Theme.of(context).elevatedButtonTheme.style,
                                    child: Text(
                                      currentScene < 7 ? currentScene < 6 ? 'Next' : 'Register' : 'Done',
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
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, '/login');
                              },
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
                                      color: Theme.of(context).textTheme.bodyMedium!.color,
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
                    child: inputBox(
                      hint: 'John', 
                      obscure: false
                    ),
                  ),
                  inputField(
                    width: (screenWidth-45) * 0.4,
                    height: 50.toDouble(),
                    label: 'Last Name', 
                    child: inputBox(
                      hint: 'Doe', 
                      obscure: false
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              inputField(
                width: double.infinity,
                height: 50.toDouble(),
                label: 'Other Names', 
                child: inputBox(
                  hint: 'Mark',
                  obscure: false
                ),
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
                child: GestureDetector(
                  onTap: () async {
                    final today = DateTime.now();
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime(today.year - minAllowedAge), 
                      firstDate: DateTime(today.year - 118),
                      lastDate: DateTime(today.year - minAllowedAge, today.month, today.day),
                      builder: (BuildContext context, Widget? child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                textStyle: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (picked != null && picked != selectedDate){
                      setState(() {
                        selectedDate = picked;
                      });
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 70,
                        height: 60,
                        margin: const EdgeInsets.only(right: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).inputDecorationTheme.fillColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Theme.of(context).inputDecorationTheme.border!.borderSide.color,
                          ),
                        ),
                        child: Text(
                          selectedDate.day == DateTime.now().day ? 'DD' : DateFormat.d().format(selectedDate),
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: selectedDate.day == DateTime.now().day ? Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.25) : Theme.of(context).textTheme.bodyMedium!.color,
                          ),
                        ),
                      ),
                      Container(
                        width: 85,
                        height: 60,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).inputDecorationTheme.fillColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Theme.of(context).inputDecorationTheme.border!.borderSide.color,
                          ),
                        ),
                        child: Text(
                          selectedDate.month == DateTime.now().month ? 'MMM' : DateFormat.MMM().format(selectedDate),
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: selectedDate.month == DateTime.now().month ? Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.25) : Theme.of(context).textTheme.bodyMedium!.color,
                          ),
                        ),
                      ),
                      Container(
                        width: 90,
                        height: 60,
                        margin: const EdgeInsets.only(left: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).inputDecorationTheme.fillColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Theme.of(context).inputDecorationTheme.border!.borderSide.color,
                          ),
                        ),
                        child: Text(
                          selectedDate.year == DateTime.now().year ? 'YYYY' : DateFormat.y().format(selectedDate),
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: selectedDate.year == DateTime.now().year ? Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.25) : Theme.of(context).textTheme.bodyMedium!.color,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ),
              const SizedBox(height: 20),
              inputField(
                width: 285.toDouble(),
                height: 50.toDouble(),
                label: 'Country', 
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).inputDecorationTheme.fillColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).inputDecorationTheme.border!.borderSide.color,
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
                    backgroundColor: Theme.of(context).primaryColor,
                    dialogBackgroundColor: Theme.of(context).primaryColor,
                    barrierColor: Theme.of(context).primaryColor,
                    textStyle: Theme.of(context).textTheme.labelSmall,
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

  Widget view3(double screenWidth, double screenHeight) {
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
                'How can we contact you ?',
                style: GoogleFonts.didactGothic(
                  fontSize: 26,
                  fontWeight: FontWeight.w100,
                ),
              ),
              const SizedBox(height: 55),
              inputField(
                width: screenWidth-(45*2),
                height: 50.toDouble(),
                label: 'Contact Number', 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 72.toDouble(),
                      height: 50.toDouble(),
                      decoration: BoxDecoration(
                        color: Theme.of(context).inputDecorationTheme.fillColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).inputDecorationTheme.border!.borderSide.color,
                        ),
                      ),
                      child: CountryCodePicker(
                        onChanged: (value) {
                          print(value);
                        },
                        initialSelection: 'LK',
                        favorite: const ['+94'],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        showFlagMain: false,
                        alignLeft: false,
                        backgroundColor: Theme.of(context).primaryColor,
                        dialogBackgroundColor: Theme.of(context).primaryColor,
                        barrierColor: Theme.of(context).primaryColor,
                        textStyle: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 136.toDouble(),
                          height: 50.toDouble(),
                          child: inputBox(
                            hint: '777 123 456', 
                            obscure: false,
                            textAlign: TextAlign.center
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(
                          CupertinoIcons.check_mark, 
                          size: 20, 
                          color: Color(0xFF3FDA7F),
                        ),
                      ],
                    ),
                  ],
                )
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  inputField(
                    width: 228.toDouble(),
                    height: 50.toDouble(),
                    label: 'Email Address', 
                    child: inputBox(
                      hint: 'johndoe@mail.com',
                      obscure: false
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 50.toDouble(),
                    child: const Icon(
                      CupertinoIcons.check_mark, 
                      size: 20, 
                      color: Color(0xFF3FDA7F),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 55),
      ],
    );
  }

  Widget view4(double screenWidth, double screenHeight){
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
              inputField(
                width: double.infinity,
                height: 50.toDouble(),
                label: 'Password', 
                child: inputBox(
                  hint: '',
                  obscure: true,
                ),
              ),
              const SizedBox(height: 20),
              inputField(
                width: double.infinity,
                height: 50.toDouble(),
                label: 'Confirm Password', 
                child: inputBox(
                  hint: '',
                  obscure: true,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 55),
      ],
    );
  }

  Widget view5(double screenWidth, double screenHeight){
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
                'Selfie time!',
                style: GoogleFonts.didactGothic(
                  fontSize: 26,
                  fontWeight: FontWeight.w100,
                ),
              ),
              const SizedBox(height: 55),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        try {
                          await availableCameras().then(
                            (value) {
                              if (value.isNotEmpty){
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (_) => TakePictureScreen(
                                      cameras: value,
                                      cameraLensDirection: CameraLensDirection.front,
                                      onSave: (path) {
                                        userDataProvider.setImagePath(path);
                                      },
                                    )
                                  )
                                );
                              }
                            }
                          );
                        } on CameraException catch (e) {
                          print(e);
                        }
                      },
                      child: userDataProvider.imagePath == '' 
                      ? Container(
                        width: 95,
                        height: 95,
                        decoration: BoxDecoration(
                          color: Theme.of(context).inputDecorationTheme.fillColor,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Theme.of(context).inputDecorationTheme.border!.borderSide.color,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: const Icon(CupertinoIcons.camera, size: 30) 
                      )
                      : Container(
                        width: 95,
                        height: 95,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Theme.of(context).inputDecorationTheme.fillColor,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Theme.of(context).inputDecorationTheme.border!.borderSide.color,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Image.file(
                          File('${Provider.of<UserDataProvider>(context).imagePath}'),
                          width: 95,
                          height: 95,
                          fit: BoxFit.cover,
                        ),
                      )
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Upload a selfie',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 55),
      ],
    );
  }

  Widget view6(double screenWidth, double screenHeight){
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
                'Are you real ?',
                style: GoogleFonts.didactGothic(
                  fontSize: 26,
                  fontWeight: FontWeight.w100,
                ),
              ),
              const SizedBox(height: 55),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upload NIC / Birth Certificate / Driving License',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'We need some official document to authenticate user identity',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () async {
                        try {
                          await availableCameras().then(
                            (value) {
                              if (value.isNotEmpty){
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (_) => TakePictureScreen(
                                      cameras: value,
                                      cameraLensDirection: CameraLensDirection.back,
                                      onSave: (value) {
                                        userDataProvider.addDocumentImagePath(value);
                                      },
                                    )
                                  )
                                );
                              }
                            }
                          );
                        } on CameraException catch (e) {
                          print(e);
                        }
                      },
                      child: userDataProvider.documentImagePaths.length > 0 ? SizedBox(
                        width: double.infinity,
                        height: 95,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: userDataProvider.documentImagePaths.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: 95,
                              height: 95,
                              margin: const EdgeInsets.only(right: 10),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Theme.of(context).inputDecorationTheme.fillColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Theme.of(context).inputDecorationTheme.border!.borderSide.color,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Image.file(
                                File(userDataProvider.documentImagePaths[index]),
                                width: 95,
                                height: 95,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ) :
                      Container(
                        width: screenWidth-(45*2),
                        height: 95,
                        decoration: BoxDecoration(
                          color: Theme.of(context).inputDecorationTheme.fillColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Theme.of(context).inputDecorationTheme.border!.borderSide.color,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: const Icon(CupertinoIcons.add, size: 30),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 55),
      ],
    );
  }

  Widget view7(double screenWidth, double screenHeight){
    return Column(
      children: [
        const SizedBox(height: 75),
        Container(
          width: double.infinity,
          height: screenHeight * 0.5,
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Successfully Signed Up',
                style: GoogleFonts.didactGothic(
                  fontSize: 26,
                  fontWeight: FontWeight.w100,
                ),
              ),
              const SizedBox(height: 55),
              Container(
                width: 95,
                height: 95,
                alignment: Alignment.center,
                child: const Icon(
                  CupertinoIcons.check_mark_circled, 
                  size: 90, 
                  color: Color(0xFF3FDA7F),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 55),
      ],
    );
  }

  Widget inputBox({hint, obscure, textAlign = TextAlign.start}){
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
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