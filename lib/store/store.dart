import 'package:redux/redux.dart';

import './root_reducer.dart';
import './root_state.dart';
import './middleware.dart';

Future<Store<RootState>> createStore() async {
  final initialState = await persistor.load();

  Store<RootState> store = Store(
    rootReducer,
    initialState: initialState ?? RootState(),
    middleware: createMiddleware(),
  );

  return store;
}
