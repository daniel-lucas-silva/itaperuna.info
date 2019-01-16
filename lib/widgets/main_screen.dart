import 'package:flutter/material.dart';

import './main_drawer.dart';
import './main_tabs/general_tab.dart';
import './main_tabs/itaperuna_tab.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  // PageController _tabController;
  // String _title;
  // int _index;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   _tabController = new PageController();
  //   _title = TabItems[0].title;
  //   _index = 0;
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Itaperuna Notícias"),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex: _index,
        //   onTap: onTap,
        //   items: TabItems.map((TabItem item) {
        //     return BottomNavigationBarItem(
        //         title: Text(item.title), icon: Icon(item.icon));
        //   }).toList(),
        // ),
        drawer: MainDrawer(),
        // body: PageView(
        //   controller: _tabController,
        //   onPageChanged: onTabChanged,
        //   children: <Widget>[
        //     GeneralTab(),
        //     ItaperunaTab(),
        //   ],
        // ),
        body: GeneralTab());
  }

  // void onTap(int tab) {
  //   _tabController.jumpToPage(tab);
  // }

  // void onTabChanged(int tab) {
  //   setState(() {
  //     this._index = tab;
  //   });

  //   this._title = TabItems[tab].title;
  // }
}

// class TabItem {
//   final String title;
//   final IconData icon;

//   const TabItem({this.title, this.icon});
// }

// const List<TabItem> TabItems = const <TabItem>[
//   const TabItem(
//     title: 'Geral',
//     icon: Icons.home,
//   ),
//   const TabItem(
//     title: 'Itaperuna',
//     icon: Icons.info_outline,
//   ),
// ];
