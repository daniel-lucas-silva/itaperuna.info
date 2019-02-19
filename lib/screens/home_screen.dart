import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './home_tabs/general_tab.dart';
import './home_tabs/itaperuna_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  pinned: true,
                  centerTitle: true,
                  expandedHeight: 130.0,
                  forceElevated: innerBoxIsScrolled,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      'bg-ita.jpg',
                      fit: BoxFit.cover,
                    ),
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Itaperuna',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w400),
                        ),
                        Container(
                          width: 1.0,
                        ),
                        Text(
                          'Noticias',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                    collapseMode: CollapseMode.parallax,
                  ))
            ];
          },
          body: Stack(
            children: <Widget>[
              PageView(
                controller: _tabController,
                pageSnapping: true,
                onPageChanged: onTabChanged,
                children: [
                  GeneralTab(),
                  ItaperunaTab(),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CupertinoTabBar(
                  onTap: onTap, // new
                  currentIndex: _index, // new
                  backgroundColor: Colors.white54,
                  inactiveColor: Colors.black54,
                  activeColor: Colors.lightGreen[700],
                  iconSize: 22.0,
                  border: Border(
                    top: BorderSide(
                      color: Colors.black12
                    )
                  ),
                  items: [
                    BottomNavigationBarItem(
                      title: Text('Geral'),
                      icon: Icon(Icons.home),
                    ),
                    BottomNavigationBarItem(
                      title: Text('Itaperuna'),
                      icon: Icon(Icons.info_outline),
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

  void onTap(int tab) {
    _tabController.jumpToPage(tab);
  }

  void onTabChanged(int tab) {
    setState(() {
      this._index = tab;
    });
  }
}
