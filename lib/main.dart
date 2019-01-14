import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import './widgets/main_screen.dart';
import './store/store.dart';
import './store/root_state.dart';

void main() async {
  createStore().then((store) => runApp(MyApp(store: store)));
}

class MyApp extends StatelessWidget {
  final Store<RootState> store;

  const MyApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<RootState>(
      store: store,
      child: MaterialApp(
        title: 'Macaé Digital',
        home: MainScreen(),
        routes: <String, WidgetBuilder>{
          '': (BuildContext context) => new MainScreen()
        },
      ),
    );
  }
}
