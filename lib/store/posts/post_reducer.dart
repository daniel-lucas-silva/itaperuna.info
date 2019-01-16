import 'package:redux/redux.dart';

import './post_state.dart';
import './post_types.dart';

Reducer<PostState> postReducer = combineReducers([
  TypedReducer<PostState, PostRequest>(postRequestReducer),
  TypedReducer<PostState, PostRequestFailure>(postRequestFailureReducer),
  TypedReducer<PostState, SetPosts>(setPostsReducer),
  TypedReducer<PostState, ClearPosts>(clearPostsReducer),
]);

PostState postRequestReducer(PostState post, PostRequest action) {
  return post.copyWith(loading: true);
}

PostState postRequestFailureReducer(PostState post, PostRequestFailure action) {
  return post.copyWith(loading: false);
}

PostState setPostsReducer(PostState post, SetPosts action) {
  return post.copyWith(
    loading: false,
    items: action.items,
    token: action.token,
  );
}

PostState clearPostsReducer(PostState post, ClearPosts action) {
  return PostState();
}
