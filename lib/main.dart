import 'package:filter_listview_example/data/book_data.dart';
import 'package:filter_listview_example/model/Lists.dart';
import 'package:filter_listview_example/model/book.dart';
import 'package:filter_listview_example/page/filter_local_list_page.dart';
import 'package:filter_listview_example/page/filter_network_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:filter_listview_example/Searchbutton.dart';
//
// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   static final String title = 'Filter & Search ';
//   List<Book> books = allBooks;
//
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: title,
//         theme: ThemeData(primarySwatch: Colors.blue),
//         home: MainPage(),
//       );
// }
//
// class MainPage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   int index = 0;
//
//
//
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         // bottomNavigationBar: buildBottomBar(),
//         body: buildPages(),
//       );
//
//   Widget buildBottomBar() {
//     final style = TextStyle(color: Colors.white);
//
//     return BottomNavigationBar(
//       backgroundColor: Theme.of(context).primaryColor,
//       selectedItemColor: Colors.white,
//       unselectedItemColor: Colors.white70,
//       currentIndex: index,
//       items: [
//         BottomNavigationBarItem(
//           icon: Text('', style: style),
//           label: (''),
//         ),
//         BottomNavigationBarItem(
//           icon: Text('', style: style),
//           label: (''),
//         ),
//       ],
//       // onTap: (int index) => setState(() => this.index = index),
//     );
//   }
//
//   Widget buildPages() {
//     switch (index) {
//       case 0:
//         return FilterLocalListPage();
//       // case 1:
//       //   // return FilterNetworkListPage();
//       default:
//         return Container();
//     }
//   }
// }


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home()
    );
  }
}

class Home extends  StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  List<String> tutName = ["EE1000", "EE2000", "EE3000", "EE4000", "EE5000", "EE6001"];//implement database
  List<String> names1 = ["ken","bob"];
  List<String> description = ["No tutor found for this mod"," Peter \n",
    " Parker \n"," Spid \n"," Tony \n"," Bruce \n"," Banner \n"];
  List<String> description2 = ["error no description found 2","Peter's description2",
    " Parker's description2","Spid's description2 ","EE4","EE5","EE6"];
  final myController = TextEditingController();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Modules Listings"),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {

                  Navigator. push(
                    context,
                    MaterialPageRoute(builder: (context) => FilterLocalListPage() ),
                  );



              },
            )
          ],
          backgroundColor: Colors.greenAccent,
        ),

        body: Container(
            color: Colors.teal,
            padding: EdgeInsets.all(20),
            child: Column(
                children: [
                  //Column(
                  //  height: 50,
                  // ),

                  Container(
                    height:20,
                    padding: EdgeInsets.all(8),
                    child: TextField(
                      controller: myController,

                    ),
                  ),

                  Container(
                      height: 500,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.orangeAccent,
                            width: 10,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: tutName.map((names) {
                          return box(names, Colors.green);
                        }).toList(),

                      )
                  ),

                  Container(
                    height: 100,
                    child: ElevatedButton(
                      child: const Text(
                        'Add Listing',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {},  // ADD listing Nav
                      style: ElevatedButton.styleFrom(

                        fixedSize: const Size(100, 150),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),

                      ),
                    ),
                  )

                ]
            )


        )
    );

  }

  Widget box(String name, Color backgroundcolor) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 330,
      color: Colors.blueGrey,


      child:
      Column(
          children: [

            ElevatedButton(
                child:
                Text(name),

                onPressed: () {
                  // Navigator.push(
                  //  context,
                  // MaterialPageRoute(builder: (context) => const SecondRoute()),
                  //  );
                }
            ),
            const Text(''), // space
            const Text('Available to Teach :',
              style: TextStyle(
                fontSize: 20,
                color:Colors.white,
              ),
            ),


            Text(printText(name)),


          ]
      ),
    );
  }

  Widget box2(String name, Color backgroundcolor) {
    return Container(
        margin: EdgeInsets.all(10),
        width: 150,
        height: 50,
        color: backgroundcolor,

        child:
        Column(
            children: [

              const Text("Name : "),// space
              Text(name),
              const Text('Email :',
                style: TextStyle(
                  fontSize: 20,
                  color:Colors.white,
                ),
              ),
              //Text(printText(name)),


            ]
        )
    );
  }

  String printText (String name) {
    name=name;

    switch(name) {
      case 'EE1000':
        return description[1] + description[2];

      case 'EE2000':
        return description[2]+description[3];

      case 'EE3000':
        return description[5];

      case 'EE4000':
        return description[2]+description[5];

      case 'EE5000':
        return description[3];

      default:
        return description[0]; // If name not found in list display error message
    }
  }

  int desCheck (String name) {
    name=name;

    switch(name) {
      case 'Peter':
        return 1;

      case 'Parker':
        return 2;

      case 'Spid':
        return 3;

      default:
        return 0; // If name not found in list display error message
    }
  }
}

