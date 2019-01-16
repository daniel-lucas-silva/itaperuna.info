import 'dart:convert';

class AppState {
  final bool isLoading;
  final List<dynamic> features;
  final List<dynamic> region;
  final List<dynamic> categories;

  AppState({
    this.isLoading = false,
    this.features,
    this.region,
    this.categories,
  });

  AppState copyWith({
    bool isLoading,
    List<dynamic> features,
    List<dynamic> region,
    List<dynamic> categories,
  }) {
    return new AppState(
      isLoading: isLoading ?? this.isLoading,
      features: features ?? this.features,
      region: region ?? this.region,
      categories: categories ?? this.categories,
    );
  }

  static AppState fromJSON(Map<String, dynamic> json) {
    return json == null
        ? AppState()
        : AppState(
            isLoading: json['isLoading'],
            features: json['features'],
            region: json['region'],
            categories: json['categories'],
          );
  }

  dynamic toJSON() => <String, dynamic>{
        'isLoading': this.isLoading,
        'features': this.features,
        'region': this.region,
        'categories': this.categories,
      };
}
