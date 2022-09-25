import 'dart:convert';

import 'package:api_practice/Models/note.dart';
import 'package:api_practice/Models/note_insert.dart';
import '../Models/note_for_listing.dart';
import '../Models/api_response.dart';

import 'package:http/http.dart' as http;

class NotesService {
  static const API = "https://tq-notes-api-jkrgrdggbq-el.a.run.app/";
  static const headers = {
    'apiKey': "7bf83416-6947-4285-bb18-df3f3a7a07bc",
    'Content-Type': 'application/json',
  };

  Future<APIResponse<List<NoteForListing>>> getNoteList() {
    return http.get(API + "/notes", headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData) {
          notes.add(NoteForListing.fromJson(item));
        }
        return APIResponse<List<NoteForListing>>(data: notes);
      }
      return APIResponse<List<NoteForListing>>(error: true, errorMessage: "An error occured");
    }).catchError((_) => APIResponse<List<NoteForListing>>(error: true, errorMessage: "An error occured"));
  }

  Future<APIResponse<Note>> getNote(String noteID) {
    return http.get(API + "/notes/" + noteID, headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);

        return APIResponse<Note>(data: Note.fromJson(jsonData));
      }
      return APIResponse<Note>(error: true, errorMessage: "An error occured");
    }).catchError((_) => APIResponse<Note>(error: true, errorMessage: "An error occured"));
  }

  Future<APIResponse<bool>> createNote(NoteInsert item) {
    return http.post(API + "/notes", headers: headers, body: json.encode(item.toJson())).then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: "An error occured");
    }).catchError((_) => APIResponse<bool>(error: true, errorMessage: "An error occured"));
  }

  Future<APIResponse<bool>> updateNote(String noteID, NoteInsert item) {
    return http.put(API + "/notes/" + noteID, headers: headers, body: json.encode(item.toJson())).then((data) {
      if (data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: "An error occured");
    }).catchError((_) => APIResponse<bool>(error: true, errorMessage: "An error occured"));
  }

  Future<APIResponse<bool>> deleteNote(String noteID) {
    return http.delete(API + "/notes/" + noteID, headers: headers).then((data) {
      if (data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: "An error occured");
    }).catchError((_) => APIResponse<bool>(error: true, errorMessage: "An error occured"));
  }
}
