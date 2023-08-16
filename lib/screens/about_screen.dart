import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_screen.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF07040A),
          title: Text(
            "About",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: SvgPicture.asset('images/icons/infoicon.svg'))
          ],
          leading: BackButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Homepage(),
                ),
              );
            },
          ),
        ),
        backgroundColor: const Color(0xFF07040A),
        body: Center(
          child: ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 250,
                height: 250,
                child: SvgPicture.asset('images/systemToolsIcon.svg'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: SizedBox(
                  height: 40,
                  child: Text(
                    "Liquid Galaxy System Tools",
                    style: TextStyle(fontSize: 30, color: Colors.white70, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 109,
                height: 70,
                child: SvgPicture.asset('images/lglogo.svg'),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                child: Text(
                  'Our partners',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
