import 'package:flutter/material.dart';

class CustomAppHeader extends StatelessWidget {
  final Widget child;
  final double height;

  const CustomAppHeader({super.key, required this.child, this.height = 0.27});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * height,
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/header_bg.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 16),
        child: child,
      ),
    );
  }
}
