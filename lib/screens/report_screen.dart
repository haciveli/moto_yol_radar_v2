import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.warning_amber_rounded,
        size: 120,
        color: Colors.red,
      ),
    );
  }
}