import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "Todo app with Re-Ordeable Lists & Swipe Cards",
      home: App(),
    ));

List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4"];
bool toggle = false;

class _strikeThrough extends StatelessWidget {
  bool todoTogle;
  String todoText;

  _strikeThrough({this.todoTogle, this.todoText}) : super();

  Widget _strikeWidget() {
    if (todoTogle == false) {
      return Text(
        todoText,
        style: TextStyle(fontSize: 22.0),
      );
    } // endif
    else {
      return Text(
        todoText,
        style: TextStyle(
            fontSize: 22.0,
            decoration: TextDecoration.lineThrough,
            color: Colors.redAccent,
            fontStyle: FontStyle.italic),
      );
    } //end else
  } // end _strikeWidget

  @override
  Widget build(BuildContext context) {
    return _strikeWidget();
  }
} // end _strike

/*
class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Empty Half Baked App"),
      ),
      body: ReorderableListView(children: <Widget>[
        for (final value in items)
          Text(
            value,
            key: Key(value),
            style: TextStyle(fontSize: 22.0),
          )
      ], onReorder: (OldIndex, NewIndex) {}),
    );
  }
}
*/
class App extends StatefulWidget {
  @override
  AppState createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("No reorder"),
        ),
        body: ReorderableListView(
            children: <Widget>[
              for (final item in items)
                CheckboxListTile(
                  value: toggle,
                  onChanged: (bool) {
                    setState(() {
                      if (!bool) {
                        toggle = false;
                      } else {
                        toggle = true;
                      }
                    });
                  },
                  key: Key(item),
                  title: _strikeThrough(
                    todoText: item,
                    todoTogle: toggle,
                  ),
                )
            ],
            onReorder: (OldIndex, NewIndex) {
              setState(() {
                if (OldIndex < NewIndex) {
                  NewIndex -= 1;
                } // end if
                var getReplacedWidget = items.removeAt(OldIndex);
                items.insert(NewIndex, getReplacedWidget);
              });
            }));
  }
}
