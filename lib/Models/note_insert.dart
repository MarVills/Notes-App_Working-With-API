import 'package:json_annotation/json_annotation.dart';

part 'note_insert.g.dart';

@JsonSerializable()
class NoteInsert {
  final noteTitle;
  final noteContent;

  NoteInsert({
    required this.noteTitle,
    required this.noteContent,
  });
  Map<String, dynamic> toJson() => _$NoteInsertToJson(this);
}
