class HomePostsRequest {}

class HomeRequestFailure {}

class ClearApp {}

class SetHomePosts {
  final List<dynamic> features;
  final List<dynamic> region;
  SetHomePosts(this.features, this.region);
}

class SetFeatures {
  final List<dynamic> features;
  SetFeatures(this.features);
}

class SetRegion {
  final List<dynamic> region;
  SetRegion(this.region);
}

class SetCategories {
  final List<dynamic> categories;
  SetCategories(this.categories);
}
