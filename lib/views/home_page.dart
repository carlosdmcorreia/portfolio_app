import 'package:flutter/material.dart';
import 'package:portofolio_app/items/cards.dart';

import '../items/avatar.dart';
import '../items/textbox.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double cardSize = 150;

    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Avatar('assets/images/myphoto.png', 25)
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Wrap(
                    runSpacing: 50,
                    spacing: 50,
                    children: [
                      MyTextBox('Front\nEnd\nDev',
                          'Joining my design and programming skills I want to be one of the best front-end developers'),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'My Portofolio\n',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            children: [
                              ElevatedCard('Portfolio\nApp',
                                  'assets/images/logo.png', cardSize),
                              ElevatedCard('Swift\nTimer\nApp',
                                  'assets/images/clock.png', cardSize),
                              ElevatedCard('IX\nDesign\nWebSite',
                                  'assets/images/ixdesign.png', cardSize),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
