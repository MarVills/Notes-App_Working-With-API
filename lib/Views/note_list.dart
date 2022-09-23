import 'package:api_practice/Models/api_response.dart';
import 'package:api_practice/Models/note_for_listing.dart';
import 'package:get_it/get_it.dart';
import '../Services/notes_service.dart';
import '../Views/note_delete.dart';
import 'package:flutter/material.dart';

import 'note_modify.dart';

class NoteList extends StatefulWidget {
  NoteList({Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  NotesService get service => GetIt.I<NotesService>();
  APIResponse<List<NoteForListing>>? _apiResponse;
  bool _isLoading = false;

  String formatDateTime(DateTime dateTime) {
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }

  @override
  void initState() {
    // notes = service.getNoteList();
    _fetchNotes();
    super.initState();
  }

  _fetchNotes() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getNoteList();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Notes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => NoteModify(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Builder(
        builder: (_) {
          if (_isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (_apiResponse!.error) {
            return Center(child: Text("_apiResponse.errorMessage"));
          }
          return ListView.separated(
            itemBuilder: (_, index) {
              return Dismissible(
                key: ValueKey(_apiResponse!.data[index].noteID),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {},
                confirmDismiss: (derection) async {
                  final result = await showDialog(context: context, builder: (_) => NoteDelete());
                  print(result);
                  return result;
                },
                background: Container(
                  color: Colors.red,
                  padding: EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
                child: ListTile(
                  title: Text(
                    _apiResponse!.data[index].noteTitle,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  subtitle: Text(
                    "Last edited on ${formatDateTime(_apiResponse!.data[index].latestEditedDateTime ?? _apiResponse!.data[index].createDateTime)}",
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => NoteModify(
                          noteID: _apiResponse!.data[index].noteID,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: _apiResponse!.data.length,
          );
        },
      ),
    );
  }
}