// class SecondRoute extends StatelessWidget {
//   const SecondRoute({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Widget titleSection = Container(
//       padding: const EdgeInsets.all(32),
//       child: Row(
//         children: [
//           Expanded(
//             /*1*/
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 /*2*/
//                 Container(
//                   padding: const EdgeInsets.only(bottom: 8),
//                   child: const Text(
//                     'Peter',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Text(
//                   'Year 4, Computer Science',
//                   style: TextStyle(
//                     color: Colors.grey[500],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           /*3*/
//           Icon(
//             Icons.star,
//             color: Colors.yellow[500],
//           ),
//           const Text('4.8'),
//         ],
//       ),
//     );
//
//     Color color = Theme.of(context).primaryColor;
//
//     Widget buttonSection = Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         _buildButtonColumn(color, Icons.call, 'Report'),
//
//         _buildButtonColumn(color, Icons.share, 'Share'),
//
//         _buildButtonColumn(color, Icons.star, 'Rate'),
//       ],
//     );
//
//
//     Widget textSection = const Padding(
//       padding: EdgeInsets.all(32),
//       child: Text(
//         'Year 4 in com sci NTU. I have a passion in teaching Coding please let me show you. '
//             'Help me to help me help you. '  // Tutor Listing Description
//         ,
//         softWrap: true,
//       ),
//     );
//
//     return MaterialApp(
//       title: 'Tutor Listing Page',
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.greenAccent,
//           title: const Text('Tutor Listing'),
//           automaticallyImplyLeading:true,
//           leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_outlined),
//             onPressed:() => Navigator.pop(context, false),
//           ),
//         ),
//         body: ListView(
//           children: [
//             Image.asset(
//               'images/tutor.jpg',
//               width: 600,
//               height: 240,
//               fit: BoxFit.cover,
//             ),
//             titleSection,
//             buttonSection,
//             textSection,
//             Container(
//               margin: EdgeInsets.all(25),
//               child: OutlineButton(
//                 child: Text("Chat me up", style: TextStyle(fontSize: 20.0),),
//                 highlightedBorderColor: Colors.red,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5)),
//                 onPressed: () {},  // input CHAT PAGE nav here
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Column _buildButtonColumn(Color color, IconData icon, String label) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(icon, color: color),
//         Container(
//           margin: const EdgeInsets.only(top: 8),
//           child: Text(
//             label,
//             style: TextStyle(
//               fontSize: 17,
//               fontWeight: FontWeight.w400,
//               color: color,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//
// }



// class CustomSearchDelegate extends SearchDelegate <FilterLocalListPageState> {
  // @override
  // List<Widget> buildActions(BuildContext context) {
  //   return [
  //     IconButton(
  //       icon: Icon(Icons.clear),
  //       onPressed: () {
  //         query = '';
  //       },
  //     ),
  //   ];
  // }
  //
  // @override
  // Widget buildLeading(BuildContext context) {
  //   return IconButton(
  //     icon: Icon(Icons.arrow_back),
  //     onPressed: () {
  //       close(context, );
  //     },
  //   );
  // }
  //
  // @override
  // Widget buildResults(BuildContext context) {
  //   return Container();
  // }
  //
  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   // This method is called everytime the search term changes.
  //   // If you want to add search suggestions as the user enters their search term, this is the place to do that.
  //   return Container();
  // }
// }
