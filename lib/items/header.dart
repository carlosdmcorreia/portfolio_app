import 'package:flutter/material.dart';

class Header extends Container {
  final String name;
  final String description;

  Header(this.name, this.description, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(name,
              textAlign: TextAlign.start,
              maxLines: 2,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          Text(description,
              textAlign: TextAlign.start,
              maxLines: 2,
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  fontStyle: FontStyle.italic))
        ],
      ),
    );
  }
}
