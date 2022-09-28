import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portofolio_app/items/textbox.dart';
import 'package:portofolio_app/main.dart';

import '../items/avatar.dart';
import '../items/header.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPage();
}

class _PerfilPage extends State<PerfilPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0.00, -0.02),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linearToEaseOut,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        /*SlideTransition(
          position: _offsetAnimation,
          child:*/
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 50),
              height: MediaQuery.of(context).size.height - 200,
              width: MediaQuery.of(context).size.width - 100,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 10.0),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Avatar('assets/images/myphoto.png', 60),
                        Header(
                            'Carlos Correia', 'Becoming a software engineer'),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Icon(
                        CupertinoIcons.chevron_up,
                        size: 10,
                        color: Colors.grey,
                        shadows: [
                          Shadow(
                            color: Colors.grey.withOpacity(0.4),
                            blurRadius: 50,
                            offset: const Offset(-5, 5),
                          )
                        ],
                      ),
                      const Text(
                        "swipe up",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        //),
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: const [
            Icon(
              Icons.school,
              size: 200,
              color: Color.fromARGB(44, 105, 240, 175),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'PRO\n\tFILE',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    IconTextBox(
                        Icons.design_services,
                        'Graphic Design Intership',
                        '6 months',
                        myTheme.primaryColor),
                    IconTextBox(Icons.desktop_mac, 'IX DESIGN',
                        'Interface & Experience', myTheme.primaryColor),
                    IconTextBox(Icons.keyboard, 'Coding', 'Junior Free Lancer',
                        myTheme.primaryColor),
                  ],
                ),
                CircularProgressTextBox(
                    'European Computer Science', 66, myTheme.primaryColor),
              ],
            ),
          ],
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Wrap(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      children: [
                        const Icon(
                          Icons.code,
                          size: 300,
                          color: Color.fromARGB(44, 105, 240, 175),
                        ),
                        Wrap(
                          direction: Axis.vertical,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 40.0),
                              alignment: Alignment.topRight,
                              child: const Text(
                                'LANGUAGES',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            LinearProgressTextBox('DART / FLUTTER', 70.0,
                                myTheme.primaryColor, MainAxisAlignment.start),
                            LinearProgressTextBox('SWIFT / SWIFTUI', 30.0,
                                myTheme.primaryColor, MainAxisAlignment.start),
                            LinearProgressTextBox('C', 90.0,
                                myTheme.primaryColor, MainAxisAlignment.start),
                            LinearProgressTextBox('C++', 40.0,
                                myTheme.primaryColor, MainAxisAlignment.start),
                            LinearProgressTextBox('JAVA', 70.0,
                                myTheme.primaryColor, MainAxisAlignment.start),
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        const Icon(
                          Icons.add,
                          size: 300,
                          color: Color.fromARGB(44, 105, 240, 175),
                        ),
                        Wrap(
                          alignment: WrapAlignment.end,
                          crossAxisAlignment: WrapCrossAlignment.end,
                          direction: Axis.vertical,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 40.0),
                              alignment: Alignment.topRight,
                              child: const Text(
                                'OTHER SKILLS',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            LinearProgressTextBox('ADOBE ILLUSTRATOR', 80.0,
                                Colors.limeAccent, MainAxisAlignment.end),
                            LinearProgressTextBox('WEB DESIGN', 50.0,
                                Colors.limeAccent, MainAxisAlignment.end),
                            LinearProgressTextBox('VIDEO MAKING', 40.0,
                                Colors.limeAccent, MainAxisAlignment.end),
                            LinearProgressTextBox('PHOTOGRAPHY', 60.0,
                                Colors.limeAccent, MainAxisAlignment.end),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
