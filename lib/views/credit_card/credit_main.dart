import 'package:flutter/material.dart';

import 'credit_card.dart';

class CreditMain extends StatelessWidget {
  static String routeName = "/complete_profile";

  const CreditMain({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CreditCard();
  }
}
