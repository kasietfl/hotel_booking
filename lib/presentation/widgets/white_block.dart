import 'package:flutter/material.dart';

class WhiteBlock extends StatelessWidget {
  final Widget? child;
  const WhiteBlock({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: child,
    );
  }
}
