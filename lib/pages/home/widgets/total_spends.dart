import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_org/resources/constants/string_constants.dart';
import 'package:money_org/resources/theme/text.dart';

class TotalSpendsWidget extends StatefulWidget {
  const TotalSpendsWidget({super.key});

  @override
  State<TotalSpendsWidget> createState() => _TotalSpendsWidgetState();
}

class _TotalSpendsWidgetState extends State<TotalSpendsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          CustomStrings.totalSpends,
          style: CustomTextStyles.header(true, fontWeight: FontWeight.bold),
        ),
        Text(
          CustomStrings.dummyAmount,
          style: CustomTextStyles.header(true,
              fontWeight: FontWeight.bold, customColor: Colors.white),
        ),
      ],
    );
  }
}
