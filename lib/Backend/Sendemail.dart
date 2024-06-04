import 'package:enough_mail/enough_mail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EmailSender {
  final String smtpServerHost;
  final int smtpServerPort;
  final bool isSmtpServerSecure;
  final String fromAddress;
  final String toAddress;
  final String subject;
  final String body;

  EmailSender({
    required this.smtpServerHost,
    required this.smtpServerPort,
    required this.isSmtpServerSecure,
    required this.fromAddress,
    required this.toAddress,
    required this.subject,
    required this.body,
  });

  Future<bool> sendEmail() async {
    final client = SmtpClient('enough.de', isLogEnabled: true);
    try {
      await client.connectToServer(smtpServerHost, smtpServerPort, isSecure: isSmtpServerSecure);
      await client.ehlo();
      await dotenv.load(fileName: "lib/.env");
      if (client.serverInfo.supportsAuth(AuthMechanism.plain)) {
        await client.authenticate(dotenv.env["USERNAME"]!, dotenv.env["PASSWORD"]!, AuthMechanism.plain);
      } else if (client.serverInfo.supportsAuth(AuthMechanism.login)) {
        await client.authenticate(dotenv.env["USERNAME"]!, dotenv.env["PASSWORD"]!, AuthMechanism.login);
      } else {
        return false;
      }
      final builder = MessageBuilder.prepareMultipartAlternativeMessage(
        plainText: body,
        htmlText: '<p>hello <b>world</b></p>',
      )
        ..from = [MailAddress(fromAddress, fromAddress)]
        ..to = [MailAddress(toAddress, toAddress)]
        ..subject = subject;

      final mimeMessage = builder.buildMimeMessage();
      final sendResponse = await client.sendMessage(mimeMessage);
      print('Message sent: ${sendResponse.isOkStatus}');
      return sendResponse.isOkStatus;
    } on SmtpException catch (e) {
      print('SMTP failed with $e');
      return false;
    }
  }
}