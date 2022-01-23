class Books {
  Books({
    required this.bookId,
    required this.uuid,
    required this.title,
    required this.description,
    required this.price,
    required this.bookCover,
    required this.author,
    required this.paid,
    required this.bookUrl,
    required this.deleted,
  });

  final int bookId;
  final dynamic uuid;
  final String title;
  final String description;
  final String price;
  final String bookCover;
  final String author;
  final String paid;
  final String bookUrl;
  final String deleted;

  factory Books.fromJson(Map<String, dynamic> json) => Books(
        bookId: json['book_id'],
        uuid: json['uuid'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        bookCover: json['book_cover'],
        author: json['author'],
        paid: json['paid'],
        bookUrl: json['book_url'],
        deleted: json['deleted'],
      );

  Map<String, dynamic> toJson() => {
        'bookId': bookId,
        'uuid': uuid,
        'title': title,
        'description': description,
        'price': price,
        'bookCover': bookCover,
        'author': author
      };
}
