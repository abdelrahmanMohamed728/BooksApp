class Book
{
  String id;
  String link;
  String name;
  String inst;
  Book({this.id,this.link,this.name,this.inst});
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      link: json['volumeInfo']['imageLinks']['smallThumbnail'],
      name: json['volumeInfo']['title'],
      inst: json['volumeInfo']['description']
    );
  }
}