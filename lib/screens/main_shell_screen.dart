import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'home_screen.dart';

class MainShellScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainShellScreen({
    super.key,
    required this.navigationShell,
  });

  @override
  State<MainShellScreen> createState () => _MainShellScreenState();
}

class _MainShellScreenState extends State<MainShellScreen> {
void _goBranch(int index){
  widget.navigationShell.goBranch(index,
  initialLocation: index == widget.navigationShell.currentIndex,
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: widget.navigationShell,
      bottomNavigationBar: CustomBottomNav(
        currentIndex: widget.navigationShell.currentIndex,
        onTap: _goBranch,
      ),
    );
  }
}