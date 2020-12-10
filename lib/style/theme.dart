import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Colors {

  const Colors();

  static const Color mainColor = const Color(0xFF0B0235);
  static const Color secondColor = const Color(0xFF5442F7);
  static const Color grey = const Color(0xFFF78585);
  static const Color background = const Color(0xFF070111);
  static const Color titleColor = const Color(0xFF416AFF);
  static const primaryGradient = const LinearGradient(
    colors: const [ Color(0xFB96071F), Color(0xFF061286)],
    stops: const [0.0, 1.0],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const secondaryGradient = const LinearGradient(
    colors: const [ Color(0xEAA137E7), Color(0xFFff7e00)],
    stops: const [0.0, 1.0],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}