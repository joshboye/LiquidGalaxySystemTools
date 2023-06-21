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
                  'System Tools',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shadowColor: Color(0xFF710AF5),
                elevation: 30,
                backgroundColor: Color(0xFFB175FF),
                shape: CircleBorder(),
                fixedSize: Size(179, 179),
                side: const BorderSide(
                  width: 4,
                  color: Color(0xFF710AF5),
                ),
              ),
              child: const Text(
                'Connect',
                style: TextStyle(
                  color: Color(0xFFAB0552),
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 187,
              height: 50,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(foregroundColor: Color(0xFFAB0552)),
                child: const Text(
                  'Can\'t connect? Check LG settings.',
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
