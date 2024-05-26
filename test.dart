import 'dart:io';
import 'package:enough_mail/enough_mail.dart';
String userName = 'psingal23@iitk.ac.in';
String password = 'Nehaliza.123';
String smtpServerHost = 'smtp.cc.iitk.ac.in';
int smtpServerPort = 465;
bool isSmtpServerSecure = true;
void main() async {

  await smtpExample();

 
}
Future<void> smtpExample() async {
  final client = SmtpClient('enough.de', isLogEnabled: true);
  try {
    await client.connectToServer(smtpServerHost, smtpServerPort,
        isSecure: isSmtpServerSecure);
    await client.ehlo();
    if (client.serverInfo.supportsAuth(AuthMechanism.plain)) {
      await client.authenticate('psingal23@iitk.ac.in', 'Nehaliza.123', AuthMechanism.plain);
    } else if (client.serverInfo.supportsAuth(AuthMechanism.login)) {
      await client.authenticate('psingal23@iitk.ac.in', 'Nehaliza.123', AuthMechanism.login);
    } else {
      return;
    }
    final builder = MessageBuilder.prepareMultipartAlternativeMessage(
      plainText: 'hello pradyumna this is mail send by piyush.',
      htmlText: '<p>hello <b>world</b></p>',
    )
      ..from = [MailAddress('My name', 'psingal23@iitk.ac.in')]
      ..to = [MailAddress('Your name', 'pdeshmukh23@iitk.ac.in')]
      ..subject = 'My first message';
    final mimeMessage = builder.buildMimeMessage();
    final sendResponse = await client.sendMessage(mimeMessage);
    print('message sent: ${sendResponse.isOkStatus}');
  } on SmtpException catch (e) {
    print('SMTP failed with $e');
  }
}