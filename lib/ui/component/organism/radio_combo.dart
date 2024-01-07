import 'package:flutter/cupertino.dart';
import '../molecule/radio_with_text.dart';

class RadioComboItem<T> {
  RadioComboItem(this.label, this.value);

  final String label;
  final T value;
}

class RadioCombo<T> extends StatelessWidget {
  const RadioCombo({
    super.key,
    this.title,
    required this.items,
    required this.value,
    required this.onSelected,
  });

  final String? title;
  final List<RadioComboItem> items;
  final T? value;
  final Function(T) onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) Text(title!),
        Wrap(
          spacing: 10,
          direction: Axis.horizontal,
          children: items
              .map((e) => RadioWithText<T>(
                    text: e.label,
                    value: e.value,
                    groupValue: value,
                    onChanged: _onChanged,
                  ))
              .toList(),
        ),
      ],
    );
  }

  // TODO: Allow deselect by option
  void _onChanged(T? newValue) {
    if (newValue != null) {
      onSelected(newValue);
    }
  }
}
