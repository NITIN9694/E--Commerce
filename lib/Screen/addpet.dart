import 'dart:io';

import 'package:Petsell/Data/firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AddPet extends StatefulWidget {
  @override
  _AddPetState createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  UploadImage uploadImage = UploadImage();
  File selectimage;
  TextEditingController namecont = TextEditingController();
  TextEditingController pricecont = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController breed = TextEditingController();
  bool isLoading = false;

  Future<void> getimage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      selectimage = image;
    });
  }

  sendata() async {
    if (selectimage != null) {
      setState(() {
        isLoading = true;
      });

      StorageReference firebasestoragetrf = FirebaseStorage.instance
          .ref()
          .child("imagesend")
          .child("${randomAlphaNumeric(9)}.jpg");

      final StorageUploadTask task = firebasestoragetrf.putFile(selectimage);
      var dowloadedUrl = await (await task.onComplete).ref.getDownloadURL();
      print("this is $dowloadedUrl");
      Map<String, String> putdata = {
        "imageUrl": dowloadedUrl,
        "name": namecont.text,
        "price": pricecont.text,
        "desc": desc.text,
        "breed": breed.text,
      };
      uploadImage.addData(putdata).then((result) => Navigator.pop(context));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
                child: selectimage == null
                    ? Text("")
                    : Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          width: 180,
                          height: 180,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              selectimage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )),
            SizedBox(
              height: 9,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  getimage();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: <Widget>[Icon(Icons.add_a_photo)],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
              child: TextField(
                controller: namecont,
                decoration: InputDecoration(
                    hintText: "Add Name", hintStyle: TextStyle(fontSize: 12)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
              child: TextField(
                controller: pricecont,
                decoration: InputDecoration(
                    hintText: "Add Price", hintStyle: TextStyle(fontSize: 12)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
              child: TextField(
                controller: desc,
                decoration: InputDecoration(
                    hintText: "Discerpation",
                    hintStyle: TextStyle(fontSize: 12)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
              child: TextField(
                controller: breed,
                decoration: InputDecoration(
                    hintText: "Name Of Breed",
                    hintStyle: TextStyle(fontSize: 12)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: MaterialButton(
                elevation: 10,
                color: Colors.yellow,
                onPressed: () {
                  sendata();
                  Navigator.pop(context);
                },
                child: Text(
                  "Upload",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
