import 'package:flutter/material.dart';
import 'package:portofolio_app/items/contact_form.dart';

import '../items/textbox.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        IconTitleBox(Icons.contact_page_rounded, 'FEEL\nFREE TO\nCONTACT\nME!'),
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const ContactForm()),
      ],
    );
  }
}
