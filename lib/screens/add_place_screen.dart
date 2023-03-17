import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/provider/places_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = "/add-place-screen";
  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final titleController = TextEditingController();
  File? _selectedImage;
  void selectImage(File selectedImage) {
    _selectedImage = selectedImage;
  }

  void savePlace() {
    if (titleController.text.isNotEmpty || _selectedImage != null) {
      Provider.of<PlacesProvider>(context, listen: false)
          .addPlace(titleController.text, _selectedImage!);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Place"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: "Title"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ImageInput(selectImage),
                ],
              ),
            ),
          ),
          TextButton.icon(
            onPressed: savePlace,
            icon: Icon(
              Icons.add,
              color: Theme.of(context).accentColor,
            ),
            label: Text(
              "Add Place",
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
          ),
        ],
      ),
    );
  }
}
