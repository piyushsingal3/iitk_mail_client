import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
void main()=>runApp(MyApp());


class MyApp extends StatelessWidget{
      const MyApp ({super.key});

@override
Widget build(BuildContext context){
 
      return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
          
          home: Scaffold(
            
         body: Row(
           children: [
            SafeArea(
            child: NavigationRail(
              extended: false,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text('Favorites'),
                ),
              ],
              selectedIndex: 0,
              onDestinationSelected: (value) {
                print('selected: $value');
              },
            ),
          ),
             Expanded(
               
               
                 child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/iitk.jpeg"), fit: BoxFit.fill,opacity: 1,),
                  ),
                  child: Center(child: Login())
                  
               ),
                
             ),
           ],
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
        
        //clipBehavior: Clip.antiAliasWithSaveLayer,
       
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
               Container(
                  width:500,
                     child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("Login to IITK mail",style: GoogleFonts.poppins (textStyle:TextStyle(fontSize: 49,fontWeight: FontWeight.w900,))),
                            ),
                            //new Image.asset("images/iitkl.jpeg",width: 200,height: 200,),
                          ],
                        ),
                      ),
                    ),
                  
                 
                 Container(margin:EdgeInsets.all(10.0),
                   child: Row(
                    
                      mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Text("     Email:",style: GoogleFonts.poppins (textStyle:TextStyle(fontSize: 30,fontWeight: FontWeight.w700,))),
                       ],
                     ),
                 ),

                 Container(
                  height:70,
                  width: 600,
                   child:TextFormField(
                             decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter your IITK email here',
                            ),
                          ),
                 ),


                  Container(margin:EdgeInsets.all(10.0),
                   child: Row(
                    
                      mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Text("     Password:",style: GoogleFonts.poppins (textStyle:TextStyle(fontSize: 28,fontWeight: FontWeight.w700,))),
                       ],
                     ),
                 ),


                 Container(
                  height:70,
                  width: 600,
                   child: TextFormField(
                             decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Password',
                            ),
                          ),
                 ),


                 Container(
                  height:130,
                  width:400,
                  
                   child: Card(
                    shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(100.0),),
                         margin: EdgeInsets.all(20),
                         color: Color.fromARGB(255, 50, 123, 232),
                         child :Center(child: Text("Sign In",style: GoogleFonts.poppins (textStyle:TextStyle(fontSize: 28,fontWeight: FontWeight.w800,color:Color.fromARGB(255, 240, 239, 239))))),
                   ),
                 ),


                 Container(
                  height:130,
                  width:800,
                  
                   child: Row(
                    
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                        MouseRegion(
                           cursor: SystemMouseCursors.click,  
                         child: GestureDetector(
                           child: Card(
                            
                            shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(100.0),),
                                 margin: EdgeInsets.all(20),
                                 color: Color.fromARGB(255, 239, 241, 243),
                                 child :Center(child: Text("Create Account ",style: GoogleFonts.poppins (textStyle:TextStyle(fontSize: 25,fontWeight: FontWeight.w800,color:Colors.black)))),
                                  ),
                            onTap: () { 
                                 print("Click event on Container"); 
                             },
                         ),
                       ),


                        Card(
                        shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(100.0),),
                             margin: EdgeInsets.all(20),
                             color: Color.fromARGB(255, 239, 241, 243),
                             child :Center(child: Text("Forgot Password ",style: GoogleFonts.poppins (textStyle:TextStyle(fontSize: 25,fontWeight: FontWeight.w800,color:Colors.black)))),
                       ),
                     ],
                   ),
                 ),
                 
            ],
          ),
        )
      ),
    );
  }
}