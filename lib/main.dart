import 'dart:async';
import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  bool darkEnabled=false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.darkTheme,
      initialData: false,
          builder:(context,snapshot)=> MaterialApp(
        theme: snapshot.data?ThemeData.dark():ThemeData.light(),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Home"),
            ),
            body: Center(
              child: Text("Hello World"),
            ),
            drawer: Drawer(
              child: ListView(
                children:<Widget> [
                  ListTile(
                    title: Text("Dark Theme"),
                    trailing: Switch(
                      value: snapshot.data,
                      onChanged: bloc.changeTheme,
                    ),
                  ),
                ],
              ),
            ),
            ),
      ),
    );
  }
}

class Bloc{
  final _themecontroller = StreamController<bool>();
  get changeTheme=> _themecontroller.sink.add;
  get darkTheme=> _themecontroller.stream;

}

final bloc = Bloc();