import 'package:covid_tracker/services/states_services.dart';
import 'package:flutter/material.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({Key? key}) : super(key: key);

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  StateServices stateServices = StateServices();
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          title:  Text('Countries List'),
        ),
        body: SafeArea(
            child: Container(
          height: 1000,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: searchcontroller,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                      prefixIcon: const Icon(Icons.search),
                      hintText: "search with country name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
              ),
              FutureBuilder(
                future: stateServices.CountriesListapi(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return  Center(child: CircularProgressIndicator());
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(snapshot.data![index]['cases'].toString()),
                                leading: Image(
                                  height: 50,
                                  width: 50,
                                    image: NetworkImage(
                                        snapshot.data![index]['countryInfo']['flag'])),
                              )
                            ],
                          );
                        },
                      ),
                    );
                  }
                },
              )
            ],
          ),
        )));
  }
}
