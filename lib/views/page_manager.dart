import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portofolio_app/Views/home_page.dart';
import 'package:portofolio_app/Views/perfil_page.dart';

import '../main.dart';

class PageManager extends StatefulWidget {
  const PageManager({super.key});

  @override
  State<PageManager> createState() => _PageManager();
}

class _PageManager extends State<PageManager> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInBack);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: PageView(
        allowImplicitScrolling: true,
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
        children: const <Widget>[
          PerfilPage(),
          HomePage(),
          PerfilPage(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: myTheme.primaryColor,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: myTheme.primaryColor,
        animationDuration: const Duration(
          milliseconds: 500,
        ),
        animationCurve: Curves.easeInBack,
        index: _selectedIndex,
        height: 75,
        items: const <Widget>[
          Icon(
            Icons.person,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.home,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.contact_page,
            size: 30,
            color: Colors.black,
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
