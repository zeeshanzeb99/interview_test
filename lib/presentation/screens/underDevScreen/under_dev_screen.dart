import 'package:adv_test/helper/resources/string_resources.dart';
import 'package:flutter/material.dart';

class UnderDevScreen extends StatefulWidget {
  const UnderDevScreen({super.key});

  @override
  State<UnderDevScreen> createState() => _UnderDevScreenState();
}

class _UnderDevScreenState extends State<UnderDevScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(StringResources.STR_UNDER_DEV),
    );
  }
}
