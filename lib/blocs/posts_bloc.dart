
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:itaperuna/services/google_service.dart';

class PostsBloc {

  String _latestToken;

  final _featured = PublishSubject<List<dynamic>>();
  final _latest = PublishSubject<List<dynamic>>();

  Observable<List<dynamic>> get featured => _featured.stream;
  Observable<List<dynamic>> get latest => _latest.stream;

  void dispose() {
    _featured.close();
    _latest.close();
  }

  Future<bool> fetch({ refresh }) async {

    try {
      var _result = await googleService.fetch(nextToken: _latestToken ?? null);
      var data = _result.data;
      _latestToken = refresh ?? data['nextPageToken'];
      _latest.sink.add(data['items']);
      return true;
    } catch (e) {
      print(e.response);
      // _itemController.sink.addError(e);
      return false;
    }
  }

  Future<bool> fetchFeatured() async {

    try {
      var _result = await googleService.fetch(category: 'Destaque', max: 3);
      var data = _result.data;
      print(data);
      _featured.sink.add(data['items']);
      return true;
    } catch (e) {
      print(e.response);
      // _itemController.sink.addError(e);
      return false;
    }
  }
}