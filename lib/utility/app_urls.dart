/// The `AppUrls` class contains static string constants for various COVID-19 related API endpoints.
import "package:flutter/material.dart";


class AppUrls {
  static const String baseUrl = "https://disease.sh/v3/covid-19/";
  static const String worldStatesApi = baseUrl + "all";
  static const String countriesList = baseUrl + "countries";
}