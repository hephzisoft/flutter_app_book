class Books {
  final String? id;
  final String? title;
  final String? author;
  final List<String>? bookmarks;
  final String? bookImage;
  final String? contentUrl;

  Books({
    this.id,
    this.author,
    this.bookImage,
    this.bookmarks,
    this.contentUrl,
    this.title,
  });

  factory Books.fromJson(Map<String, dynamic> json) {
    return Books();
  }
}