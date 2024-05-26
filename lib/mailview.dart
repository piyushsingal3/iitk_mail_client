import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import 'package:google_fonts/google_fonts.dart';
import "main.dart";
import "createacc.dart";
import 'package:enough_mail/enough_mail.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
class FirstPage extends StatelessWidget {
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
        title:Row(
          
          children: [
            Icon(Icons.mail,size: 40,),
            Text(' Inbox.....',style: GoogleFonts.poppins (textStyle:TextStyle(fontSize: 30,fontWeight: FontWeight.w800,color:Colors.black))),
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
                       
                         Container(height: 10, color: Colors.white),
            Expanded(
              child: ListView(
                  children: <Widget>[
                    Container(height: 0.5, color: Colors.black),
                     ListTile(
                      
                leading: Icon(Icons.circle),
                title: Text('Pradyumna Deshmukh'),
                titleTextStyle:GoogleFonts.poppins(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black)) ,
                subtitle: Text("Hello Piyush How are you?"),
                subtitleTextStyle:GoogleFonts.poppins(textStyle:TextStyle(fontSize: 20,color:Colors.black)) , 
              ),
                   Container(height: 0.5, color: Colors.black),

                     ListTile(
                      
                leading: Icon(Icons.circle),
                title: Text('Programming Club,IITK'),
                titleTextStyle:GoogleFonts.poppins(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black)) ,
                subtitle: Text("Secretary Recruitment Tasks"),
                subtitleTextStyle:GoogleFonts.poppins(textStyle:TextStyle(fontSize: 20,color:Colors.black)) , 
              ),
                   Container(height: 0.5, color: Colors.black),
                     ListTile(
                      
                leading: Icon(Icons.circle),
                title: Text('President Students Gymkhana'),
                titleTextStyle:GoogleFonts.poppins(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black)) ,
                subtitle: Text("(Acting)President Students Gymkhana"),
                subtitleTextStyle:GoogleFonts.poppins(textStyle:TextStyle(fontSize: 20,color:Colors.black)) , 
              ),
                   Container(height: 0.5, color: Colors.black),
                   ListTile(
                      
                leading: Icon(Icons.circle),
                title: Text('Pradyumna Deshmukh'),
                titleTextStyle:GoogleFonts.poppins(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black)) ,
                subtitle: Text("Hello Piyush How are you?"),
                subtitleTextStyle:GoogleFonts.poppins(textStyle:TextStyle(fontSize: 20,color:Colors.black)) , 
              ),
                   Container(height: 0.5, color: Colors.black),

                     ListTile(
                      
                leading: Icon(Icons.circle),
                title: Text('Programming Club,IITK'),
                titleTextStyle:GoogleFonts.poppins(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black)) ,
                subtitle: Text("Secretary Recruitment Tasks"),
                subtitleTextStyle:GoogleFonts.poppins(textStyle:TextStyle(fontSize: 20,color:Colors.black)) , 
              ),
                   Container(height: 0.5, color: Colors.black),
                     ListTile(
                      
                leading: Icon(Icons.circle),
                title: Text('President Students Gymkhana'),
                titleTextStyle:GoogleFonts.poppins(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black)) ,
                subtitle: Text("(Acting)President Students Gymkhana"),
                subtitleTextStyle:GoogleFonts.poppins(textStyle:TextStyle(fontSize: 20,color:Colors.black)) , 
              ),
                   Container(height: 0.5, color: Colors.black),
                   ListTile(
                      
                leading: Icon(Icons.circle),
                title: Text('Pradyumna Deshmukh'),
                titleTextStyle:GoogleFonts.poppins(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black)) ,
                subtitle: Text("Hello Piyush How are you?"),
                subtitleTextStyle:GoogleFonts.poppins(textStyle:TextStyle(fontSize: 20,color:Colors.black)) , 
              ),
                   Container(height: 0.5, color: Colors.black),

                     ListTile(
                      
                leading: Icon(Icons.circle),
                title: Text('Programming Club,IITK'),
                titleTextStyle:GoogleFonts.poppins(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black)) ,
                subtitle: Text("Secretary Recruitment Tasks"),
                subtitleTextStyle:GoogleFonts.poppins(textStyle:TextStyle(fontSize: 20,color:Colors.black)) , 
              ),
                   Container(height: 0.5, color: Colors.black),
                     ListTile(
                      
                leading: Icon(Icons.circle),
                title: Text('President Students Gymkhana'),
                titleTextStyle:GoogleFonts.poppins(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black)) ,
                subtitle: Text("(Acting)President Students Gymkhana"),
                subtitleTextStyle:GoogleFonts.poppins(textStyle:TextStyle(fontSize: 20,color:Colors.black)) , 
              ),
                   Container(height: 0.5, color: Colors.black),
              
                  ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class SplitView extends StatelessWidget {
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
            child: mailexpand(),
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
class mailexpand extends StatelessWidget{
    const mailexpand ({super.key});

@override
Widget build(BuildContext context ){

  return Scaffold(
    appBar: AppBar(
      title:Text("Secretary Recruitment",style: GoogleFonts.poppins (textStyle:TextStyle(fontSize: 30,fontWeight: FontWeight.w800,color:Colors.black))),
       
    ),
    body:SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          
          children: [
             Container(height: 0.5, color: Colors.black),
            Row(
              children: [
                Container(child:Text("From:",style: GoogleFonts.poppins (textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black))),),
                 Container(child:Text("Programming Club,IITK",style: GoogleFonts.poppins (textStyle:TextStyle(fontSize: 20,color:Colors.black))),),
              ],
              
            ),
            Row(
              children: [
                Container(child:Text("To:",style: GoogleFonts.poppins (textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black))),),
                 Container(child:Text("  Piyush Singal",style: GoogleFonts.poppins (textStyle:TextStyle(fontSize: 20,color:Colors.black))),),
              ],
              
            ),
            Row(
              children: [
                Container(child:Text("Date:",style: GoogleFonts.poppins (textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black))),),
                 Container(child:Text("   Today 15:43",style: GoogleFonts.poppins (textStyle:TextStyle(fontSize: 20,color:Colors.black))),),
              ],
              
            ),
             Container(height: 0.5, color: Colors.black),
             SizedBox(child: Text("Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is a group of at least five sentences, a paragraph is half a page long, etc. In reality, though, the unity and coherence of ideas among sentences is what constitutes a paragraph. A paragraph is defined as “a group of sentences or a single sentence that forms a unit” (Lunsford and Connors 116). Length and appearance do not determine whether a section in a paper is a paragraph. For instance, in some styles of writing, particularly journalistic styles, a paragraph can be just one sentence long. Ultimately, a paragraph is a sentence or group of sentences that support one main idea. In this handout, we will refer to this as the “controlling idea,” because it controls what happens in the rest of the paragraph.",style: GoogleFonts.poppins (textStyle:TextStyle(fontSize: 15,color:Colors.black))))
        
          ],
        ),
      ),
    )
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
                         onDoubleTap: () {  Navigator.push(
                                     context,
                                       MaterialPageRoute(builder: (context) =>  mailexpand()),
                                        );
                                        tileColor:Colors.blue;}
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
                                       MaterialPageRoute(builder: (context) =>  Composemail()),
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

  class Composemail extends StatefulWidget {
  const Composemail({super.key});

  @override
  _ComposemailState createState() => _ComposemailState();
}

