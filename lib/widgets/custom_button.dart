import 'package:flutter/material.dart';

enum CustomButtonType { primary, secondary, tertiary }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final CustomButtonType type;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = CustomButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color foregroundColor;
    Color borderColor;

    switch (type) {
      case CustomButtonType.primary:
        backgroundColor = const Color(0xFF6558D3);
        foregroundColor = Colors.white;
        borderColor = const Color(0xFF6558D3);
        break;

      case CustomButtonType.secondary:
        backgroundColor = const Color(0xFFEFEDFF);
        foregroundColor = const Color(0xFF6558D3);
        borderColor = const Color(0xFFEFEDFF);
        break;

      case CustomButtonType.tertiary:
        backgroundColor = Colors.transparent;
        foregroundColor = const Color(0xFF6558D3);
        borderColor = Colors.transparent;
        break;
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
          side: BorderSide(color: borderColor),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class CustomEventButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomEventButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: label,
      onPressed: onPressed,
      type: CustomButtonType.primary,
    );
  }
}
