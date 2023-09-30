import 'package:flutter/material.dart';

class TipsWidget extends StatefulWidget {
  const TipsWidget({Key? key}) : super(key: key);

  @override
  State<TipsWidget> createState() => TipsWidgetState();
}

class TipsWidgetState extends State<TipsWidget> {
  List<String> tips = [
    'Swift Wallet is an innovative mobile banking app empowering you to manage your money effortlessly',
    'A user-friendly app that puts convenience at your fingertips, allowing you to focus on what matters most',
    'All-in-one mobile banking companion, providing seamless money management',
  ];

  Duration duration = const Duration(seconds: 15);
  int index = 0;

  Future<void> changeTips() async {
    await Future<void>.delayed(duration);
    setState(() {
      index = (index + 1) % tips.length;
    });
    changeTips();
  }

  @override
  void initState() {
    super.initState();
    changeTips();
  }

  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Container(
              height: 80,
              width: constraints.maxWidth * 0.78,
              alignment: Alignment.center,
              child: Text(
                tips[index],
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                tips.length,
                (int index) => dot(index == this.index),
              ),
            ),
          ],
        );
      },
    );
  }
  Widget dot(bool active) {
    Color color = active ? Colors.white : Colors.white.withOpacity(0.5);

    return Container(
      height: 10,
      width: 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}