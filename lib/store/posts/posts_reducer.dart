import 'package:redux/redux.dart';

import './posts_types.dart';
import './posts_state.dart';

Reducer<PostsState> postsReducer = combineReducers([
  new TypedReducer<PostsState, LoadingPosts>(loadingPostsReducer),
  new TypedReducer<PostsState, SetPosts>(setPostsReducer),
  new TypedReducer<PostsState, AddPosts>(addPostsReducer),
  new TypedReducer<PostsState, ClearPosts>(clearPostsReducer),
  new TypedReducer<PostsState, EndPosts>(endPostsReducer),
]);

PostsState loadingPostsReducer(PostsState posts, LoadingPosts action) {
  return posts.copyWith(
      isLoading: true
  );
}

PostsState endPostsReducer(PostsState posts, EndPosts action) {
  return posts.copyWith(
      end: true
  );
}

PostsState setPostsReducer(PostsState posts, SetPosts action) {
  return posts.copyWith(
    isLoading: false,
    nextToken: action.nextToken,
    items: action.items
  );
}

PostsState addPostsReducer(PostsState posts, AddPosts action) {
  return posts.copyWith(
      isLoading: false,
      nextToken: action.nextToken,
      items: List.from(posts.items)..addAll(action.items)
  );
}

PostsState clearPostsReducer(PostsState posts, ClearPosts action) {
  return PostsState();
}
