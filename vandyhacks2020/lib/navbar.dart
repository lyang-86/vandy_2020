import 'package:flutter/material.dart';

import 'pie.dart';
import 'userinput.dart';
import 'profile.dart';
import 'homepage.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomTabbarExampleState();

}

class _BottomTabbarExampleState extends State<NavBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  static  final _kTabPages = <Widget>[
    Center(child: HomePage()),
    Center(child: FrontPage()),
    Center(child: Profile()),
  ];
  static const _kTabs = <Tab>[
    Tab(icon: Icon(Icons.add_chart), text: 'Tracker'),
    Tab(icon: Icon(Icons.home_filled), text: 'Home'),
    Tab(icon: Icon(Icons.account_circle), text: 'Profile'),
  ];



  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _kTabPages.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TileApp()),
          );
        },
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),

      appBar: null,
      body: TabBarView(
        children: _kTabPages,
        controller: _tabController,
      ),
      bottomNavigationBar: Material(
        color: Color(0xff3C405B),
        child: TabBar(
          tabs: _kTabs,
          controller: _tabController,
        ),
      ),
    );
  }
}