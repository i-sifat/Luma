// main.dart
import 'package:flutter/material.dart';
import 'package:luma/core/themes/app_theme.dart';
import 'package:luma/screens/grid_home.dart';
import 'package:luma/screens/list_home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const HomeSwitcher(),
    );
  }
}

class HomeSwitcher extends StatefulWidget {
  const HomeSwitcher({super.key});

  @override
  State<HomeSwitcher> createState() => _HomeSwitcherState();
}

class _HomeSwitcherState extends State<HomeSwitcher> {
  bool showGridLayout = true;

  void _toggleLayout() {
    setState(() {
      showGridLayout = !showGridLayout;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Notes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.swap_horiz),
            onPressed: _toggleLayout,
            tooltip: 'Organize',
          ),
        ],
      ),
      body: showGridLayout ? const GridHomeScreen() : const ListHome(),
    );
  }
}
