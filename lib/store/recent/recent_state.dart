import 'dart:convert';

class RecentState {
  final bool isLoading;
  final String nextToken;
  final List<dynamic> items;

  RecentState({
    this.isLoading = false,
    this.nextToken,
    this.items,
  });

  RecentState copyWith({
    bool isLoading,
    String nextToken,
    List<dynamic> items,
  }) {
    return new RecentState(
      isLoading: isLoading ?? this.isLoading,
      nextToken: nextToken ?? this.nextToken,
      items: items ?? this.items,
    );
  }

  static RecentState fromJSON(Map<String, dynamic> json) {
    return json == null
        ? RecentState()
        : RecentState(
            isLoading: json['isLoading'],
            nextToken: json['nextToken'],
            items: json['items'],
          );
  }

  dynamic toJSON() => <String, dynamic>{
        'isLoading': this.isLoading,
        'nextToken': this.nextToken,
        'items': this.items,
      };
}
