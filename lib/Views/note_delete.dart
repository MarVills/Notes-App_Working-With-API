import 'package:flutter/material.dart';

class NoteDelete extends StatelessWidget {
  const NoteDelete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Warning"),
      content: Text("Are you sure you want to delete this note?"),
      actions: [
        TextButton(
          child: Text("Yes"),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        TextButton(
          child: Text("No"),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        )
      ],
    );
  }
}
