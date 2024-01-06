import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateMemoButtonBody extends StatelessWidget {
  const CreateMemoButtonBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 48,
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.primaryContainer,
        boxShadow: [
          BoxShadow(
            blurRadius: 8.0,
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
            offset: const Offset(4.0, 4.0),
          ),
        ],
      ),
      child: const Icon(Icons.add_rounded),
    );
  }
}
