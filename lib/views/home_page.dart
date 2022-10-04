import 'package:flutter/material.dart';
import 'package:portofolio_app/items/cards.dart';

import '../items/textbox.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double cardSize = 200;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconTitleBox(Icons.design_services_rounded, 'PORT\n\tFOLIO'),
              Wrap(
                spacing: 50,
                runSpacing: 50,
                children: [
                  ElevatedCard('Portfolio\nApp', 'Project Description',
                      'assets/images/logo.png', cardSize),
                  ElevatedCard('ToDo\nInTime\nApp', 'Project Description',
                      'assets/images/clock.png', cardSize),
                  ElevatedCard('IX\nDesign\nWebSite', 'Project Description',
                      'assets/images/ixdesign.png', cardSize),
                ],
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 50),
          child: MyTextBox('Front\nEnd\nDev',
              'Joining my design and programming skills I want to be one of the best front-end developers'),
        ),
      ],
    );
  }
}
