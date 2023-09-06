import 'package:flutter/material.dart';
import 'package:hotel/widgets/custom_button.dart';

class BottomNavigationButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  const BottomNavigationButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Divider(
            height: 0,
            thickness: 1,
          ),
          const SizedBox(
            height: 12,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: CustomButton(
                text: label,
                onPressed: onPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
