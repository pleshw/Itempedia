import 'package:flutter/material.dart';

class DefaultFormInput extends StatelessWidget {
  final String _labelText;
  final Color _labelColor;
  final EdgeInsets _margin;

  DefaultFormInput({
    String labelText = "Input*",
    Color labelColor = Colors.orangeAccent,
    EdgeInsets margin = const EdgeInsets.all(25),
  }):
        _labelText = labelText,
        _labelColor = labelColor,
        _margin = margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: _margin.left,
          top: _margin.top,
          right: _margin.right,
          bottom: _margin.bottom),
      child: TextField(
        key: UniqueKey(),
        decoration: InputDecoration(
            labelText: _labelText,
            focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            labelStyle: TextStyle(
              color: _labelColor,
              fontWeight: FontWeight.w600,
              fontSize: 12,
              letterSpacing: 2,
            )),
      ),
    );
  }
}
