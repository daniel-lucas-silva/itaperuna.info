class LoadingRecent {}

class ClearRecent {}

class SetRecent {
  final String nextToken;
  final List<dynamic> items;
  SetRecent(this.nextToken, this.items);
}

class AddRecent {
  final String nextToken;
  final List<dynamic> items;
  AddRecent(this.nextToken, this.items);
}
