
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'global.dart' as globals;

void main() {
  globals.user.expenses.forEach((key,value) {
    if(value > globals.user.lastWeeksExpenses[key]){
      globals.increases.add(key);
    }
    else if(value < globals.user.lastWeeksExpenses[key]){
      globals.decreases.add(key);
    }
    else{
      globals.stagnant.add(key);
    }
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pie Chart',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}

enum LegendShape { Circle, Rectangle }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map dataMap = globals.user.expenses;
  Map dataMap2 = globals.user.lastWeeksExpenses;
  List<Color> colorList = [
    Color(0xffCE5D6E),
    Color(0xff3C405B),
    Color(0xff349382),
    Color(0xff86D8C9),
    Color(0xffF5C35A),
    Color(0xff839EA1),
    Color(0xffADC8CB),
    Color(0xffE0D7D7),
    Color(0xffA69BC8),
  ];

  ChartType _chartType = ChartType.ring;
  double _ringStrokeWidth = 14;
  double _chartLegendSpacing = 20;

  bool _showLegendsInRow = false;
  bool _showLegends = true;

  bool _showChartValueBackground = true;
  bool _showChartValues = true;
  bool _showChartValuesInPercentage = true;
  bool _showChartValuesOutside = false;

  LegendShape _legendShape = LegendShape.Rectangle;
  LegendPosition _legendPosition = LegendPosition.left;

  int key = 0;
  @override
  Widget build(BuildContext context) {

    final chart = PieChart(
      key: ValueKey(key),
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: _chartLegendSpacing,
      chartRadius: MediaQuery
          .of(context)
          .size
          .width / 2.0 > 300
          ? 300
          : MediaQuery
          .of(context)
          .size
          .width / 2.0,
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: _chartType,
      legendOptions: LegendOptions(
        showLegendsInRow: _showLegendsInRow,
        legendPosition: _legendPosition,
        showLegends: _showLegends,
        legendShape: _legendShape == LegendShape.Circle
            ? BoxShape.circle
            : BoxShape.rectangle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: _showChartValueBackground,
        showChartValues: _showChartValues,
        showChartValuesInPercentage: _showChartValuesInPercentage,
        showChartValuesOutside: _showChartValuesOutside,
      ),
      ringStrokeWidth: _ringStrokeWidth,
    );
    final settings = SingleChildScrollView(
      child: Card(
        color: Colors.blueGrey,
        margin: EdgeInsets.all(11),
        child: Column(
            children: [
        ListTile(
        title: Text(
        'summary'.toUpperCase(),
        style: Theme.of(context).textTheme.overline.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ListTile(
          title: Text('INCREASED',style: Theme.of(context).textTheme.overline.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          ),
          ),
        ),
        ListTile(
          title: Text(globals.increases.join('\n'), style: TextStyle(fontSize: 17)
              ),),
        ListTile(
                title: Text('DECREASED',style: Theme.of(context).textTheme.overline.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
        ListTile(
          title: Text(globals.decreases.join('\n'), style: TextStyle(fontSize: 17)
              ),),
        ListTile(
                title: Text('STAGNANT',style: Theme.of(context).textTheme.overline.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
        ListTile(
          title: Text(globals.stagnant.join('\n'), style: TextStyle(fontSize: 17)
              ),),
        ListTile(
                title: Text("")
        ),
            ],
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          RaisedButton(
            onPressed: () {
              setState(() {
                key = key + 1;
              });
            },
            child: Text("Reload".toUpperCase()),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          if (constraints.maxWidth >= 600) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: chart,
                ),
              ],
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: chart,
                    margin: EdgeInsets.symmetric(
                      vertical: 32,
                    ),
                  ),
                  settings,
                ],
              ),
            );
          }
        },
      ),
//      bottomNavigationBar: NavBar(),
    );
  }
}
