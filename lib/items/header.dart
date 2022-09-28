import 'package:flutter/material.dart';

class Header extends Container {
  final String name;
  final String description;

  Header(this.name, this.description, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(name,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        Text(description,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
                fontSize: 16,
                fontStyle: FontStyle.italic))
      ],
    );
  }
}
