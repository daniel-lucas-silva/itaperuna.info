import 'package:redux/redux.dart';

import './app_types.dart';
import './app_state.dart';

Reducer<AppState> appReducer = combineReducers([
  new TypedReducer<AppState, HomePostsRequest>(homePostsRequestReducer),
  new TypedReducer<AppState, HomeRequestFailure>(
      homeRequestFailureReducer),
  new TypedReducer<AppState, SetHomePosts>(setHomePostsReducer),
  new TypedReducer<AppState, ClearApp>(clearAppReducer),
  new TypedReducer<AppState, SetCategories>(setCategoriesReducer),
  new TypedReducer<AppState, SetFeatures>(setFeaturesReducer),
  new TypedReducer<AppState, SetRegion>(setRegionReducer),
]);

AppState homePostsRequestReducer(AppState app, HomePostsRequest action) {
  return app.copyWith(
    isLoading: true,
  );
}

AppState homeRequestFailureReducer(
    AppState app, HomeRequestFailure action) {
  return app.copyWith(
    isLoading: false,
    features: null,
    region: null,
  );
}

AppState setHomePostsReducer(AppState app, SetHomePosts action) {
  return app.copyWith(
    isLoading: false,
    features: action.features,
    region: action.region,
  );
}

AppState setFeaturesReducer(AppState app, SetFeatures action) {
  return app.copyWith(
    features: action.features,
  );
}

AppState setRegionReducer(AppState app, SetRegion action) {
  return app.copyWith(
    region: action.region,
  );
}

AppState setCategoriesReducer(AppState app, SetCategories action) {
  return app.copyWith(
    isLoading: false,
    categories: action.categories,
  );
}

AppState clearAppReducer(AppState app, ClearApp action) {
  return AppState();
}
