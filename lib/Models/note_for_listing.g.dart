// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_for_listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteForListing _$NoteForListingFromJson(Map<String, dynamic> json) {
  return NoteForListing(
    noteID: json['noteID'],
    noteTitle: json['noteTitle'],
    createDateTime: json['createDateTime'],
    latestEditedDateTime: json['latestEditedDateTime'],
  );
}

Map<String, dynamic> _$NoteForListingToJson(NoteForListing instance) =>
    <String, dynamic>{
      'noteID': instance.noteID,
      'noteTitle': instance.noteTitle,
      'createDateTime': instance.createDateTime,
      'latestEditedDateTime': instance.latestEditedDateTime,
    };
