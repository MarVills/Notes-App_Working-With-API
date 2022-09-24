import 'package:json_annotation/json_annotation.dart';

part 'note_for_listing.g.dart';

@JsonSerializable()
class NoteForListing {
  final noteID;
  final noteTitle;
  final createDateTime;
  final latestEditedDateTime;

  NoteForListing({
    this.noteID,
    this.noteTitle,
    this.createDateTime,
    this.latestEditedDateTime,
  });

  factory NoteForListing.fromJson(Map<String, dynamic> item) => _$NoteForListingFromJson(item);
}
