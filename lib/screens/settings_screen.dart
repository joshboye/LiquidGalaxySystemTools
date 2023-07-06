import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liquidgalaxybasic/services/ssh_creds_storage_service.dart';
import 'package:get_it/get_it.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final username = TextEditingController();
  final password = TextEditingController();
  final ip = TextEditingController();
  final port = TextEditingController();
  // SSHcredsStorage get ssHcredsStorage => GetIt.I<SSHcredsStorage>();
  // SSHcredsStorage? ssHcredsStorage;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   var getusername = ssHcredsStorage!.getSetting('username');
  //   var getpassword = ssHcredsStorage!.getSetting('password');
  //   var getip = ssHcredsStorage!.getSetting('ip');
  //   var getport = ssHcredsStorage!.getSetting('port');
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xFF07040A),
          appBar: AppBar(
            backgroundColor: Color(0xFF07040A),
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('images/icons/spanner.svg'),
                  const SizedBox(
                    width: 5,
                  ),
                  const SizedBox(
                    width: 300,
                    child: Text(
                      'Save Liquid Galaxy Connection Settings',
                      style: TextStyle(
                        color: Color(0xFF04E1FF),
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 350,
                child: TextField(
                  controller: username,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(27),
                        borderSide: const BorderSide(
                          color: Color(0xFFD9D9D9),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          color: Color(0xFFD9D9D9),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color(0xFFD9D9D9),
                          )),
                      labelText: 'Username',
                      labelStyle: const TextStyle(
                        color: Color(0xFFD9D9D9),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: SvgPicture.asset('images/icons/usericon.svg'),
                      ),
                      prefixIconConstraints: const BoxConstraints(minHeight: 30, minWidth: 30)),
                  style: const TextStyle(color: Color(0xFFD9D9D9)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                child: TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(27),
                        borderSide: const BorderSide(
                          color: Color(0xFFD9D9D9),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          color: Color(0xFFD9D9D9),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color(0xFFD9D9D9),
                          )),
                      labelText: 'Password',
                      labelStyle: const TextStyle(
                        color: Color(0xFFD9D9D9),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: SvgPicture.asset('images/icons/lockicon.svg'),
                      ),
                      prefixIconConstraints: const BoxConstraints(minHeight: 30, minWidth: 30)),
                  style: const TextStyle(color: Color(0xFFD9D9D9)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                child: TextField(
                  controller: ip,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(27),
                        borderSide: const BorderSide(
                          color: Color(0xFFD9D9D9),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          color: Color(0xFFD9D9D9),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color(0xFFD9D9D9),
                          )),
                      labelText: 'IP address',
                      labelStyle: const TextStyle(
                        color: Color(0xFFD9D9D9),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: SvgPicture.asset('images/icons/ipicon.svg'),
                      ),
                      prefixIconConstraints: const BoxConstraints(minHeight: 30, minWidth: 30)),
                  style: const TextStyle(color: Color(0xFFD9D9D9)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                child: TextField(
                  controller: port,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(27),
                        borderSide: const BorderSide(
                          color: Color(0xFFD9D9D9),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          color: Color(0xFFD9D9D9),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color(0xFFD9D9D9),
                          )),
                      labelText: 'Port',
                      labelStyle: const TextStyle(
                        color: Color(0xFFD9D9D9),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: SvgPicture.asset('images/icons/porticon.svg'),
                      ),
                      prefixIconConstraints: const BoxConstraints(minHeight: 30, minWidth: 30)),
                  style: const TextStyle(color: Color(0xFFD9D9D9)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    //   await ssHcredsStorage!.setSetting('username', username.text.toString());
                    //   await ssHcredsStorage!.setSetting('password', password.text.toString());
                    //   await ssHcredsStorage!.setSetting('ip', ip.text.toString());
                    //   await ssHcredsStorage!.setSetting('port', port.text.toString());
                  },
                  style: ElevatedButton.styleFrom(
                      shadowColor: Color(0xFF05ABA1),
                      elevation: 30,
                      backgroundColor: Color(0xFF05ABA1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('images/icons/saveicon.svg'),
                      const SizedBox(width: 10),
                      const Text(
                        'SAVE',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
