import './root_state.dart';
import './app/app_reducer.dart';
import './recent/recent_reducer.dart';
import './posts/post_reducer.dart';

RootState rootReducer(RootState state, action) {
  return new RootState(
    app: appReducer(state.app, action),
    recent: recentReducer(state.recent, action),
    post: postReducer(state.post, action),
  );
}
