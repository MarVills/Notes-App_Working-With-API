// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) {
  return Note(
    noteID: json['noteID'],
    noteTitle: json['noteTitle'],
    noteContent: json['noteContent'],
    createDateTime: json['createDateTime'],
    latestEditedDateTime: json['latestEditedDateTime'],
  );
}

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'noteID': instance.noteID,
      'noteTitle': instance.noteTitle,
      'noteContent': instance.noteContent,
      'createDateTime': instance.createDateTime,
      'latestEditedDateTime': instance.latestEditedDateTime,
    };
