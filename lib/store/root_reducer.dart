import './root_state.dart';
import './posts/post_reducer.dart';

RootState rootReducer(RootState state, action) {
  return new RootState(
    post: postReducer(state.post, action),
  );
}
