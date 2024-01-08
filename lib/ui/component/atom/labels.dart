import 'package:flutter/material.dart';

// ------------------------------------------------------------------------
//
// Generic
//
// ------------------------------------------------------------------------
class IndexLabel extends StatelessWidget {
  final String text;

  const IndexLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Text(
    text,
    key: key,
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onBackground,
    ),
  );
}

class BodyLabel extends StatelessWidget {
  final String text;

  const BodyLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Text(
    text,
    key: key,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onBackground,
    ),
  );
}

class CaptionLabel extends StatelessWidget {
  final String text;

  const CaptionLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Text(
    text,
    key: key,
    style: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
    ),
  );
}

// ------------------------------------------------------------------------
//
// For Item Card
//
// ------------------------------------------------------------------------
class ItemLabel extends StatelessWidget {
  final String text;

  const ItemLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Text(
        text,
        key: key,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      );
}

class SubItemLabel extends StatelessWidget {
  final String text;

  const SubItemLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Text(
    text,
    key: key,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onBackground,
    ),
  );
}

class DateLabel extends StatelessWidget {
  final String text;

  const DateLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Text(
    text,
    key: key,
    style: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
    ),
  );
}

class SubIconLabel extends StatelessWidget {
  final String text;

  const SubIconLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Text(
    text,
    key: key,
    style: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
    ),
  );
}
