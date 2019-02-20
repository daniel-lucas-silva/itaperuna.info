import 'package:flutter/material.dart';
import 'package:itaperuna/blocs/app_bloc.dart';
import 'package:itaperuna/blocs/bloc_provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import './screens/home_screen.dart';

void main() {
  final appBloc = AppBloc();
  runApp(MyApp(appBloc));

  timeago.setLocaleMessages('pt_BR_short', timeago.PtBrShortMessages());
  timeago.setLocaleMessages('pt_BR', timeago.PtBrMessages());
}

class MyApp extends StatelessWidget {
  final AppBloc bloc;

  MyApp(this.bloc);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: bloc,
      child: MaterialApp(
        title: 'Itaperuna Notícias',
        home: HomeScreen(),
        theme: ThemeData(
          primaryColor: Color(0xFF222222),
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
