import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './Backend/Loginauthenticate.dart'; 
import 'createacc.dart';
import 'mailview.dart';

class Login extends StatelessWidget {
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    final email = usernameController.text;
    final password = passwordController.text;

    final isAuthenticated = await LoginAuthenticate.smtpExample(email, password);

    if (isAuthenticated) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SplitView(from: "", to: "", date: "", content: "", subject: ""),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Authentication failed. Please check your email and password and try again.'),
            actions: [
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
      print('Login error: Authentication failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          constraints: BoxConstraints(maxWidth: 700, maxHeight: 700),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 500,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Login to IITK",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "     Email:",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 600,
                        child: TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your IITK email here',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "     Password:",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 600,
                        child: TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Password',
                          ),
                          obscureText: true,
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 200,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              margin: EdgeInsets.all(20),
                              color: Color.fromARGB(255, 50, 123, 232),
                              child: Center(
                                child: Text(
                                  "Sign In",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w800,
                                      color: Color.fromARGB(255, 240, 239, 239),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () => _login(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}