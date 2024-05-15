import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
void main()=>runApp(MyApp());


class MyApp extends StatelessWidget{
      const MyApp ({super.key});

@override
Widget build(BuildContext context){
 
      return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
          
          home: Scaffold(
            
         body: Center(
           child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/iitk.jpeg"), fit: BoxFit.fill,opacity: 1,),
            ),
            child: Center(child: Login()
            ),
         ),



          ),

          ),

      );



      




}







}

class Login extends StatelessWidget {
  const Login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: 700,
      child: Card(
        //color: Colors.black,
          semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
       
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              
              Container(
                
                child: Column(
                  children: [
                    Container(
                     
                     
                      width:500,
                      child: Card(
                        color: Color.fromRGBO (26, 115, 232,1),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000.0),
                          ),
                        child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("Login with your IITK mail",style: GoogleFonts.luckiestGuy(textStyle:TextStyle(fontSize: 30,color: const Color.fromARGB(255, 10, 5, 5)))),
                            ),
                            //new Image.asset("images/iitkl.jpeg",width: 200,height: 200,),
                          ],
                        ),
                      )),
                    ),
                     
                  ],
                )),
            ],
          ),
        )
      ),
    );
  }
}