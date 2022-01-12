import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class Photo extends ChangeNotifier{

  File? image;

  void launchURL(String urlString) async{
    if(await canLaunch(urlString)){
      await launch(urlString);
    }
  }

  Future selectImage(ImageSource source) async{

    final image = await ImagePicker().pickImage(source: source);
    if(image != null){
      final tempImage = File(image.path);
      this.image = tempImage;
      notifyListeners();
    }

  }

}