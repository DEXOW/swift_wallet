import 'package:flutter/material.dart';

class Accounts extends StatefulWidget {
  const Accounts({Key? key}) : super(key: key);

  @override
  State<Accounts> createState() => AccountsState();
}

class AccountsState extends State<Accounts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 55),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Accounts',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium!.color!,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Column(
            children: [
              accountTile(
                accountNo: '4311 0000 1568 1220',
                accountType: 'Current',
                balance: '120,000',
                currency: 'USD'
              ),
              const SizedBox(height: 20),
              accountTile(
                accountNo: '4312 2468 1568 3333',
                accountType: 'Savings',
                balance: '500,000',
                currency: 'USD'
              ),
              const SizedBox(height: 20),
              accountTile(
                accountNo: '4313  1357 1568 9999',
                accountType: 'Vault',
                balance: '1,500,000',
                currency: 'USD'
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Cards',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium!.color!,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Column(
            children: [
              accountTile(
                accountNo: '4212 0000 1568 1220',
                accountType: 'Credit',
                balance: '5,000',
                currency: 'USD'
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget accountTile({
    required String accountNo,
    required String accountType,
    required String balance,
    required String currency,
  }) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 100,
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: BoxDecoration(
        color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                accountNo,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium!.color!,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  accountType,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium!.color!,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Balance',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium!.color!,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                currency,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.45),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                balance,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium!.color!,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
