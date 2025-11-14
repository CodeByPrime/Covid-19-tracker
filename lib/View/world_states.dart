import 'dart:async';

import 'package:covid_tracker/View/countries_list.dart';
import 'package:covid_tracker/model/world_states_model.dart';
import 'package:covid_tracker/services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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

  }

  final colorList = [
    const Color(0xff008DD5),
    const Color(0xff03CEA4),
    const Color(0xff345995)
  ];
  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return SingleChildScrollView(
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              FutureBuilder(
                future: stateServices.FetchWorldStatesRecords(),
                builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                        flex: 1,
                        child: SpinKitFadingCircle(
                          color: Colors.white,
                          size: 50,
                          controller: _animationController,
                        ));
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          chartValuesOptions: ChartValuesOptions(
                              showChartValuesInPercentage: true),
                          chartRadius: MediaQuery.of(context).size.width / 4,
                          dataMap: {
                            "Total":
                                double.parse(snapshot.data!.cases!.toString()),
                            "Recovered":
                                double.parse(snapshot.data!.deaths!.toString()),
                            "Deaths": double.parse(
                                snapshot.data!.recovered!.toString())
                          },
                          animationDuration: Duration(milliseconds: 1200),
                          chartType: ChartType.ring,
                          colorList: colorList,
                          legendOptions: LegendOptions(
                              legendPosition: LegendPosition.right),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.02),
                          child: Card(
                            child: Column(
                              children: [
                                ReuseableRow(
                                    title: "total",
                                    value: snapshot.data!.cases.toString()),
                                ReuseableRow(
                                    title: "deaths",
                                    value: snapshot.data!.deaths.toString()),
                                ReuseableRow(
                                    title: "recovered",
                                    value: snapshot.data!.recovered.toString()),
                                ReuseableRow(
                                    title: "Active",
                                    value: snapshot.data!.active.toString()),
                                ReuseableRow(
                                    title: "critical",
                                    value: snapshot.data!.critical.toString()),
                                ReuseableRow(
                                    title: "Today deaths",
                                    value:
                                        snapshot.data!.todayDeaths.toString()),
                                ReuseableRow(
                                    title: "today recovered",
                                    value: snapshot.data!.todayRecovered
                                        .toString()),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CountriesListScreen(),
                                ));
                          },
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_) => CountriesListScreen()));
                            },
                            child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xff1aa260),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                )),
                          ),
                        )
                      ],
                    );
                  }
                },
              ),
             
            ],
          ),
        )),
      ),
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
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          ),
          SizedBox(
            height: 5,
          ),
        const  Divider()
        ],
      ),
    );
  }
}
