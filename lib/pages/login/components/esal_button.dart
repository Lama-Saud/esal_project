import 'package:flutter/material.dart';

class EsalButton extends StatelessWidget {
  const EsalButton({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), color: Color(0xFF1B165C)),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }
}
