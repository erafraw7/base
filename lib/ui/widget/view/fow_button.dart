import 'package:flutter/material.dart';

Widget makeFowButtion(BuildContext context, String title,
        {required VoidCallback onPressed,
        bool enable = true,
        double horizontal = 24}) =>
    Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal),
      child: TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          child: Text(title),
        ),
        style: getButtonStyle(enable),
      ),
    );
