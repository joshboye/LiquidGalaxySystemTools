import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:liquidgalaxybasic/screens/about_screen.dart';
import 'package:liquidgalaxybasic/screens/cleaning_screen.dart';
import 'package:liquidgalaxybasic/screens/settings_screen.dart';
import 'package:liquidgalaxybasic/services/lg_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _navitemindex = 0;

  final tabs = [
    const HomeBody(),
    const CleaningPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          backgroundColor: const Color(0xFF07040A),
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutScreen()),
                  );
                },
                icon: SvgPicture.asset('images/icons/infoicon.svg'),
              ),
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
            backgroundColor: const Color(0xFF07040A),
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
            backgroundColor: const Color(0xFF07040A),
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
                  color: _navitemindex == 1 ? const Color(0xFFAB0552) : const Color(0xFFFCBA25),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'images/icons/Cleanlogo.svg',
                  color: _navitemindex == 0 ? const Color(0xFFAB0552) : const Color(0xFFFCBA25),
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

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  LGservice get lgService => GetIt.I<LGservice>();

  bool connected = false;
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    checkconnection();
    super.initState();
  }

  Future<void> checkconnection() async {
    var res = await lgService.connect();
    print(res);
    if (res == 'connected') {
      setState(() {
        connected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
            onPressed: () {
              checkconnection();
            },
            style: ElevatedButton.styleFrom(
              shadowColor: connected ? const Color(0xFF053417) : const Color(0xFF710AF5),
              elevation: 30,
              backgroundColor: connected ? const Color(0xFF31B161) : const Color(0xFFB175FF),
              shape: const CircleBorder(),
              fixedSize: const Size(200, 200),
              side: connected ? const BorderSide(width: 4, color: Color(0xFF053417)) : const BorderSide(width: 4, color: Color(0xFF710AF5)),
            ),
            child: connected
                ? const Text('Connected',
                    style: TextStyle(
                      color: Color(0xFFFFB100),
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ))
                : const Text('Connect',
                    style: TextStyle(
                      color: Color(0xFFAB0552),
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ))),
        const SizedBox(height: 5),
        SizedBox(
          width: 187,
          height: 50,
          child: connected
              ? TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(foregroundColor: const Color(0xFFB175FF)),
                  child: const Text(
                    'You\'re all set!',
                    textAlign: TextAlign.center,
                  ),
                )
              : TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsScreen(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(foregroundColor: const Color(0xFFAB0552)),
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
