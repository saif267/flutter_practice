import 'package:flutter/material.dart';
import 'package:test5/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Profile Screen",
        style: context.textTheme.displaySmall,
      ),
    );
  }
}