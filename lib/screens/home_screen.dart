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
      drawer: MainDrawer(),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innexBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 130.0,
                // floating: false,
                pinned: true,
                iconTheme: IconThemeData(color: Colors.white),
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
                ),
              ),
            ];
          },
          body: PageView(
            controller: _tabController,
            onPageChanged: onTabChanged,
            children: <Widget>[
              GeneralTab(),
              Container(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: onTap,
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
