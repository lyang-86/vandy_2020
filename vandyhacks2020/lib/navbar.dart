import 'package:flutter/material.dart';

import 'pie.dart';
import 'userinput.dart';
import 'userinput.dart';

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
    Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
    Center(child: TileApp()),
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
        color: Colors.blue,
        child: TabBar(
          tabs: _kTabs,
          controller: _tabController,
        ),
      ),
    );
  }
}