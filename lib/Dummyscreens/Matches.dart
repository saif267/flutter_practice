import 'package:flutter/material.dart';
import 'package:test5/theme.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Matches Screen",
        style: context.textTheme.displaySmall,
      ),
    );
  }
}