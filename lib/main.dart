import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login.dart';
import "home.dart";
import "createacc.dart";
import "mailview.dart";
void main()=>runApp(MyApp());


class MyApp extends StatelessWidget{
      const MyApp ({super.key});

@override
Widget build(BuildContext context){
 
      return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        ),
          
          home: SafeArea(
            child: Scaffold(
              
                     body: LayoutBuilder(
             builder: (BuildContext context, BoxConstraints constraints) {
              
               return Row(
                 children: [
                 SafeArea(
            child: Container(
              // constraints: BoxConstraints(maxWidth: 50),
              
             // child: NavigationBar(),
            ),
          ),
                   Expanded(child: Container(
                     constraints: BoxConstraints(minWidth: 800,),
                    
                    child: HomePage())),
                 ],
               );
             }
                     ),
            ),
          ),
      );
}
}


