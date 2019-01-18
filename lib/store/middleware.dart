import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import './root_state.dart';
import './posts/posts_middleware.dart';

final persistor = Persistor<RootState>(
  storage: FlutterStorage(),
  serializer: JsonSerializer<RootState>(RootState.fromJSON),
);

// Set up middlewares
List<Middleware<RootState>> createMiddleware() => <Middleware<RootState>>[
      thunkMiddleware,
      persistor.createMiddleware(),
      LoggingMiddleware.printer(),
      postsMiddleware
    ];
