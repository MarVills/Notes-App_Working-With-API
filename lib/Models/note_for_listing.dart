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

  factory NoteForListing.fromJson(Map<String, dynamic> item) {
    return NoteForListing(
      noteID: item["noteID"],
      noteTitle: item["noteTitle"],
      createDateTime: item["createDateTime"] != null ? DateTime.parse(item["createDateTime"]) : null,
      latestEditedDateTime: item["latestEditedDateTime"] != null ? DateTime.parse(item["latestEditedDateTime"]) : null,
    );
  }
}
