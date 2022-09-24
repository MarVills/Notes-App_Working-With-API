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

  factory Note.fromJson(Map<String, dynamic> item) {
    return Note(
      noteID: item["noteID"],
      noteTitle: item["noteTitle"],
      noteContent: item["noteContent"],
      createDateTime: item["createDateTime"] != null ? DateTime.parse(item["createDateTime"]) : null,
      latestEditedDateTime: item["latestEditedDateTime"] != null ? DateTime.parse(item["latestEditedDateTime"]) : null,
    );
  }
}
