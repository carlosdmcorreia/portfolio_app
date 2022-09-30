import 'package:flutter/material.dart';
import 'package:portofolio_app/items/contact_form.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: const [
                    Icon(
                      Icons.contact_page_rounded,
                      size: 200,
                      color: Color.fromARGB(44, 105, 240, 175),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'FEEL\nFREE\nTO\nCONTACT\nME!',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(5.0, 5.0),
                              blurRadius: 0.0,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const ContactForm(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
