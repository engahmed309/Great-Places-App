import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/helpers/DB_helper.dart';
import '/models/place.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File selectedImage) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: selectedImage,
      location: PlaceLocation(latitude: 0, longitude: 0),
      title: title,
    );
    _items.add(newPlace);

    notifyListeners();
    DBHelper.insert('place', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }
}
