import 'package:flutter/material.dart';
import 'package:portofolio_app/views/page_manager.dart';

void main() {
  runApp(const MyApp());
}

final ThemeData myTheme = ThemeData(
  canvasColor: Colors.white,
  primaryColor: Colors.greenAccent,
  cardColor: Colors.blueAccent,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portofolio',
      home: Material(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 0,
          ),
          body: const PageManager(),
        ),
      ),
    );
  }
}

class OrientationSwitcher extends StatelessWidget {
  final List<Widget> children;

  const OrientationSwitcher({Key? key, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait
        ? Column(children: children)
        : Row(children: children);
  }
}
