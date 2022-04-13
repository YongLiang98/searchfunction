import 'package:filter_listview_example/data/book_data.dart';
import 'package:filter_listview_example/model/book.dart';
import 'package:filter_listview_example/page/filter_local_list_page.dart';
import 'package:filter_listview_example/page/filter_network_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

import 'package:filter_listview_example/data/book_data.dart';
import 'package:filter_listview_example/main.dart';
import 'package:filter_listview_example/model/book.dart';
import 'package:filter_listview_example/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:filter_listview_example/model/Lists.dart';

class FilterLocalListPage extends StatefulWidget {
  @override
  FilterLocalListPageState createState() => FilterLocalListPageState();
}

class FilterLocalListPageState extends State<FilterLocalListPage> {
  late List<Book> books;
  String query = '';

  @override
  void initState() {
    super.initState();

    books = allBooks;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  List<String> tutName = [
    "EE1000",
    "EE2000",
    "EE3000",
    "EE4000",
    "EE5000",
    "EE6001"
  ]; //implement database
  List<String> names1 = ["ken", "bob"];
  List<String> description = [
    "No tutor found for this mod",
    " Peter \n",
    " Parker \n",
    " Spid \n",
    " Tony \n",
    " Bruce \n",
    " Banner \n"
  ];
  List<String> description2 = [
    "error no description found 2",
    "Peter's description2",
    " Parker's description2",
    "Spid's description2 ",
    "EE4",
    "EE5",
    "EE6"
  ];
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(''),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: tutName.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  final name = tutName[index];

                  // return buildBook(book);
                  //
                  return ListTile(
                    leading: Image.network(
                      book.urlImage,
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                    title: Text(name),
                    // subtitle: Text(name),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookPage(book: book))),
                  );
                },
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Module Code',
        onChanged: searchBook,
      );

  Widget buildBook(Book book) => ListTile(
        leading: Image.network(
          book.urlImage,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(book.title),
        subtitle: Text(book.author),
      );

  void searchBook(String query) {
    final books = allBooks.where((book) {
      final titleLower = book.title.toLowerCase();
      final authorLower = book.author.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.books = books;
    });
  }
}
