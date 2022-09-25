import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';


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
      body:  Center(
        child: Consumer<GreatPlaces>(
          //child: const Center(child: Text('Got no places yet. Start adding some!')),
          builder:(ctx, greatPlaces, child)=> 
          greatPlaces.items.isEmpty 
          ? const Center(child: Text('Got no places yet. Start adding some!')) 
          : ListView.builder(
            itemCount: greatPlaces.items.length,
            itemBuilder: (context, i) =>  ListTile(
              leading: CircleAvatar( backgroundImage: FileImage(greatPlaces.items[i].image),),
              title:  Text(greatPlaces.items[i].title) ,
              onTap: (){ 
                //...Go to detail page
              },
            ),
          ),) ,
        ),  
    );
  }
}