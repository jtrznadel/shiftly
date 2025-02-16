import 'package:flutter/material.dart';
import 'package:shiftly/core/common/extensions/context_extension.dart';

class Heading extends StatelessWidget {
  const Heading({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.titleLarge,
    );
  }
}
