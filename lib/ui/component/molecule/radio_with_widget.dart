import 'package:flutter/material.dart';

class RadioWithWidget<T> extends StatelessWidget {
  const RadioWithWidget({
    super.key,
    required this.widget,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final Widget widget;
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
        widget,
      ],
    );
  }
}
