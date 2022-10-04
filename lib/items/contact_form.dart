import 'dart:convert';

//import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

// Define a custom Form widget.
class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  ContactFormState createState() {
    return ContactFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class ContactFormState extends State<ContactForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerSubject = TextEditingController();
  final controllerMessage = TextEditingController();

  Future sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    const serviceId = 'service_a6h75kg';
    const templateId = 'template_qfidoeo';
    const userId = 'T5nFQkVsdQwOAIwnG';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    // ignore: unused_local_variable
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-type': 'application/json',
      },
      body: json.encode(
        {
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'to_email': 'carlosdmcorreia01@gmail.com',
            'to_name': 'carlosdmcorreia01',
            'user_subject': subject,
            'user_message': message,
          }
        },
      ),
    );

    //print(response.body);
  }

  Container createTextFormField(TextEditingController controller, IconData icon,
      String hintText, int? lenght, int? lines, TextInputType keyboardType) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Icon(icon),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 30),
            child: TextFormField(
              controller: controller,
              maxLength: lenght,
              maxLines: lines,
              keyboardType: keyboardType,
              keyboardAppearance: Brightness.dark,
              decoration: InputDecoration(
                filled: true,
                icon: null,
                contentPadding: const EdgeInsets.all(20),
                hintText: hintText,
                suffix: SizedBox(
                  width: 20,
                  height: 20,
                  child: IconButton(
                      visualDensity: VisualDensity.compact,
                      padding: const EdgeInsets.all(0),
                      icon: const Icon(
                        Icons.clear,
                        size: 20,
                      ),
                      onPressed: () {
                        controller.clear();
                      }),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please fill all fields.';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Wrap(
              runSpacing: 20,
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.center,
              children: <Widget>[
                createTextFormField(controllerName, Icons.person, 'Name', null,
                    null, TextInputType.text),
                createTextFormField(controllerSubject, Icons.title, 'Subject',
                    null, null, TextInputType.text),
                createTextFormField(controllerEmail, Icons.mail, 'Email', null,
                    null, TextInputType.emailAddress),
                createTextFormField(controllerMessage, Icons.message, 'Message',
                    250, 7, TextInputType.multiline),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                sendEmail(
                    name: controllerName.text,
                    email: controllerEmail.text,
                    subject: controllerSubject.text,
                    message: controllerMessage.text);

                controllerName.clear();
                controllerEmail.clear();
                controllerSubject.clear();
                controllerMessage.clear();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Email sent successfully')),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              elevation: 10,
              padding: const EdgeInsets.all(50),
              shape: const CircleBorder(),
            ),
            child: Icon(
              Icons.send_rounded,
              color: myTheme.primaryColor,
            ),
          ),
          const SizedBox(height: 50)
        ],
      ),
    );
  }
}
