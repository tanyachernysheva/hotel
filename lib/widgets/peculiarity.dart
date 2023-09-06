import 'package:flutter/material.dart';

class Peculiarity extends StatelessWidget {
  final String? text;

  const Peculiarity({
    super.key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(251, 251, 252, 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        text ?? '',
        style: const TextStyle(color: Color.fromRGBO(130, 135, 150, 1)),
      ),
    );
  }
}
