import 'package:flutter/material.dart';

/// Wrapped with a Safe Area
class CustomScaffold extends StatefulWidget {
  /// Custom Widget for Scaffold
  CustomScaffold({super.key, required this.body, this.backgroundColor});

  ///Wrapped with Safe Area
  Widget body;
  Color? backgroundColor;

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          right: 20.0,
          bottom: 20.0,
          left: 20,
        ),
        child: widget.body,
      )),
    );
  }
}
