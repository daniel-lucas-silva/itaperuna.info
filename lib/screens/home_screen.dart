import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itaperuna/components/home_app_bar.dart';
import 'package:itaperuna/components/home_drawer.dart';
import 'package:itaperuna/screens/home_tabs/first_tab.dart';
import 'package:itaperuna/screens/home_tabs/second_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  PageController _tabController;
  int _index;

  @override
  void initState() {
    super.initState();
    _tabController = new PageController();
    _index = 0;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onTap(int tab) {
    _tabController.jumpToPage(tab);
  }

  void onTabChanged(int tab) {
    setState(() {
      this._index = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverPersistentHeader(
                pinned: true,
                delegate: HomeAppBar(),
              )
            ];
          },
          body: Stack(
            children: <Widget>[
              PageView(
                controller: _tabController,
                pageSnapping: true,
                onPageChanged: onTabChanged,
                children: [
                  FirstTab(),
                  SecondTab(),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CupertinoTabBar(
                  onTap: onTap,
                  currentIndex: _index,
                  backgroundColor: Colors.white54,
                  inactiveColor: Colors.black54,
                  activeColor: Colors.lightGreen[800],
                  iconSize: 24.0,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      title: Text('Início'),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.info),
                      title: Text('Itaperuna'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

