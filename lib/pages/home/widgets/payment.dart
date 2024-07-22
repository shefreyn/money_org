import 'package:flutter/material.dart';

class PaymentBar extends StatelessWidget {
  PaymentBar({
    super.key,
    required this.controller,
  });
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextField(
          controller: controller,
        )
      ],
    );
  }
}
