import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

class RLNBinary extends StatefulWidget {
  @override
  _RLNBinaryState createState() => _RLNBinaryState();
}

class _RLNBinaryState extends State<RLNBinary> {
  File _image;
  Uint8List binaryImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'RLN Binary',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              getImage();
            },
            color: Colors.amber,
            child: Text(
              'Choose Image',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: _image != null
                ? Image.file(
                    _image,
                  )
                : Text('No Image Selected'),
          ),
          if (binaryImage != null)
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Image.memory(
                binaryImage,
              ),
            ),
          RaisedButton(
            onPressed: () {},
            color: Colors.green,
            child: Text(
              'Encode Image',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    var decodedImage = img.decodeImage(await image.readAsBytes());

    Uint8List inputImg = decodedImage.getBytes(format: img.Format.rgb);

    setState(() {
      _image = image;
    });
  }
}
