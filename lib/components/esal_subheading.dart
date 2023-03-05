import 'package:final_project/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EsalSubheading extends StatelessWidget {
  const EsalSubheading({
    this.color,
    this.fontWeight,
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text, //El Messiri
      style: GoogleFonts.almarai(
        textStyle: const TextStyle(fontSize: 18),
        color: color ?? CustomTheme.darkBlue,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
      // textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
    );
  }
}
