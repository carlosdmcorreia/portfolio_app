import 'package:flutter/material.dart';

class ElevatedCard extends StatelessWidget {
  final double cardSize;

  const ElevatedCard(this.cardSize, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: SizedBox(
        width: cardSize,
        height: cardSize,
        child: const Center(child: Text('Elevated Card')),
      ),
    );
  }
}
