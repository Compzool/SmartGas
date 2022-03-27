import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartgas/views/dashboard/dashboard_screen.dart';
import 'package:smartgas/views/wallet/wallet.dart';

import 'bottom_bar_item.dart';

class BtmBar extends StatelessWidget {
  const BtmBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BtmNavItem(
            text: 'Home',
            icon: Icons.home_outlined,
            whenTap: () {
              Get.off(() => Dashboard());
            },
          ),
          BtmNavItem(
            text: 'Discover',
            icon: Icons.location_on_outlined,
            whenTap: () {},
          ),
          BtmNavItem(
            text: 'History',
            icon: Icons.history_outlined,
            whenTap: () {
              Get.off(() => Wallet());
            },
          ),
          BtmNavItem(
            text: 'Account',
            icon: Icons.account_circle_outlined,
            whenTap: () {},
          ),
        ],
      ),
    );
  }
}
