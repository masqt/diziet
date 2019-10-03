import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'app/create_store.dart';
import 'app/state.dart';
import 'home/home_page_screen.dart' show HomePage;

void main() => runApp(MyApp(store: createStore()));

class MyApp extends StatefulWidget {
  final Store<AppState> store;

  MyApp({Key key, this.store}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyAppState(store: store);
}

class MyAppState extends State<MyApp> {
  final Store<AppState> store;

  MyAppState({this.store});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: HomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

