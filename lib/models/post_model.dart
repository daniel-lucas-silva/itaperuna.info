class PostModel {
  final String id;
  final Map<String, dynamic> author;
  final List images;
  final String published;
  final String title;
  final String content;

  PostModel(this.id, this.author, this.images, this.published, this.title,
      this.content);
}
