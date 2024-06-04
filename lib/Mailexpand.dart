import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import "main.dart";
import "createacc.dart";
import 'package:enough_mail/enough_mail.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'composemail.dart';

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