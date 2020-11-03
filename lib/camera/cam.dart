import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyApps extends StatefulWidget {
  @override
  _MyAppsState createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {
  File image;
  Future getImage(bool isCamera) async {

    if (isCamera) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
  }

@override
Widget build(BuildContext context){

      return Scaffold(
        appBar: AppBar(
          title: Text('Image Pick Demo'),
        ),
        body: Center(
            child: Column(
            children: <Widget>[
            IconButton(
            icon: Icon(Icons.insert_drive_file),
        onPressed: (){
              getImage(false);
        },
      ),
      SizedBox(height: 10.0),
      IconButton(
        icon: Icon(Icons.camera_alt),
        onPressed: (){
          getImage(true);
          },

      ),
      image == null? Container() : Image.file(image, height: 300.0, width: 300.0,),
  ],
  ),
  ),


      );
  }
}
