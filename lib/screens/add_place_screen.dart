import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../providers/great_places.dart';
import '../widgets/image_item.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  
  final _titleController = TextEditingController();
  File? _pickedImage; 

  void _selectImage(File selectedImage){
    _pickedImage = selectedImage;
  }

  void savePlace(){
    if(_titleController.text.isEmpty || _pickedImage == null){
      // showDialog() ... handling error
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false).addPlace(_titleController.text, _pickedImage as File); 
    Navigator.of(context).pop();
  }
 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new Place'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children:  [
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(label: Text('Title'), ),
                    ),
                    const SizedBox(height: 16,),
                    ImageItem(_selectImage),
                  ],
                ),
              ), ),
          ),
          ElevatedButton.icon(
            onPressed: savePlace,
            icon: const Icon(Icons.add), 
            label: const Text('Add Place'),
            style: ElevatedButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: Colors.pink[100], 
            ),
            )
        ]),
    );
  }
}