class LoadingPosts {}

class ClearPosts {}

class EndPosts {}

class SetPosts {
  final String nextToken;
  final List<dynamic> items;
  SetPosts(this.nextToken, this.items);
}

class AddPosts {
  final String nextToken;
  final List<dynamic> items;
  AddPosts(this.nextToken, this.items);
}
