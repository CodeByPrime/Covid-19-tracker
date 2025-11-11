import 'dart:convert';

import 'package:covid_tracker/model/world_states_model.dart';
import 'package:covid_tracker/utility/app_urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class StateServices {
  Future<WorldStatesModel> FetchWorldStatesRecords() async {
    final Response = await http.get(Uri.parse(AppUrls.worldStatesApi));
    var data = jsonDecode(Response.body);
    if (Response.statusCode == 200) {
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('error');
    }
  }

  Future<List<dynamic>> CountriesListapi() async {
    final Response = await http.get(Uri.parse(AppUrls.countriesList));
    var data = jsonDecode(Response.body);
    if (Response.statusCode == 200) {
      return data;
    } else {
      throw Exception('error');
    }
  }
}
