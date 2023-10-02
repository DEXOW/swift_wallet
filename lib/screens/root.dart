import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:swift_wallet/models/navbar.dart';

import 'package:swift_wallet/providers/global_provider.dart';
import 'package:swift_wallet/screens/accounts/accounts.dart';
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

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){
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
                                  SvgPicture.asset(
                                    'assets/logo.svg',
                                    height: 30,
                                    colorFilter: ColorFilter.mode(Theme.of(context).iconTheme.color!, BlendMode.srcIn),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      if (globalProvider.selectedIndex == 0){
                                        null;
                                      } else if (globalProvider.selectedIndex == 1) {
                                        null;
                                      } else {
                                        globalProvider.resetIndex();
                                        Navigator.popAndPushNamed(context, '/login');
                                      }
                                    },
                                    icon: Icon(
                                      globalProvider.selectedIndex == 0 ? Icons.add : globalProvider.selectedIndex == 1 ? Icons.notifications_outlined :  Icons.logout,
                                      size: 30,
                                    ),
                                  )
                                ]
                              ),
                            ),
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
                                    return const Accounts();
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
                bottomNavigationBar: const Navbar(),
              );
            }
          ),
        ), 
      ),
    );
  }
}