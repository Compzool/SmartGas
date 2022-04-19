import 'package:flutter/material.dart';

import '../dashboard/components/bottom_bar.dart';
import 'components/my_wallet.dart';
import 'components/operations.dart';
import 'components/transactions.dart';

class Wallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: Container(
          height: double.maxFinite,
          decoration: const BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 60.0, 0.0, 0.0),
                    ),
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Elon_Musk_Royal_Society_%28crop2%29.jpg/251px-Elon_Musk_Royal_Society_%28crop2%29.jpg'),
                      radius: 20.0,
                    ),
                    SizedBox(
                      width:
                          (MediaQuery.of(context).size.width.toDouble() * 0.04),
                      //width: 20.0,
                    ),
                    const Text('Hello, elon,'),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                  //height: 15.0,
                ),
                const Align(
                  alignment: AlignmentDirectional(-0.85, 0),
                  child: Text(
                    'My Wallet',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                myWallet(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  //height: 50.0,
                ),
                const Align(
                  alignment: AlignmentDirectional(-0.85, 0),
                  child: Text(
                    'Operations',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                  //height: 15.0,
                ),
                Operations(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                  //height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('Transfer'),
                    Text('CreditCard'),
                    Text('QR code'),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  //height: 50.0,
                ),
                const Align(
                  alignment: AlignmentDirectional(-0.85, 0),
                  child: Text(
                    'Transactions',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                  //height: 10,
                ),
                Transactions(),
                // const Padding(
                //   padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                //   child: const BtmBar(),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
