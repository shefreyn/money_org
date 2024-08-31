import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
