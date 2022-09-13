// @dart=2.9
import 'package:api_practice/Services/notes_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'Services/notes_service.dart';
import 'Views/note_list.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => NotesService());
  // GetIt.instance<NotesService>();
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoteList(),
    );
  }
}
