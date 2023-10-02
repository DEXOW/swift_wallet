import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Accounts extends StatefulWidget {
  const Accounts({Key? key}) : super(key: key);

  @override
  State<Accounts> createState() => AccountsState();
}

class AccountsState extends State<Accounts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Accounts',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.75),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }

  // Widget accountTile({
  //   required String accountNo,
  //   required String accountType,
  //   required String balance,
  //   required String currency,
  // }) {
  //   return Container(
  //     width: double.infinity,
  //     height: 70,
  //     decoration: BoxDecoration(
  //       color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.1),
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     child: Container(
  //       margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Row(
  //                 children: [
  //                   SvgPicture.asset(
  //                     accountType == 'credit'
  //                         ? 'assets/images/card_icon.svg'
  //                         : 'assets/images/vault_icon.svg',
  //                     colorFilter: ColorFilter.mode(Theme.of(context).iconTheme.color!, BlendMode.srcIn),
  //                     height: 15,
  //                   ),
  //                   const SizedBox(width: 10),
  //                   Text(
  //                     accountName,
  //                     style: TextStyle(
  //                       color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.75),
  //                       fontSize: 14,
  //                       fontWeight: FontWeight.w500,
  //                     ),
  //                   )
  //                 ],
  //               ),
  //               const SizedBox(height: 5),
  //               Text(
  //                 accountNo,
  //                 style: TextStyle(
  //                   color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.45),
  //                   fontSize: 11,
  //                   fontWeight: FontWeight.w500,
  //                 ),
  //               )
  //             ],
  //           ),
  //           Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.end,
  //             children: [
  //               Row(
  //                 children: [
  //                   Text(
  //                     balance,
  //                     style: TextStyle(
  //                       color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.75),
  //                       fontSize: 14,
  //                       fontWeight: FontWeight.w500,
  //                     ),
  //                   ),
  //                   const SizedBox(width: 5),
  //                   Text(
  //                     currency,
  //                     style: TextStyle(
  //                       color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.5),
  //                       fontSize: 11,
  //                       fontWeight: FontWeight.w500,
  //                     ),
  //                   )
  //                 ],
  //               ),
  //               const SizedBox(height: 5),
  //               Text(
  //                 status,
  //                 style: TextStyle(
  //                   color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.45),
  //                   fontSize: 11,
  //                   fontWeight: FontWeight.w500,
  //                 ),
  //               )
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
