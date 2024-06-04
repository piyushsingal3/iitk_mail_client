import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './Backend/Sendemail.dart';

class ComposeMail extends StatefulWidget {
  const ComposeMail({super.key});

  @override
  _ComposeMailState createState() => _ComposeMailState();
}

class _ComposeMailState extends State<ComposeMail> {
  final _fromController = TextEditingController();
  final _toController = TextEditingController();
  final _subjectController = TextEditingController();
  final _bodyController = TextEditingController();

  String smtpServerHost = 'smtp.cc.iitk.ac.in';
  int smtpServerPort = 465;
  bool isSmtpServerSecure = true;

  void send() async {
    print('Sending email...');
    final emailSender = EmailSender(
      smtpServerHost: smtpServerHost,
      smtpServerPort: smtpServerPort,
      isSmtpServerSecure: isSmtpServerSecure,
      fromAddress: _fromController.text,
      toAddress: _toController.text,
      subject: _subjectController.text,
      body: _bodyController.text,
    );
    bool success = await emailSender.sendEmail();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(success ? 'Success' : 'Failure'),
          content: Text(success
              ? 'Email sent successfully!'
              : 'Failed to send email. Please try again.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compose Mail",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Colors.black))),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(width: 20, height: 5),
              Container(height: 0.5, color: Colors.black),
              SizedBox(width: 20, height: 5),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("From",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                                color: Colors.black))),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _fromController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Sender Mail',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 5, height: 5),
              Container(height: 0.5, color: Colors.black),
              SizedBox(width: 5, height: 5),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("To",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                                color: Colors.black))),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _toController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Receiver Mail',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 5, height: 5),
              Container(height: 0.5, color: Colors.black),
              SizedBox(width: 5, height: 5),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Subject",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                                color: Colors.black))),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _subjectController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Subject',
                      ),
                    ),
                  ),
                ],
              ),
              Container(height: 0.5, color: Colors.black),
              SizedBox(
                height: 300,
                child: TextFormField(
                  controller: _bodyController,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Compose your mail here',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  send();
                },
                child: Text('Send Mail'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}