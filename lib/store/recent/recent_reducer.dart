import 'package:redux/redux.dart';

import './recent_types.dart';
import './recent_state.dart';

Reducer<RecentState> recentReducer = combineReducers([
  new TypedReducer<RecentState, LoadingRecent>(loadingRecentReducer),
  new TypedReducer<RecentState, SetRecent>(setRecentReducer),
  new TypedReducer<RecentState, AddRecent>(addRecentReducer),
  new TypedReducer<RecentState, ClearRecent>(clearRecentReducer),
]);

RecentState loadingRecentReducer(RecentState recent, LoadingRecent action) {
  return recent.copyWith(
      isLoading: true
  );
}

RecentState setRecentReducer(RecentState recent, SetRecent action) {
  return recent.copyWith(
    isLoading: false,
    nextToken: action.nextToken,
    items: action.items
  );
}

RecentState addRecentReducer(RecentState recent, AddRecent action) {
  return recent.copyWith(
      isLoading: false,
      nextToken: action.nextToken,
      items: List.from(recent.items)..addAll(action.items)
  );
}

RecentState clearRecentReducer(RecentState recent, ClearRecent action) {
  return RecentState();
}
