import 'package:flutter/cupertino.dart';
import 'package:karamemo/ui/component/atom/labels.dart';

class MemoTypeCombo extends StatelessWidget {
  const MemoTypeCombo(this.name, this.description, {super.key});

  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BodyLabel(text: name),
          CaptionLabel(text: description),
        ],
      ),
    );
  }
}