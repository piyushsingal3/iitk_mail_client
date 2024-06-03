import 'package:enough_mail/enough_mail.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoginAuthenticate {
  static Future<bool> smtpExample(String email, String password) async {
    await dotenv.load(fileName: "lib/.env");

    final client = SmtpClient('enough.de', isLogEnabled: true);

    String smtpServerHost = 'smtp.cc.iitk.ac.in';
    int smtpServerPort = 465;
    bool isSmtpServerSecure = true;

    try {
      await client.connectToServer(smtpServerHost, smtpServerPort, isSecure: isSmtpServerSecure);
      await client.ehlo();
      if (client.serverInfo.supportsAuth(AuthMechanism.plain)) {
        await client.authenticate(email, password, AuthMechanism.plain);
      } else if (client.serverInfo.supportsAuth(AuthMechanism.login)) {
        await client.authenticate(email, password, AuthMechanism.login);
      } else {
        return false;
      }
      return true;
    } catch (e) {
      print('SMTP Authentication Error: $e');
      return false;
    }
  }
}