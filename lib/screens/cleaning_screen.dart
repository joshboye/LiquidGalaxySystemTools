import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CleaningPage extends StatelessWidget {
  const CleaningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        primary: false,
        padding: const EdgeInsets.all(30),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 30,
              shadowColor: Color.fromARGB(255, 250, 179, 13),
              backgroundColor: Color(0xFFFCBA25),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: SvgPicture.asset('images/icons/cleanicon.svg'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'CLEAR KML & LOGOS',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  backgroundColor: Color.fromARGB(255, 30, 22, 38),
                  titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 19),
                  contentTextStyle: TextStyle(color: Colors.white),
                  shadowColor: Color.fromARGB(255, 0, 97, 234),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                  ),
                  title: Text('Are you sure?'),
                  content: Text('All screens will be relaunched.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Relaunch',
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  ],
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              elevation: 30,
              shadowColor: Color.fromARGB(255, 41, 128, 249),
              backgroundColor: Color(0xFF4C7CBF),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: SvgPicture.asset('images/icons/relaunchicon.svg'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'RELAUNCH',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  backgroundColor: Color.fromARGB(255, 30, 22, 38),
                  titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 19),
                  contentTextStyle: TextStyle(color: Colors.white),
                  shadowColor: Color.fromARGB(255, 196, 42, 42),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                  ),
                  title: Text('Are you sure?'),
                  content: Text('All screens will be rebooted.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Reboot',
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  ],
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              elevation: 30,
              shadowColor: Color(0xFFED0000),
              backgroundColor: Color(0xFFED0000),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: SvgPicture.asset('images/icons/rebooticon.svg'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'REBOOT',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  backgroundColor: Color.fromARGB(255, 30, 22, 38),
                  titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 19),
                  contentTextStyle: TextStyle(color: Colors.white),
                  shadowColor: Color(0xFF710AF5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                  ),
                  title: Text('Are you sure?'),
                  content: Text('All screens will be powered off.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Power-off',
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  ],
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              elevation: 30,
              shadowColor: Color(0xFF710AF5),
              backgroundColor: Color(0xFFB175FF),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: SvgPicture.asset('images/icons/powerofficon.svg'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'POWER OFF',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
