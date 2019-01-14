import 'package:redux/redux.dart';

import './post_state.dart';
import './post_types.dart';

Reducer<PostState> postReducer = combineReducers([
  TypedReducer<PostState, PostRequest>(postRequestReducer),
  TypedReducer<PostState, SetPosts>(setPostsReducer),
]);

PostState postRequestReducer(PostState post, PostRequest action) {
  return post.copyWith(isLoading: true);
}

PostState setPostsReducer(PostState post, SetPosts action) {
  return post.copyWith(
    isLoading: false,
    items: action.items,
    token: action.token,
  );
}
