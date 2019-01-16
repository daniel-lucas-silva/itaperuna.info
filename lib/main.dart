import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:timeago/timeago.dart' as timeago;

// import './widgets/main_screen.dart';
import './store/store.dart';
import './store/root_state.dart';
import './screens/home_screen.dart';

void main() async {
  createStore().then((store) => runApp(MyApp(store: store)));

  timeago.setLocaleMessages('pt_BR_short', timeago.PtBrShortMessages());
  timeago.setLocaleMessages('pt_BR', timeago.PtBrMessages());
}

class MyApp extends StatelessWidget {
  final Store<RootState> store;

  const MyApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<RootState>(
      store: store,
      child: MaterialApp(
        title: 'Itaperuna Notícias',
        home: HomeScreen(),
        theme: ThemeData(
          primaryColor: Color(0xff368B41),
          accentColor: Colors.cyan[600],
          fontFamily: 'Montserrat',
          primaryTextTheme: TextTheme(
            title: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
