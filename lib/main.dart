import 'package:flutter/material.dart';
import 'package:great_places/screens/add_place_screen.dart';
import '/provider/places_provider.dart';
import '/screens/places_list_screen.dart';
import 'package:provider/provider.dart';
import 'screens/add_place_screen.dart';

void main() {
  runApp(const GreatPlacesApp());
}

class GreatPlacesApp extends StatelessWidget {
  const GreatPlacesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: PlacesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          accentColor: Colors.indigoAccent,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
        },
      ),
    );
  }
}
