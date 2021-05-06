import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class DismissibleScreen extends StatefulWidget {
  @override
  _DismissibleScreenState createState() => _DismissibleScreenState();
}

class _DismissibleScreenState extends State<DismissibleScreen> {
  final List<String> sweets = [
    'Petit Four',
    'Cupcake',
    'Donut',
    'Éclair',
    'Froyo',
    'Gingerbread ',
    'Honeycomb ',
    'Ice Cream Sandwich',
    'Jelly Bean',
    'KitKat'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dismissible Example'),
        ),
        body: ListView.builder(
            itemCount: sweets.length,
            itemBuilder: (context, index) {
              return OpenContainer(
                transitionDuration: Duration(seconds: 3),
                transitionType: ContainerTransitionType.fade,
                openBuilder: (context, closeContainer) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text(sweets[index]),
                    ),
                    body: Center(
                      child: Column(
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            child: Icon(
                              Icons.cake,
                              size: 200,
                              color: Colors.orange,
                            ),
                          ),
                          Text(sweets[index])
                        ],
                      ),
                    ),
                  );
                },
                closedBuilder: (context, openContainer) {
                  return Dismissible(
                    key: Key(sweets[index]),
                    child: ListTile(
                      title: Text(sweets[index]),
                      trailing: Icon(Icons.cake),
                      onTap: () {
                        openContainer();
                      },
                    ),
                    onDismissed: (direction) {
                      sweets.removeAt(index);
                    },
                  );
                },
              );
            }));
  }
}
