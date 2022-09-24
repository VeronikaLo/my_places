import 'package:flutter/material.dart';


class PlacesList extends StatelessWidget {
  const PlacesList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Your Places') ,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).pushNamed('/add_place');
            }, 
            icon: const Icon(Icons.add))
        ]),
      body: const Center(
        child: CircularProgressIndicator(), ),  
    );
  }
}