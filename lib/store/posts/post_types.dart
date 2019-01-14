class PostRequest {}

class SetPosts {
  final String token;
  final List<dynamic> items;
  SetPosts(this.token, this.items);
}
