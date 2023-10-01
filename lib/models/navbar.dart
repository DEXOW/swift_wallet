import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:swift_wallet/providers/global_provider.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => NavbarState();
}

class NavbarState extends State<Navbar> {
  late GlobalProvider globalProvider;
  @override
  Widget build(BuildContext context) {
    globalProvider = Provider.of<GlobalProvider>(context);
    
    return Container(
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
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SvgPicture.asset(
                'assets/images/accounts_icon.svg',
                colorFilter: ColorFilter.mode(Theme.of(context).iconTheme.color!, BlendMode.srcIn),
                height: 20,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              globalProvider.setIndex(1);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SvgPicture.asset(
                'assets/images/home_icon.svg',
                colorFilter: ColorFilter.mode(Theme.of(context).iconTheme.color!, BlendMode.srcIn),
                height: 20,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              globalProvider.setIndex(2);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SvgPicture.asset(
                'assets/images/settings_icon.svg',
                colorFilter: ColorFilter.mode(Theme.of(context).iconTheme.color!, BlendMode.srcIn),
                height: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}