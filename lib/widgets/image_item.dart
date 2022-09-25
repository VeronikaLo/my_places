import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageItem extends StatefulWidget {
  final Function onSelectImage;
  const ImageItem(this.onSelectImage, {super.key});

  @override
  State<ImageItem> createState() => _ImageItemState();
}

class _ImageItemState extends State<ImageItem> {
  File? _storedImage;

  Future<void> _takePic()async {
    final ImagePicker picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if(imageFile == null){
      return;
    }
    setState(() {
      _storedImage = File(imageFile.path);
    });

    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = p.basename(imageFile.path);
    final newPlace = File('${appDir.path}/$fileName');
    final savedImage = await File(imageFile.path).copy(newPlace.path);

    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 115,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
            alignment: Alignment.center,
            child: _storedImage == null
            ? const Text('No Image Taken')
            : Image.file(_storedImage!, fit: BoxFit.cover, width: double.infinity, ),
        ),
        const SizedBox(width: 15,),
        Expanded(
          child: TextButton.icon(
            onPressed: _takePic, 
            icon: const Icon(Icons.camera_alt_rounded), 
            label: const Text('Take Picture')),
        )
      ],
    );
  }
}