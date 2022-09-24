import 'package:flutter/material.dart';
import './screens/places_list_screen.dart';
import 'package:provider/provider.dart';
import './providers/great_places.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GreatPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My places',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PlacesList() ,
      ),
    );
  }
}


