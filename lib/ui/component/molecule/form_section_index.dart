import 'package:flutter/cupertino.dart';

import '../atom/labels.dart';

class FormSectionIndex extends StatelessWidget {
  final String text;

  const FormSectionIndex({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        IndexLabel(key: key, text: text),
      ],),
    );
  }

}