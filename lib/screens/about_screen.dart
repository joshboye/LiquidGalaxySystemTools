import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_screen.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Future<void> goToWebPage(String urlString) async {
    final Uri _url = Uri.parse(urlString);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF07040A),
          title: const Text(
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
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Container(
                  decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white24))),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: SvgPicture.asset('images/systemToolsIcon.svg'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Center(
                          child: SizedBox(
                            height: 40,
                            child: Text(
                              "Liquid Galaxy System Tools",
                              style: TextStyle(fontSize: 35, color: Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 55),
                child: Text(
                  "About App",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 70, right: 50, top: 20, bottom: 20),
                child: Text(
                  "Liquid Galaxy System Tool is a flutter app designed to do basic functions on the liquid galaxy rig such as Power-off, Reboot, Relaunch, Clearing Kml and Logos quickly. The app can be connected to the liquid galaxy rig easily by specifing the username, ip adress, password, and port number. The app also stores this data locally and will stay revived on the next session of the user.",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Developed by: Joshua Sibi \nOrganistaion: Liquid Galaxy \nOrganistaion admin: Andreu Ibanez \nMentor: Andreu Ibanez",
                    style: TextStyle(fontSize: 21, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Container(
                  decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white24))),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () async {
                              await goToWebPage('https://www.liquidgalaxy.eu/');
                            },
                            icon: SvgPicture.asset('images/lglogo.svg')),
                        SizedBox(width: 5),
                        IconButton(
                            onPressed: () async {
                              await goToWebPage('https://github.com/joshboye/LiquidGalaxySystemTools');
                            },
                            icon: Image.asset('images/icons/github-mark-white.png')),
                        SizedBox(width: 5),
                        IconButton(
                            onPressed: () async {
                              await goToWebPage('https://www.linkedin.com/in/joshua-sibi-7abba2198/');
                            },
                            icon: SvgPicture.asset('images/icons/linkedin.svg')),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/gsoc.png',
                        width: 250,
                        height: 125,
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Image.asset(
                        'images/lg_trans.png',
                        width: 250,
                        height: 125,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/lg_eu.png',
                          height: 100,
                          width: 200,
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Image.asset(
                          'images/parc.png',
                          height: 150,
                          width: 200,
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Image.asset(
                          'images/gdg.png',
                          height: 250,
                          width: 200,
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Image.asset(
                          'images/lab_tic.png',
                          width: 200,
                          height: 100,
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/flutter.png',
                          width: 200,
                          height: 100,
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Image.asset(
                          'images/lg_lab.png',
                          width: 200,
                          height: 100,
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Image.asset(
                          'images/women_techmakers.png',
                          width: 250,
                          height: 100,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
