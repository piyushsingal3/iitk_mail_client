import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import 'package:google_fonts/google_fonts.dart';
import "main.dart";
import "createacc.dart";
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
                  // Note: use ListView.builder if there are many items
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
            child: composemail(),
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
class composemail extends StatelessWidget{
    const composemail ({super.key});

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
        body: Expanded(
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
                                   MaterialPageRoute(builder: (context) =>  composemail()),
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
                 ListTile(
          leading: Icon(Icons.add),
          title: Text('Compose Mail',style: GoogleFonts.poppins (textStyle:TextStyle(fontSize: 20,color:Colors.black))),
                ),
             
            ],
          ),
        ),
      ),
    );
  }
}
