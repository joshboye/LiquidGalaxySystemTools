import 'package:dartssh2/dartssh2.dart';
import 'package:get_it/get_it.dart';
import 'package:liquidgalaxybasic/services/ssh_creds_storage_service.dart';

class LGservice {
  SSHcredsStorage get ssHcredsStorage => GetIt.I<SSHcredsStorage>();

  int get logoScreen {
    final screenAmount = int.parse(ssHcredsStorage.getvalue('screenamount'));
    if (screenAmount == 1) {
      return 1;
    }
    // Gets the most left screen.
    return (screenAmount / 2).floor() + 2;
  }

  Future<String> connect() async {
    final user = ssHcredsStorage.getvalue('username');
    final pw = ssHcredsStorage.getvalue('password');
    final ipaddress = ssHcredsStorage.getvalue('ip');
    final prt = ssHcredsStorage.getvalue('port');

    try {
      SSHClient(
        await SSHSocket.connect(
          ipaddress,
          int.parse(prt),
          timeout: Duration(seconds: 8),
        ),
        username: user,
        onPasswordRequest: () => pw,
      );
      return 'connected';
    } catch (e) {
      return '$e';
    }
  }

  Future<void> relaunch() async {
    final user = ssHcredsStorage.getvalue('username');
    final pw = ssHcredsStorage.getvalue('password');
    final ipaddress = ssHcredsStorage.getvalue('ip');
    final prt = ssHcredsStorage.getvalue('port');
    final screenAmount = int.parse(ssHcredsStorage.getvalue('screenamount'));

    final client = SSHClient(
      await SSHSocket.connect(ipaddress, int.parse(prt)),
      username: user,
      onPasswordRequest: () => pw,
    );

    for (var i = screenAmount; i >= 1; i--) {
      try {
        final relaunchCommand = """RELAUNCH_CMD="\\
  if [ -f /etc/init/lxdm.conf ]; then
    export SERVICE=lxdm
  elif [ -f /etc/init/lightdm.conf ]; then
    export SERVICE=lightdm
  else
    exit 1
  fi
  if  [[ \\\$(service \\\$SERVICE status) =~ 'stop' ]]; then
    echo $pw | sudo -S service \\\${SERVICE} start
  else
    echo $pw | sudo -S service \\\${SERVICE} restart
  fi
  " && sshpass -p $pw ssh -x -t lg@lg$i "\$RELAUNCH_CMD\"""";
        await client.execute('"/home/$user/bin/lg-relaunch" > /home/$user/log.txt');
        await client.execute(relaunchCommand);
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    }
  }

  static String generateBlank(String id) {
    return '''
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
  <Document id="$id">
  </Document>
</kml>
    ''';
  }

  Future<void> clearKmlLogo() async {
    final user = ssHcredsStorage.getvalue('username');
    final pw = ssHcredsStorage.getvalue('password');
    final ipaddress = ssHcredsStorage.getvalue('ip');
    final prt = ssHcredsStorage.getvalue('port');
    final screenAmount = int.parse(ssHcredsStorage.getvalue('screenamount'));

    final client = SSHClient(
      await SSHSocket.connect(ipaddress, int.parse(prt)),
      username: user,
      onPasswordRequest: () => pw,
    );

    String query = 'echo "exittour=true" > /tmp/query.txt && > /var/www/html/kmls.txt';

    for (var i = 2; i <= screenAmount; i++) {
      String blankKml = generateBlank('slave_$i');
      query += " && echo '$blankKml' > /var/www/html/kml/slave_$i.kml";
    }

    try {
      await client.execute(query);
    } catch (e) {
      print(e);
    }
  }

  Future<void> shutdown() async {
    final user = ssHcredsStorage.getvalue('username');
    final pw = ssHcredsStorage.getvalue('password');
    final ipaddress = ssHcredsStorage.getvalue('ip');
    final prt = ssHcredsStorage.getvalue('port');
    final screenAmount = int.parse(ssHcredsStorage.getvalue('screenamount'));

    final client = SSHClient(
      await SSHSocket.connect(ipaddress, int.parse(prt)),
      username: user,
      onPasswordRequest: () => pw,
    );

    for (var i = screenAmount; i >= 1; i--) {
      try {
        await client.execute('sshpass -p $pw ssh -t lg$i "echo $pw | sudo -S poweroff"');
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    }
  }

  Future<void> reboot() async {
    final user = ssHcredsStorage.getvalue('username');
    final pw = ssHcredsStorage.getvalue('password');
    final ipaddress = ssHcredsStorage.getvalue('ip');
    final prt = ssHcredsStorage.getvalue('port');
    final screenAmount = int.parse(ssHcredsStorage.getvalue('screenamount'));

    final client = SSHClient(
      await SSHSocket.connect(ipaddress, int.parse(prt)),
      username: user,
      onPasswordRequest: () => pw,
    );
    for (var i = screenAmount; i >= 1; i--) {
      try {
        await client.execute('sshpass -p $pw ssh -t lg$i "echo $pw | sudo -S reboot"');
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    }
  }
}
