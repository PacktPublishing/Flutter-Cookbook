class Book {
  String id;
  String title;
  String authors;
  String thumbnail;
  String description;

  Book(this.id, this.title, this.authors, this.thumbnail, this.description);

  factory Book.fromJson(Map<String, dynamic> parsedJson) {
    final String id = parsedJson['id'];
    final String title = parsedJson['volumeInfo']['title'];
    String image = parsedJson['volumeInfo']['imageLinks'] == null
        ? ''
        : parsedJson['volumeInfo']['imageLinks']['thumbnail'];
    image.replaceAll('http://', 'https://');
    final String authors = (parsedJson['volumeInfo']['authors'] == null) ? '' : parsedJson['volumeInfo']['authors'].toString();
    final String description = (parsedJson['volumeInfo']['description'] == null)
        ? ''
        : parsedJson['volumeInfo']['description'];
    return Book(id, title, authors, image, description);
  }
}
