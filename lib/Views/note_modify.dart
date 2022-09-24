import 'package:api_practice/Models/note.dart';
import 'package:api_practice/Models/note_insert.dart';
import 'package:api_practice/Services/notes_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class NoteModify extends StatefulWidget {
  final noteID;

  const NoteModify({Key? key, this.noteID}) : super(key: key);
  @override
  _NoteModifyState createState() => _NoteModifyState();
}

class _NoteModifyState extends State<NoteModify> {
  bool get isEditing => widget.noteID != null;

  NotesService get notesServcie => GetIt.I<NotesService>();

  String errorMessage = "";
  Note? note;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (isEditing) {
      setState(() {
        _isLoading = true;
      });
      notesServcie.getNote(widget.noteID).then((response) {
        setState(() {
          _isLoading = false;
        });
        if (response.error) {
          errorMessage = response.errorMessage ?? 'An error occured';
        }
        note = response.data;
        _titleController.text = note!.noteTitle;
        _contentController.text = note!.noteContent;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Create note" : "Edit Note"),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      hintText: 'Note title',
                    ),
                  ),
                  Container(height: 8),
                  TextField(
                    controller: _contentController,
                    decoration: InputDecoration(
                      hintText: 'Note content',
                    ),
                  ),
                  Container(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (isEditing) {
                          // Update note in API
                          setState(() {
                            _isLoading = true;
                          });
                          final note = NoteInsert(
                            noteTitle: _titleController.text,
                            noteContent: _contentController.text,
                          );
                          final result = await notesServcie.updateNote(widget.noteID, note);
                          setState(() {
                            _isLoading = false;
                          });
                          final String title = 'Done';
                          final String content = result.error ? (result.errorMessage ?? "An error occured") : "Your note was updated";
                          showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: Text(title),
                                  content: Text(content),
                                  actions: [
                                    TextButton(
                                      child: Text("Ok"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              }).then((data) {
                            if (result.data) {
                              Navigator.pop(context);
                            }
                          });
                        } else {
                          // Create Note in API
                          setState(() {
                            _isLoading = true;
                          });
                          final note = NoteInsert(
                            noteTitle: _titleController.text,
                            noteContent: _contentController.text,
                          );
                          final result = await notesServcie.createNote(note);
                          setState(() {
                            _isLoading = false;
                          });
                          final String title = 'Done';
                          final String content = result.error ? (result.errorMessage ?? "An error occured") : "Your note was created";
                          showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: Text(title),
                                  content: Text(content),
                                  actions: [
                                    TextButton(
                                      child: Text("Ok"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              }).then((data) {
                            if (result.data) {
                              Navigator.pop(context);
                            }
                          });
                        }
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
