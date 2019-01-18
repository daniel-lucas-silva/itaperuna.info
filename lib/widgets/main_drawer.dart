import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../store/root_state.dart';
import '../store/app/app_actions.dart';
import '../screens/category_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<RootState, dynamic>(
        onInit: (store) {
          store.dispatch(fetchCategories());
        },
        converter: (Store<RootState> store) => store.state.app.categories,
        builder: (BuildContext context, categories) {
          return Drawer(
            child: categories == null
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, idx) {
                      return ListTile(
                        title: Text(categories[idx]),
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CategoryScreen(categories[idx]),
                              ),
                            ),
                      );
                    },
                  ),
          );
        });
  }
}
