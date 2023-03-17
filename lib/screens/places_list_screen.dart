import 'package:flutter/material.dart';
import 'package:great_places/provider/places_provider.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Great Place"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Consumer<PlacesProvider>(
        child: Center(
          child: Text(
            "No places added yet , start adding !",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        builder: (ctx, place, ch) => place.items.isEmpty
            ? ch as Widget
            : ListView.builder(
                itemCount: place.items.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 6,
                    child: ListTile(
                      title: Text(place.items[index].title),
                      leading: CircleAvatar(
                        backgroundImage: FileImage(place.items[index].image),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
