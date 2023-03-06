import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme.dart';

class EsalHeading extends StatelessWidget {
  const EsalHeading({
    this.color,
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // textAlign: TextAlign.right,
      style: GoogleFonts.almarai(
        textStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: color ?? CustomTheme.darkBlue,
        ),
      ),
      // textDirection: TextDirection.rtl,
    );
  }
}
