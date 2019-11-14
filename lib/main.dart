import 'package:division/division.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: MessageDisplayDivision(),
      ),
    );
  }
}

class MessageDisplayClassic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Lorem ipsum dolor sit amet...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        width: 350,
        decoration: BoxDecoration(
          color: Colors.green.shade800,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class MessageDisplayDivision extends StatefulWidget {
  @override
  _MessageDisplayDivisionState createState() => _MessageDisplayDivisionState();
}

class _MessageDisplayDivisionState extends State<MessageDisplayDivision> {
  bool isBeingTapped = false;

  final containerStyle = ParentStyle(angleFormat: AngleFormat.degree)
    ..alignment.center()
    ..padding(all: 16)
    ..width(350)
    ..background.color(Colors.green.shade800)
    ..borderRadius(all: 8)
    ..elevation(3)
    ..ripple(true)
    ..animate(100, Curves.decelerate);

  final textStyle = TxtStyle()
    ..textColor(Colors.white)
    ..fontSize(30)
    ..bold()
    ..italic()
    ..textAlign.start();

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: Container(
        child: Txt(
          'Lorem ipsum dolor sit amet...',
          style: textStyle,
        ),
      ),
      style: containerStyle.clone()
        ..elevation(isBeingTapped ? 10 : 3)
        ..scale(isBeingTapped ? 1.1 : 1)
        ..rotate(isBeingTapped ? -10 : 0),
      gesture: GestureClass()
        ..onTapDown((_) {
          setState(() {
            isBeingTapped = true;
          });
        })
        ..onTapUp((_) {
          setState(() {
            isBeingTapped = false;
          });
        })
        ..onTapCancel(() {
          setState(() {
            isBeingTapped = false;
          });
        }),
    );
  }
}
