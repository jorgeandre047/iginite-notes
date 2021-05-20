import 'package:flutter/material.dart';
import 'package:notes/pages/create_note_page.dart';
import 'package:notes/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/create-note': (context) => CreateNotePage(),
      },
    );
  }
}
