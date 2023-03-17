import 'dart:io';

import 'package:flutter/material.dart';
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
  }
}
