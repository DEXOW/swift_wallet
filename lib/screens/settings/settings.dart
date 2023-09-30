import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Image.asset(
                    'assets/images/user_icon.png',
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.qr_code,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '4317890650001',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(height: 50),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            optionTile(
              title: 'Account Settings',
              imageURI: 'assets/images/profile_icon.png',
            ),
            const SizedBox(height: 15),
            optionTile(
              title: 'Security Settings',
              imageURI: 'assets/images/security_icon.png',
            ),
            const SizedBox(height: 15),
            optionTile(
              title: 'App Settings',
              imageURI: 'assets/images/app_settings_icon.png',
            ),
            const SizedBox(height: 15),
            optionTile(
              title: 'Support',
              imageURI: 'assets/images/support_icon.png',
            ),
          ],
        )
      ],
    );
  }

  Widget optionTile({
    required String title,
    required String imageURI,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              imageURI,
              height: 25,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}