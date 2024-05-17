import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import "main.dart";
import "login.dart";

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     
    return Expanded(
      
      
        child: DecoratedBox(
         decoration: BoxDecoration(
           image: DecorationImage(
               image: AssetImage("images/iitk.jpeg"), fit: BoxFit.fill,opacity: 1,),
         ),
         child: Center(child: Login())
         
      ),
       
    );
  }
}
