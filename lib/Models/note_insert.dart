class NoteInsert {
  final noteTitle;
  final noteContent;

  NoteInsert({
    required this.noteTitle,
    required this.noteContent,
  });
  Map<String, dynamic> toJson() {
    return {
      "noteTitle": noteTitle,
      "noteContent": noteContent,
    };
  }
}
