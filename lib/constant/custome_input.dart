import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomeHeadText extends StatefulWidget {
  final String text;
  const CustomeHeadText({super.key, required this.text});

  @override
  State<CustomeHeadText> createState() => _CustomeHeadTextState();
}

class _CustomeHeadTextState extends State<CustomeHeadText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w600,
            fontFamily: 'inter'));
  }
}
