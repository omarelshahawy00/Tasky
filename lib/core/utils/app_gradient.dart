import 'package:flutter/material.dart';

const appGradient = LinearGradient(
  begin: Alignment.topCenter, // 180deg starts from the top
  end: Alignment.bottomCenter, // Ends at the bottom
  colors: [
    Color(0xFFFFF7EB), // #FFF7EB
    Color(0xFFFFE7C2), // #FFE7C2
  ],
  stops: [
    0.4276, // 42.76% as a fraction
    1.0, // 161.84% capped to 1.0
  ],
);
