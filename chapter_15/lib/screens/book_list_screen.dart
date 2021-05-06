import 'package:flutter/material.dart';
import '../models/book.dart';
import '../data/http_helper.dart';
import 'package:menubar/menubar.dart';

class BookListScreen extends StatefulWidget {
  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  List<Book> books = [];
  bool isLargeScreen;
  HttpHelper helper;
  List<Color> bgColors = [];
  @override
  void initState() {
    int i;
    addMenuBar();
    helper = HttpHelper();
    helper.getBooks('flutter').then((List<Book> value) {
      for (i = 0; i < value.length; i++) {
        bgColors.add(Colors.white);
      }
      setState(() {
        books = value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 600) {
      isLargeScreen = true;
    } else {
      isLargeScreen = false;
    }

    return Scaffold(
        appBar: AppBar(title: Text('Flutter Books')),
        body: GridView.count(
            childAspectRatio: isLargeScreen ? 8 : 5,
            crossAxisCount: isLargeScreen ? 2 : 1,
            children: List.generate(books.length, (index) {
              return GestureDetector(
                onTap: () => setColor(Colors.lightBlue, index),
                onSecondaryTap: () => setColor(Colors.white, index),
                onLongPress: () => setColor(Colors.white, index),
                child: Container(
                  color: bgColors.length > 0 ? bgColors[index] : Colors.white,
                  child: ListTile(
                    title: Text(books[index].title),
                    subtitle: Text(books[index].authors),
                    leading: CircleAvatar(
                      backgroundImage: (books[index].thumbnail) == ''
                          ? null
                          : NetworkImage(books[index].thumbnail),
                    ),
                  ),
                ),
              );
            })));
  }

  void addMenuBar() {
    setApplicationMenu([
      Submenu(label: 'Search Keys', children: [
        MenuItem(
            label: 'Flutter',
            enabled: true,
            onClicked: () => updateBooks('flutter')),
        MenuDivider(),
        MenuItem(
            label: 'C#', enabled: true, onClicked: () => updateBooks('c#')),
        MenuDivider(),
        MenuItem(
            label: 'JavaScript',
            enabled: true,
            onClicked: () => updateBooks('javascript')),
      ])
    ]);
  }

  void setColor(Color color, int index) {
    setState(() {
      bgColors[index] = color;
    });
  }

  updateBooks(String key) {
    helper.getBooks(key).then((List<Book> value) {
      setState(() {
        books = value;
      });
    });
  }
}
