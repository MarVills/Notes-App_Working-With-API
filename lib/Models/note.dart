import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@JsonSerializable()
class Note {
  final noteID;
  final noteTitle;
  final noteContent;
  final createDateTime;
  final latestEditedDateTime;

  Note({
    this.noteID,
    this.noteTitle,
    this.noteContent,
    this.createDateTime,
    this.latestEditedDateTime,
  });

  factory Note.fromJson(Map<String, dynamic> item) => _$NoteFromJson(item);
}
