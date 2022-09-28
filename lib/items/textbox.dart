import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../main.dart';

class MyTextBox extends Container {
  final String title;
  final String description;

  MyTextBox(this.title, this.description, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 46,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(5.0, 5.0),
                blurRadius: 3.0,
                color: Color.fromARGB(20, 0, 0, 0),
              ),
            ],
          ),
        ),
        Container(
          width: 200,
          margin: const EdgeInsets.only(left: 20, top: 20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: SweepGradient(
              center: Alignment.bottomRight,
              startAngle: 0,
              endAngle: 3.14 * 2,
              colors: [
                myTheme.primaryColor,
                myTheme.cardColor,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 3.0,
                offset: const Offset(5.0, 5.0),
              ),
            ],
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(40.0),
                bottomLeft: Radius.circular(40.0)),
          ),
          child: Text(
            description,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class CircleTextBox extends Container {
  final String title;
  final Color myColor;

  CircleTextBox(this.title, this.myColor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: myColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(-5, 5), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class IconTextBox extends Container {
  final IconData myIcon;
  final String title;
  final String description;
  final Color myColor;

  IconTextBox(this.myIcon, this.title, this.description, this.myColor,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              myIcon,
              size: 30,
              color: myColor,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                description,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CircularProgressTextBox extends Container {
  final String title;
  final int percentage;
  final Color myColor;

  CircularProgressTextBox(this.title, this.percentage, this.myColor, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            ),
          ),
          CircularPercentIndicator(
            radius: 100.0,
            lineWidth: 20.0,
            animation: true,
            animationDuration: 3000,
            curve: Curves.elasticIn,
            restartAnimation: true,
            percent: percentage / 100,
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: myColor,
            reverse: true,
          ),
        ],
      ),
    );
  }
}

class LinearProgressTextBox extends Container {
  final String title;
  final double percentage;
  final Color myColor;
  final MainAxisAlignment main;

  LinearProgressTextBox(this.title, this.percentage, this.myColor, this.main,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CrossAxisAlignment cross = CrossAxisAlignment.center;
    switch (main) {
      case MainAxisAlignment.start:
        cross = CrossAxisAlignment.start;
        break;
      case MainAxisAlignment.center:
        cross = CrossAxisAlignment.center;
        break;
      case MainAxisAlignment.end:
        cross = CrossAxisAlignment.end;
        break;
      default:
    }

    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: main,
        crossAxisAlignment: cross,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          LinearPercentIndicator(
            alignment: main,
            width: 200,
            animation: true,
            lineHeight: 20.0,
            animationDuration: 3000,
            percent: percentage / 100,
            center: Text(
              "$percentage%",
            ),
            curve: Curves.elasticIn,
            restartAnimation: true,
            barRadius: const Radius.circular(16),
            progressColor: myColor,
          ),
        ],
      ),
    );
  }
}
