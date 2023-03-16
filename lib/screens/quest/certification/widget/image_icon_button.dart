import 'package:flutter/material.dart';

class ImageIconButton extends StatelessWidget {
  const ImageIconButton(
      {super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'pick image',
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Colors.white,
        size: 50,
      ),
    );
  }
}
