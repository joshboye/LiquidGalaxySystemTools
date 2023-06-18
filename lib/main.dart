import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF07040A),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF07040A),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 7)),
              SvgPicture.asset(
                'images/lglogo.svg',
                height: 35,
              ),
              const SizedBox(
                width: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(
                  'Basics',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
