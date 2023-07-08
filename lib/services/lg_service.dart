import 'package:dartssh2/dartssh2.dart';
import 'package:get_it/get_it.dart';
import 'package:liquidgalaxybasic/services/ssh_creds_storage_service.dart';

class LGservice {
  SSHcredsStorage get ssHcredsStorage => GetIt.I<SSHcredsStorage>();

  int screenAmount = 3;
  int get logoScreen {
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
      return 'error';
    }
  }

  Future<void> relaunch() async {
    final user = ssHcredsStorage.getvalue('username');
    final pw = ssHcredsStorage.getvalue('password');
    final ipaddress = ssHcredsStorage.getvalue('ip');
    final prt = ssHcredsStorage.getvalue('port');

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

  Future<void> shutdown() async {
    final user = ssHcredsStorage.getvalue('username');
    final pw = ssHcredsStorage.getvalue('password');
    final ipaddress = ssHcredsStorage.getvalue('ip');
    final prt = ssHcredsStorage.getvalue('port');

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
