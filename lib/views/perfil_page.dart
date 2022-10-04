import 'package:flutter/material.dart';
import 'package:portofolio_app/items/textbox.dart';
import 'package:portofolio_app/main.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      children: [
        IconTitleBox(Icons.school, 'PRO\n\tFILE'),
        const SizedBox(
          width: 20,
          height: 20,
        ),
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Wrap(
              runSpacing: 20,
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
        Wrap(
          children: [
            IconTitleBox(Icons.today, '\tRIGTH\nNOW'),
            IconTextBox(Icons.code_rounded, 'Learning new languages',
                'Gaining Experience', myTheme.primaryColor),
            IconTextBox(Icons.place_rounded, 'Finding places to grow',
                'Dev Teams', myTheme.primaryColor),
          ],
        ),
        Wrap(
          alignment: WrapAlignment.center,
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
                            fontSize: 36,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    LinearProgressTextBox('DART / FLUTTER', 70.0,
                        myTheme.primaryColor, MainAxisAlignment.start),
                    LinearProgressTextBox('SWIFT / SWIFTUI', 30.0,
                        myTheme.primaryColor, MainAxisAlignment.start),
                    LinearProgressTextBox('C', 90.0, myTheme.primaryColor,
                        MainAxisAlignment.start),
                    LinearProgressTextBox('C++', 40.0, myTheme.primaryColor,
                        MainAxisAlignment.start),
                    LinearProgressTextBox('JAVA', 70.0, myTheme.primaryColor,
                        MainAxisAlignment.start),
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
                      margin: const EdgeInsets.only(top: 80.0),
                      alignment: Alignment.topRight,
                      child: const Text(
                        'OTHER\nSKILLS',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    LinearProgressTextBox('ADOBE ILLUSTRATOR', 80.0,
                        Colors.limeAccent, MainAxisAlignment.end),
                    LinearProgressTextBox('WEB DESIGN', 50.0, Colors.limeAccent,
                        MainAxisAlignment.end),
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
    );
  }
}
