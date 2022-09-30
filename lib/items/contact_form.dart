import 'dart:convert';

import 'package:email_validator/email_validator.dart';
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
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-type': 'application/json',
      },
      body: json.encode({
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
      }),
    );

    print(response.body);
  }

  TextFormField createTextFormField(
      TextEditingController controller,
      String hintText,
      int? lenght,
      int? lines,
      TextInputType keyboardType,
      double maxWidth) {
    return TextFormField(
      maxLength: lenght,
      maxLines: lines,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        constraints: BoxConstraints(maxWidth: maxWidth),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          createTextFormField(
              controllerName, 'Name', null, null, TextInputType.text, 1020),
          const SizedBox(height: 20),
          Wrap(
            children: [
              createTextFormField(controllerEmail, 'Email', null, null,
                  TextInputType.text, 500),
              const SizedBox(
                height: 20,
                width: 20,
              ),
              createTextFormField(controllerSubject, 'Subject', null, null,
                  TextInputType.text, 500),
            ],
          ),
          const SizedBox(height: 20),
          createTextFormField(
              controllerSubject, 'Message', 250, 7, TextInputType.text, 1020),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
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
              primary: Colors.black,
              minimumSize: const Size(1020, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50), // <-- Radius
              ),
            ),
            child: Text(
              'SEND',
              style: TextStyle(
                  fontWeight: FontWeight.w900, color: myTheme.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
