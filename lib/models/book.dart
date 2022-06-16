class Book{
  
  String title;
  String author;
  bool read;

  Book({
    required this.title,
    required this.author,
    required this.read
  });

  Book copy() => Book(
    title: this.title,
    author: this.author,
    read: this.read
  );
}