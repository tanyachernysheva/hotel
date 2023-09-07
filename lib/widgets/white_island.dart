import 'package:flutter/material.dart';

class WhiteIsland extends StatelessWidget {
  final double? padding;
  final Widget? child;

  const WhiteIsland({
    super.key,
    this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.all(
          Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(padding ?? 0),
        child: child,
      ),
    );
  }
}
