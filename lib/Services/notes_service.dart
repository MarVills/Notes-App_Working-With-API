import 'dart:convert';

import '../Models/note_for_listing.dart';
import '../Models/api_response.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static const API = "https://tq-notes-api-jkrgrdggbq-el.a.run.app/";
  static const headers = {'apiKey': "7bf83416-6947-4285-bb18-df3f3a7a07bc"};

  Future<APIResponse<List<NoteForListing>>> getNoteList() {
    return http.get(API + "/notes", headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData) {
          final note = NoteForListing(
            noteID: item["noteID"],
            noteTitle: item["noteTitle"],
            createDateTime: item["createDateTime"] != null ? DateTime.parse(item["createDateTime"]) : null,
            latestEditedDateTime: item["latestEditedDateTime"] != null ? DateTime.parse(item["latestEditedDateTime"]) : null,
          );
          notes.add(note);
        }
        return APIResponse<List<NoteForListing>>(data: notes);
      }
      return APIResponse<List<NoteForListing>>(error: true, errorMessage: "An error occured");
    }).catchError((_) => APIResponse<List<NoteForListing>>(error: true, errorMessage: "An error occured"));
  }
}
