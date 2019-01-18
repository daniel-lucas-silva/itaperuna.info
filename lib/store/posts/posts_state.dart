import 'dart:convert';

class PostsState {
  final bool isLoading;
  final bool end;
  final String nextToken;
  final List<dynamic> items;

  PostsState({
    this.isLoading = false,
    this.end = false,
    this.nextToken,
    this.items,
  });

  PostsState copyWith({
    bool isLoading,
    bool end,
    String nextToken,
    List<dynamic> items,
  }) {
    return new PostsState(
      isLoading: isLoading ?? this.isLoading,
      end: end ?? this.end,
      nextToken: nextToken ?? this.nextToken,
      items: items ?? this.items,
    );
  }

  static PostsState fromJSON(Map<String, dynamic> json) {
    return json == null
        ? PostsState()
        : PostsState(
            isLoading: json['isLoading'],
            end: json['end'],
            nextToken: json['nextToken'],
            items: json['items'],
          );
  }

  dynamic toJSON() => <String, dynamic>{
        'isLoading': this.isLoading,
        'end': this.end,
        'nextToken': this.nextToken,
        'items': this.items,
      };
}
