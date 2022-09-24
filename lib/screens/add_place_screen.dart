import 'package:flutter/material.dart';
import '../widgets/image_item.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  
  final _titleController = TextEditingController();


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
                    const ImageItem(),
                  ],
                ),
              ), ),
          ),
          ElevatedButton.icon(
            onPressed: (){},
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