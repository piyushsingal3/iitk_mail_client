import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import "main.dart";
import "createacc.dart";
import "mailview.dart";

class Login extends StatelessWidget {
  const Login({
    super.key,
    
  });

  @override
  Widget build(BuildContext context) {
   
    
    return SafeArea(
      child: Container(
        constraints: BoxConstraints(maxWidth: 700,maxHeight: 700),
        child: LayoutBuilder(
          builder: (context,constraints) {
              
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
                        width:500,
                           child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text("Login to IITK",style: GoogleFonts.poppins (textStyle:TextStyle(fontSize: 30,fontWeight: FontWeight.w900,))),
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
                        height:100,
                        width:200,
                        
                         child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                           child: GestureDetector(
                             child: Card(
                              shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(100.0),),
                                   margin: EdgeInsets.all(20),
                                   color: Color.fromARGB(255, 50, 123, 232),
                                   child :Center(child: Text("Sign In",style: GoogleFonts.poppins (textStyle:TextStyle(fontSize: 28,fontWeight: FontWeight.w800,color:Color.fromARGB(255, 240, 239, 239))))),
                             ),
                              onTap: () {  Navigator.push(
                                 context,
                                   MaterialPageRoute(builder: (context) =>  SplitView()),
                                    );
                              },
                           ),
                         ),
                       ),
                  
                  
                       Container(
                        
                        
                         child: Column(
                          mainAxisSize: MainAxisSize.min,
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
                                  onTap: () {  Navigator.push(
                                 context,
                                   MaterialPageRoute(builder: (context) => const CreateAccount()),
                                    );
                                       
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
            );
          }
        ),
      ),
    );
  }
}