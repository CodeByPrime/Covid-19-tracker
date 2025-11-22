# COVID-19 Tracker App

A Flutter-based mobile application for tracking global and country-specific COVID-19 statistics in real-time. The app fetches data from the Disease.sh API and provides an intuitive interface to view cases, recoveries, deaths, and more.

## Features

- **Splash Screen**: Animated splash screen with a rotating virus icon and app title.
- **Global Statistics**: Displays worldwide COVID-19 data including total cases, deaths, recoveries, active cases, critical cases, and today's updates, visualized with a pie chart.
- **Countries List**: Searchable list of all countries affected by COVID-19, showing case counts and flags.
- **Country Details**: Detailed view for each country, including cases, recoveries, deaths, critical cases, and today's recoveries, with the country's flag.
- **Dark Theme**: The app uses a dark theme for better user experience.
- **Real-time Data**: Fetches live data from the Disease.sh API.
- **Loading Animations**: Includes shimmer effects for loading states and spinning animations.



### Prerequisites

- Flutter SDK (version 2.12.0 or higher)
- Dart SDK (version 2.12.0 or higher)
- Android Studio or VS Code with Flutter extensions
- A device or emulator for testing

### Setup

1. Clone the repository:

   ```
   git clone https://github.com/your-username/covid-tracker.git
   cd covid-tracker
   ```

2. Install dependencies:

   ```
   flutter pub get
   ```

3. Run the app:
   ```
   flutter run
   ```

## Usage

- Launch the app to see the splash screen.
- After 5 seconds, the global statistics screen appears with a pie chart and stats card.
- Tap the button at the bottom to navigate to the countries list.
- Use the search bar to filter countries by name.
- Tap on a country to view detailed statistics.

## API

The app uses the [Disease.sh API](https://disease.sh/) for COVID-19 data:

- **World States API**: `https://disease.sh/v3/covid-19/all` - Fetches global statistics.
- **Countries List API**: `https://disease.sh/v3/covid-19/countries` - Fetches list of countries with their data.

## Dependencies

- `flutter`: SDK for building the app.
- `cupertino_icons`: Icons for iOS style.
- `http`: For making HTTP requests to the API.
- `animated_text_kit`: For text animations (though not heavily used in this version).
- `pie_chart`: For displaying the pie chart in global stats.
- `flutter_spinkit`: For loading spinners.
- `shimmer`: For shimmer loading effects.

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── model/
│   └── world_states_model.dart # Data model for world stats
├── services/
│   └── states_services.dart   # API service class
├── utility/
│   └── app_urls.dart          # API URLs constants
└── View/
    ├── splash_screen.dart     # Splash screen
    ├── world_states.dart      # Global stats screen
    ├── countries_list.dart    # Countries list screen
    └── detail_screen.dart     # Country detail screen
```

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes.



## Disclaimer

This app is for informational purposes only and uses publicly available data from Disease.sh. Please refer to official health organizations for the latest and most accurate information.
