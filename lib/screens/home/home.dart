import 'package:flutter/material.dart';
import 'package:swift_wallet/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
                color: Colors.white,
              ),
            ),
            Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
                color: primaryBgColor,
              ),
            ),
            SizedBox(
              width: 182,
              // height: 110,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Account Balance',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '120,000',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'USD',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.25),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Column(
                    children: [
                      Text(
                        'Last Transaction',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        '+ 5,000 USD',
                        style: TextStyle(
                          color: Color(0xFF3FDA7F),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 40),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          constraints: const BoxConstraints(
            maxHeight: 364,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/images/cards_icon.png',
                      height: 25,
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/images/transactions_icon.png',
                      height: 25,
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/images/history_icon.png',
                      height: 25,
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/images/analytics_icon.png',
                      height: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                constraints: const BoxConstraints(
                  maxHeight: 284,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 90,
                            width: 160,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/transfers_icon.png',
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Transfers',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.75),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  const Column(
                                    children: [
                                      Text(
                                        '+ 5,000 USD',
                                        style: TextStyle(
                                          color: Color(0xFF3FDA7F),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '- 200 USD',
                                        style: TextStyle(
                                          color: Color(0xFFFD413C),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 90,
                            width: 160,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/offers_icon.png',
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Offers',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.75),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width: 90,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 45,
                                          child: Image.asset(
                                            'assets/images/kfc_logo.png',
                                            height: 35,
                                          ),
                                        ),
                                        Positioned(
                                          left: 30,
                                          child: Image.asset(
                                            'assets/images/dominos_logo.png',
                                            height: 35,
                                          ),
                                        ),
                                        Positioned(
                                          left: 15,
                                          child: Image.asset(
                                            'assets/images/uber_logo.png',
                                            height: 35,
                                          ),
                                        ),
                                        Positioned(
                                          child: Image.asset(
                                            'assets/images/ubereats_logo.png',
                                            height: 35,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      balanceTile(
                        accountName: 'Swift Credit',
                        accountNo: '4561 9023 1890 7652',
                        accountType: 'credit',
                        balance: '9,900',
                        currency: 'USD',
                        status: 'Payable',
                      ),
                      const SizedBox(height: 20),
                      balanceTile(
                        accountName: 'Swift Vault',
                        accountNo: '1002 9578 1121 4563',
                        accountType: 'vault',
                        balance: '1,500,000',
                        currency: 'USD',
                        status: 'Balance',
                      ),
                      const SizedBox(height: 20),
                      balanceTile(
                        accountName: 'Swift Vault',
                        accountNo: '1002 9578 1121 4563',
                        accountType: 'vault',
                        balance: '1,500,000',
                        currency: 'USD',
                        status: 'Balance',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget balanceTile({
    required String accountName,
    required String accountNo,
    required String accountType,
    required String balance,
    required String currency,
    required String status,
  }) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF).withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      accountType == 'credit'
                          ? 'assets/images/card_icon.png'
                          : 'assets/images/vault_icon.png',
                    ),
                    const SizedBox(width: 10),
                    Text(
                      accountName,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.75),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  accountNo,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.45),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      balance,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.75),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      currency,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  status,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.45),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
