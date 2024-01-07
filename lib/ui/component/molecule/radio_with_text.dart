import 'package:flutter/material.dart';

class RadioWithText<T> extends StatelessWidget {
  const RadioWithText({
    super.key,
    required this.text,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String text;
  final T value;
  final T? groupValue;
  final Function(T?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Radio<T>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(text),
        const SizedBox(
          width: 24,
        ),
      ],
    );
  }
}
