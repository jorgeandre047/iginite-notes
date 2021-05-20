import 'package:flutter/material.dart';
import 'package:notes/pages/create_note_page.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>[
    'Primeiro item',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: ListView(
          children: [
            for (var i = 0; i < notes.length; i++)
              Card(
                child: ListTile(
                  title: Text('${notes[i]}'),
                  onTap: () async {
                    var response = await Navigator.pushNamed(
                        context, '/create-note',
                        arguments: notes[i]);
                    if (response != null) {
                      var description = response as String;
                      if (response.isEmpty) {
                        notes.removeAt(i);
                      } else {
                        notes[i] = description;
                      }
                      setState(() {});
                    }
                  },
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onPressed: () async {
          var description = await Navigator.pushNamed(
            context,
            '/create-note',
          );
          if (description != null) {
            notes.add(description as String);
            setState(() {});
          }
        },
      ),
    );
  }
}
