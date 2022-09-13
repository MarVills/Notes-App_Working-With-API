import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {
  final noteID;
  bool get isEditing => noteID != null;
  const NoteModify({Key? key, this.noteID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Create note" : "Edit Note"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Note title',
              ),
            ),
            Container(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Note content',
              ),
            ),
            Container(height: 16),
            SizedBox(
              width: double.infinity,
              height: 35,
              child: ElevatedButton(
                onPressed: () {
                  if (isEditing) {
                    // Update note in API
                  } else {
                    // Create Note in API
                  }
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
