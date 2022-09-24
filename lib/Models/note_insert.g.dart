// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_insert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteInsert _$NoteInsertFromJson(Map<String, dynamic> json) {
  return NoteInsert(
    noteTitle: json['noteTitle'],
    noteContent: json['noteContent'],
  );
}

Map<String, dynamic> _$NoteInsertToJson(NoteInsert instance) => <String, dynamic>{
      'noteTitle': instance.noteTitle,
      'noteContent': instance.noteContent,
    };
