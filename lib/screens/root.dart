import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:swift_wallet/providers/global_provider.dart';
import 'package:swift_wallet/screens/home/home.dart';
import 'package:swift_wallet/screens/settings/settings.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {

  late GlobalProvider globalProvider;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    globalProvider = Provider.of<GlobalProvider>(context);
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/logo.png',
                                  height: 30,
                                  width: 99,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    globalProvider.selectedIndex == 2 ? Icons.logout : Icons.notifications_outlined,
                                    size: 30,
                                  ),
                                )
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
                          child: LayoutBuilder(
                            builder: (BuildContext context, BoxConstraints constraints){
                              switch (globalProvider.selectedIndex) {
                                case 0:
                                  return const Home();
                                case 1:
                                  return const Home();
                                case 2:
                                  return const Settings();
                                default:
                                  return const Home();
                              }
                            }
                          ),
                        ),
                      ),
                    ]
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                decoration: const BoxDecoration(),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 5,
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: Row( //Navbar
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          globalProvider.setIndex(0);
                        },
                        child: Image.asset(
                          'assets/images/accounts_icon.png',
                          height: 25,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          globalProvider.setIndex(1);
                        },
                        child: Image.asset(
                          'assets/images/home_icon.png',
                          height: 25,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          globalProvider.setIndex(2);
                        },
                        child: Image.asset(
                          'assets/images/settings_icon.png',
                          height: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        ),
      ), 
    );
  }
}