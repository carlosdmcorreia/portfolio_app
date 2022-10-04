import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:portofolio_app/Views/home_page.dart';
import 'package:portofolio_app/Views/perfil_page.dart';
import 'package:portofolio_app/views/contact_page.dart';

import '../items/avatar.dart';
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
        toolbarHeight: 100,
        flexibleSpace: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10.0,
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(40.0)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Welcome',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Carlos Correia',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Avatar('assets/images/myphoto.png', 25)
            ],
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: PageView(
          allowImplicitScrolling: true,
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              FocusScope.of(context).unfocus();
              _selectedIndex = index;
            });
          },
          children: const <Widget>[
            PerfilPage(),
            HomePage(),
            ContactPage(),
          ],
        ),
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
            Icons.person_rounded,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.home_rounded,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.contact_page_rounded,
            size: 30,
            color: Colors.black,
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
