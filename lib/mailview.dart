
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import "main.dart";
import "createacc.dart";
import 'package:enough_mail/enough_mail.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final List<MimeMessage> emails = [];
  String selectedEmailFrom = '';
  String selectedEmailTo = '';
  String selectedEmailDate = '';
  String selectedEmailContent = '';
  String selectedEmailSubject='';

  @override
  void initState() {
    super.initState();
    _fetchEmails();
  }

  Future<void> _fetchEmails() async {
    final client = ImapClient(isLogEnabled: false);
    try {
      await client.connectToServer('qasid.iitk.ac.in', 993, isSecure: true);
      await client.login('psingal23',dotenv.env["PASSWORD"]! ); 
      await client.selectInbox();
      final fetchResult = await client.fetchRecentMessages(
          messageCount: 25, criteria: 'BODY.PEEK[]');
      setState(() {
        emails.addAll(fetchResult.messages);
      });
      await client.logout();
    } on ImapException catch (e) {
      print('IMAP failed with $e');
    }
  }
  void _viewEmailDetails(String from, String to, String date, String content,String subject) {
  final isMobile = MediaQuery.of(context).size.width < 600;
  if (isMobile) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => mailexpand(
          from: from,
          to: to,
          date: date,
          content: content,
          subject:subject,
        ),
      ),
    );
  } else {
    setState(() {
       SplitView(
          from: from,
          to: to,
          date: date,
          content: content,
          subject: subject,
        );  
      selectedEmailFrom = from;
      selectedEmailTo = to;
      selectedEmailDate = date;
      selectedEmailContent = content;
      selectedEmailSubject=subject;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    final ancestorScaffold = Scaffold.maybeOf(context);
    final hasDrawer = ancestorScaffold != null && ancestorScaffold.hasDrawer;
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Scaffold(
      appBar: AppBar(
        leading: hasDrawer
            ? IconButton(
                icon: Icon(Icons.menu),
                onPressed:
                    hasDrawer ? () => ancestorScaffold!.openDrawer() : null,
              )
            : null,
        title: Row(
          children: [
            Icon(Icons.mail, size: 40),
            Text(
              ' Inbox.....',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search',
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: emails.length,
                itemBuilder: (context, index) {
                  final email = emails[index];
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                           _viewEmailDetails(
                             email.from?.toString() ?? 'Unknown Sender',
                             email.to?.toString() ?? 'Unknown Recipient',
                             email.decodeDate()?.toString() ?? 'Unknown Date',
                             email.decodeTextPlainPart() ?? 'No Content',
                             email.decodeSubject()??'No subject'
                           );
                           },
                        leading: Icon(Icons.circle, size: 10, color: Colors.black), 
                        subtitle: Text(email.decodeSubject() ?? 'No Subject',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black))),
                        title: Text(email.from?.toString() ?? 'Unknown Sender',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black))),
                      ),
                      Divider(), 
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class SplitView extends StatelessWidget {
    final String from;
  final String to;
  final String date;
  final String content;
  final String subject;
    const SplitView({
    required this.from,
    required this.to,
    required this.date,
    required this.content,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const breakpoint = 600.0;
    if (screenWidth >= breakpoint) {
     
      return Row(
        children: [
          
          SizedBox(
            width: 240,
            child: AppMenu(),
          ),
         
          Container(width: 0.5, color: Colors.black),
          Expanded(
            child: FirstPage(),
          ),
            Container(width: 0.5, color: Colors.black),
           SizedBox(
            width: 600,
            child: mailexpand(  from:from,
          to: to,
          date: date,
          content: content, 
          subject: subject,),
          ),
        ],
      );
    } else {
      return Scaffold(
        body: FirstPage(),
        drawer: SizedBox(
          width: 240,
          child: Drawer(
            child: AppMenu(),
          ),
        ),
      );
    }
  }
}

class mailexpand extends StatelessWidget {
  final String from;
  final String to;
  final String date;
  final String content;
  final String subject;

  const mailexpand({
    required this.from,
    required this.to,
    required this.date,
    required this.content,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Email Details",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                children: [
                  Container(height: 0.5, color: Colors.black),
                Row(
                crossAxisAlignment: CrossAxisAlignment.start,  
                children: [
                  Text(
                    "From:",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),  
                  Expanded(
                    child: Text(
                      from,
                      softWrap: true,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
              fontSize: 13,
              color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
                Row(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  Text(
                    "To:",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),  // Add some spacing between "To:" and the email address
                  Expanded(
                    child: Text(
                      to,
                      softWrap: true,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
              fontSize: 13,
              color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,  // This ensures the alignment at the top
                children: [
                  Text(
                    "Subject:",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),  
                  Expanded(
                    child: Text(
                      subject,
                      softWrap: true,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
              fontSize: 13,
              color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "Date:",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          date,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(height: 0.5, color: Colors.black),
                  SizedBox(
                    child: Text(
                      content,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class AppMenu extends StatefulWidget {
  
  @override
  State<AppMenu> createState() => _AppMenuState();
}

class _AppMenuState extends State<AppMenu> {
  Color tileColor = Colors.white; 
  @override
  Widget build(BuildContext context) {
    return Container(
    
      child: Scaffold(
        appBar: AppBar(title: Text('Menu',style: GoogleFonts.poppins (textStyle:TextStyle(fontSize: 30,fontWeight: FontWeight.w800,color:Colors.black)))),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                // Note: use ListView.builder if there are many items
                children: <Widget>[
                   MouseRegion(
                     cursor: SystemMouseCursors.click,
                     child: GestureDetector(
                       child: ListTile(
                                  tileColor: tileColor,
                                 leading: Icon(Icons.inbox),
                                 title: Text('Inbox',style: GoogleFonts.poppins (textStyle:TextStyle(fontSize: 20,color:Colors.black))),
                        ),
                           onTap: () {
              setState(() {
                if(tileColor==Colors.white){
                  tileColor=Colors.blue;
                }
                else{tileColor=Colors.white;}
              });
            },
                        
                     ),
                   ),
                    ListTile(
              leading: Icon(Icons.send),
              title: Text('Sent',style: GoogleFonts.poppins (textStyle:TextStyle(fontSize: 20,color:Colors.black))),
                    ),
              
                    ListTile(
              leading: Icon(Icons.star),
              title: Text('Starred',style: GoogleFonts.poppins (textStyle:TextStyle(fontSize: 20,color:Colors.black))),
                    ),
                     Container(
                       child: MouseRegion(
                         cursor: SystemMouseCursors.click,
                         child: GestureDetector(
                           child: ListTile(
                                     leading: Icon(Icons.add),
                                     title: Text('Compose Mail',style: GoogleFonts.poppins (textStyle:TextStyle(fontSize: 20,color:Colors.black))),
                                           ),
                                             onTap: () {  Navigator.push(
                                     context,
                                       MaterialPageRoute(builder: (context) =>  ComposeMail()),
                                        );
                                  },
                         ),
                       ),
                     ),
                 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
    bool success = await smtpExample();
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

  Future<bool> smtpExample() async {
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
        plainText: _bodyController.text,
        htmlText: '<p>hello <b>world</b></p>',
      )
        ..from = [MailAddress(_fromController.text, 'psingal23@iitk.ac.in')]
        ..to = [MailAddress(_toController.text, _toController.text)]
        ..subject = _subjectController.text;

      final mimeMessage = builder.buildMimeMessage();
      final sendResponse = await client.sendMessage(mimeMessage);
      print('Message sent: ${sendResponse.isOkStatus}');
      return sendResponse.isOkStatus;
    } on SmtpException catch (e) {
      print('SMTP failed with $e');
      return false;
    }
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
