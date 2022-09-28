import 'package:flutter/material.dart';
import '../main.dart';

class Avatar extends Container {
  final String imgPath;
  final double avatarSize;

  Avatar(this.imgPath, this.avatarSize, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
      decoration: BoxDecoration(
        gradient: SweepGradient(
          center: Alignment.bottomRight,
          startAngle: 0,
          endAngle: 3.14 * 2,
          colors: [
            myTheme.cardColor,
            myTheme.primaryColor,
          ],
        ),
        borderRadius: const BorderRadius.all(Radius.circular(1000)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(-2.5, 2.5), // changes position of shadow
          ),
        ],
      ),
      child: CircleAvatar(
        radius: avatarSize,
        child: CircleAvatar(
          backgroundImage: AssetImage(imgPath),
          radius: avatarSize,
        ),
      ),
    );
  }
}
