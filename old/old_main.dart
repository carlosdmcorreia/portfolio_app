/*import 'dart:async';
import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

final ThemeData myTheme = ThemeData(
  canvasColor: Colors.white,
  primaryColor: Colors.greenAccent,
  cardColor: Colors.blueAccent,
);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticIn,
    ),
  );
  final _stateContext = StateContext();

  Future<void> _changeState() async {
    await _stateContext.nextState();
  }

  @override
  void dispose() {
    _stateContext.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portofolio',
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          toolbarHeight: 0,
        ),
        body: GestureDetector(
          onPanUpdate: (details) {
            // Swiping in left direction.
            if (details.delta.dx < 0) {
              _changeState();
            }
          },
          child: StreamBuilder(
            initialData: WelcomeState(),
            stream: _stateContext.outState,
            builder: (_, AsyncSnapshot<IState> snapshot) =>
                snapshot.data!.render(_stateContext),
          ),
        ),
      ),
    );
  }
}

abstract class IState {
  Future nextState(StateContext context);
  Widget render(StateContext context);
}

class StateContext {
  final StreamController<IState> _stateStream = StreamController<IState>();
  Sink<IState> get _inState => _stateStream.sink;
  Stream<IState> get outState => _stateStream.stream;

  late IState _currentState;

  StateContext() {
    _currentState = WelcomeState();
    _addCurrentStateToStream();
  }

  void dispose() {
    _stateStream.close();
  }

  void setState(IState state) {
    _currentState = state;
    _addCurrentStateToStream();
  }

  void _addCurrentStateToStream() {
    _inState.add(_currentState);
  }

  Future<void> nextState() async {
    await _currentState.nextState(this);

    if (_currentState is ErrorState) {
      exit(-1);
    }
  }
}

class ErrorState implements IState {
  @override
  Future nextState(StateContext context) async {
    exit(25);
  }

  @override
  Widget render(StateContext context) {
    return const Text(
      'Oops! Something went wrong...',
      style: TextStyle(
        color: Colors.red,
        fontSize: 24.0,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class WelcomeState implements IState {
  @override
  Future nextState(StateContext context) async {
    try {
      context.setState(HomePageState());
    } on Exception {
      context.setState(ErrorState());
    }
  }

  @override
  Widget render(StateContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          left: 30,
          right: 30,
          bottom: 30,
        ),
        decoration: BoxDecoration(
          color: myTheme.canvasColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 10.0),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'WELCOME',
              style: TextStyle(
                  color: Colors.black,
                  backgroundColor: Colors.greenAccent,
                  fontSize: 36,
                  fontWeight: FontWeight.w900),
            ),
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Avatar('assets/images/myphoto.png', 60),
                  Header('Carlos Correia', 'Becoming a software engineer'),
                ],
              ),
            ),
            Column(
              children: [
                const Text(
                  "swipe left",
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  CupertinoIcons.chevron_right_2,
                  size: 10,
                  color: Colors.grey,
                  shadows: [
                    Shadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 50,
                      offset: const Offset(-5, 5),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageState implements IState {
  @override
  Future nextState(StateContext context) async {
    context.setState(HomePageState());
  }

  @override
  Widget render(StateContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          left: 30,
          right: 30,
          bottom: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Welcome',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Carlos Correia',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Avatar('assets/images/myphoto.png', 20)
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 100),
                  child: MyTextBox('Front\nEnd\nDev',
                      'Joining my design and programming skills I want to be one of the best front-end developers'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'My Portofolio',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: myTheme.primaryColor,
        backgroundColor: myTheme.canvasColor,
        buttonBackgroundColor: myTheme.primaryColor,
        animationDuration: const Duration(
          milliseconds: 500,
        ),
        animationCurve: Curves.easeInBack,
        index: 1,
        items: const <Widget>[
          Icon(
            Icons.person,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.home,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.cases_outlined,
            size: 20,
            color: Colors.black,
          ),
        ],
        onTap: (index) {
          debugPrint("Current index is $index");
        },
      ),
    );
  }
}

class Avatar extends Container {
  final String imgPath;
  final double avatarSize;

  Avatar(this.imgPath, this.avatarSize, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
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
            offset: const Offset(-5, 5), // changes position of shadow
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

class MyTextBox extends Container {
  final String title;
  final String description;

  MyTextBox(this.title, this.description, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding:
          const EdgeInsets.only(top: 20, bottom: 30.0, left: 40, right: 40),
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
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 10.0),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(40.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontSize: 46, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            description,
            textAlign: TextAlign.start,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          ),
        ],
      ),
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

/*
import 'package:flutter/cupertino.dart';

IconButton(
  iconSize: 100,
  alignment: Alignment.topCenter,
  onPressed: () {
    Navigator.push(context, PageTwo());
  },
  icon: Icon(
    CupertinoIcons.chevron_right_2,
    size: 100,
    color: myTheme.primaryColor,
    shadows: [
      Shadow(
        color: Colors.grey.withOpacity(0.4),
        blurRadius: 50,
        offset: const Offset(-5, 5),
      )
    ],
  ),
),
*/

/* class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portofolio',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: HomePageState(),
      ),
    );
  }
} */

//height: MediaQuery.of(context).size.height,
//width: MediaQuery.of(context).size.width,

*/