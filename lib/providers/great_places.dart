
import 'dart:io';
import 'package:flutter/foundation.dart';
import '../models/place.dart';
import '../helpers/db_helper.dart';

class GreatPlaces with ChangeNotifier{

  List<Place> _items = [];

  List<Place> get items{
    return [..._items];
  }

  //function to add a new Place to the list
  void addPlace(String pickedTitle, File pickedImage, ){
    final newPlace = Place(
      id: DateTime.now().toString(), 
      title: pickedTitle, 
      location: null, 
      image: pickedImage);

      _items.add(newPlace); //to add a Place to a list
      notifyListeners();

      DBHelper.insert('places', {
        'id': newPlace,
        'title': newPlace.title,
        'image': newPlace.image.path,
      });
  }

  //function to fetch and set data from db into appUI
  Future<void> getandSetData()async{
    final dataList = await DBHelper.getData('places'); // get from db
    _items = dataList.map( (item) => Place(
      id: item['id'], 
      title: item['title'], 
      location: null, 
      image: File(item['image'] // to get a path, but not a complite image
      ),)).toList as List<Place>;
    notifyListeners();  
  }

}