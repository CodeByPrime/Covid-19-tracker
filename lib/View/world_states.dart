import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStateScreen extends StatefulWidget {
  const WorldStateScreen({Key? key}) : super(key: key);

  @override
  State<WorldStateScreen> createState() => _WorldStateScreenState();
}

class _WorldStateScreenState extends State<WorldStateScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 4))
        ..repeat();
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WorldStateScreen()))
            });
  }

  final colorList = [
    const Color(0xff008DD5),
    const Color(0xff03CEA4),
    const Color(0xff345995)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            PieChart(
              chartRadius: MediaQuery.of(context).size.width / 4,
              dataMap: const {"Total": 20, "Recovered": 15, "Deaths": 5},
              animationDuration: Duration(milliseconds: 1200),
              chartType: ChartType.ring,
              colorList: colorList,
              legendOptions:
                  LegendOptions(legendPosition: LegendPosition.right),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02),
              child: Card(
                child: Column(
                  children: [
                    ReuseableRow(title: "total", value: "200"),
                    ReuseableRow(title: "total", value: "200"),
                    ReuseableRow(title: "total", value: "200")
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class ReuseableRow extends StatelessWidget {
  String title, value;
  ReuseableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          ),
          SizedBox(
            height: 5,
          ),
          Divider()
        ],
      ),
    );
  }
}
