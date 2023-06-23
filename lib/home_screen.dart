import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liquidgalaxybasic/cleaning_screen.dart';
import 'package:liquidgalaxybasic/settings_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _navitemindex = 0;

  final tabs = [
    HomeBody(),
    CleaningPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          backgroundColor: Color(0xFF07040A),
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ),
                  );
                },
                icon: SvgPicture.asset('images/icons/settingicon.svg'),
              )
            ],
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
          body: tabs[_navitemindex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Color(0xFF07040A),
            currentIndex: _navitemindex,
            onTap: (index) {
              setState(() {
                _navitemindex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: SvgPicture.asset(
                  'images/icons/HomeIcon.svg',
                  color: _navitemindex == 1 ? Color(0xFFAB0552) : Color(0xFFFCBA25),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'images/icons/Cleanlogo.svg',
                  color: _navitemindex == 0 ? Color(0xFFAB0552) : Color(0xFFFCBA25),
                ),
                label: 'Tools',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Color(0xFFAB0552)),
            child: const Text(
              'Can\'t connect? Check LG settings.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ]),
    );
  }
}
