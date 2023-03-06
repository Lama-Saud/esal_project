import 'package:flutter/material.dart';

import '../theme.dart';

class EsalTextField extends StatelessWidget {
  const EsalTextField({
    this.press,
    required this.title,
    required this.controller,
    this.readOnly,
    this.icon,
    Key? key,
  }) : super(key: key);

  final String title;
  final IconData? icon;
  final Function? press;
  final TextEditingController controller;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => press,
      child: Container(
        padding: const EdgeInsets.only(right: 24),
        decoration: const BoxDecoration(
          color: CustomTheme.skyBlue,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: TextField(
          controller: controller,
          textAlign: TextAlign.right,
          // obscureText: true,
          decoration: InputDecoration(
            suffixIcon: icon != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Icon(icon, size: 20),
                  )
                : null,
            hintText: title,
            border: InputBorder.none,
          ),
          readOnly: readOnly ?? false,
        ),
      ),
    );
    // return Container(
    //   decoration: const BoxDecoration(
    //     // color: Color.fromARGB(255, 223, 221, 221),
    //     borderRadius: BorderRadius.all(Radius.circular(30)),
    //   ),
    //   child: const TextField(
    //     textAlign: TextAlign.right,
    //     decoration: InputDecoration(
    //       enabledBorder: OutlineInputBorder(
    //         borderSide: BorderSide(color: Color(0xFF1B165C), width: 2),
    //         borderRadius: BorderRadius.all(Radius.circular(30)),
    //       ),
    //       suffixIcon: Padding(
    //         padding: EdgeInsets.only(right: 16),
    //         child: Icon(Icons.mail, size: 20),
    //       ),
    //       hintText: 'البريد الإلكتروني',
    //       border: InputBorder.none,
    //     ),
    //   ),
    // );
  }
}
