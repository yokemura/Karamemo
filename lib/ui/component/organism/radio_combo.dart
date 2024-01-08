import 'package:flutter/cupertino.dart';
import '../molecule/radio_with_widget.dart';

class RadioComboItem<T> {
  RadioComboItem(this.child, this.value);

  final Widget child;
  final T? value;
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
  final Function(T?) onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) Text(title!),
          ...items
              .map((e) => RadioWithWidget<T>(
            widget: e.child,
            value: e.value,
            groupValue: value,
            onChanged: _onChanged,
          ))
              .toList(),
      ],
    );
  }

  void _onChanged(T? newValue) {
    if (newValue != null) {
      onSelected(newValue);
    }
    if (newValue == value) {
      onSelected(null);
    }
  }
}
