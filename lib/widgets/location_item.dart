import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationItem extends StatefulWidget {
  const LocationItem({super.key});

  @override
  State<LocationItem> createState() => _LocationItemState();
}

class _LocationItemState extends State<LocationItem> {
  String? _previewImageUrl;

  Future<void> _getCurrentUserLocation() async{
    
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

serviceEnabled = await location.serviceEnabled();
if (!serviceEnabled) {
  serviceEnabled = await location.requestService();
  if (!serviceEnabled) {
    return;
  }
}

permissionGranted = await location.hasPermission();
if (permissionGranted == PermissionStatus.denied) {
  permissionGranted = await location.requestPermission();
  if (permissionGranted != PermissionStatus.granted) {
    return;
  }
}
    locationData = await Location().getLocation();
    debugPrint(locationData.latitude.toString());
    debugPrint(locationData.longitude.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(5)
        ) ,
        alignment: Alignment.center,
        height: 200,
        width: double.infinity,
        child: _previewImageUrl == null
        ? const Text('No location chosen yet')
        : Image.network(_previewImageUrl! , fit: BoxFit.cover, width: double.infinity,),
      ),
      const SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        TextButton.icon(
          onPressed: _getCurrentUserLocation, 
          icon: const Icon(Icons.location_on), 
          label: const Text('Current Location')),
        TextButton.icon(
          onPressed: (){}, 
          icon: const Icon(Icons.map_rounded), 
          label: const Text('Location on Map'))  
      ],)
    ],);
  }
}