class _ComposemailState extends State<Composemail> {
  // final _fromController = TextEditingController();
  // final _toController = TextEditingController();
  // final _subjectController = TextEditingController();
  // final _bodyController = TextEditingController();

  // @override
  // void dispose() {
  //   _fromController.dispose();
  //   _toController.dispose();
  //   _subjectController.dispose();
  //   _bodyController.dispose();
  //   super.dispose();
  // }
 
String userName = 'psingal23@iitk.ac.in';
String password = 'password';
String smtpServerHost = 'smtp.cc.iitk.ac.in';
int smtpServerPort = 465;
bool isSmtpServerSecure = true;
  
 void send() async {
  print('Sending email...');
  await smtpExample();
}
  Future<void> smtpExample() async {
  final client = SmtpClient('enough.de', isLogEnabled: true);
  try {
    await client.connectToServer(smtpServerHost, smtpServerPort,isSecure: isSmtpServerSecure);
    await client.ehlo();
    if (client.serverInfo.supportsAuth(AuthMechanism.plain)) {
      await client.authenticate('psingal23@iitk.ac.in', 'password', AuthMechanism.plain);
    } else if (client.serverInfo.supportsAuth(AuthMechanism.login)) {
      await client.authenticate('psingal23@iitk.ac.in', 'password', AuthMechanism.login);
    } else {
      return;
    }
    final builder = MessageBuilder.prepareMultipartAlternativeMessage(
      plainText: 'hello pradyumna this is mail send by piyush from flutter.',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compose Mail",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    color: Colors.black))),
      ),
      body: SingleChildScrollView(
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
                   // controller: _fromController,
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
                    //controller: _toController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Receiver mail',
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
                   // controller: _subjectController,
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
                //controller: _bodyController,
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
  await smtpExample();
},
            child: Text('Press Me'),
          ),
          ],
        ),
      ),
    );
  }
}