import 'package:Petsell/Data/firestore.dart';
import 'package:Petsell/Details/ProductDetails.dart';
import 'package:Petsell/Screen/addpet.dart';
import 'package:Petsell/Screen/cart.dart';
import 'package:Petsell/Screen/sidebar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/rendering.dart';

class FrontPAge extends StatefulWidget {
  final product_name;
  final product_photto;
  final product_price;
  final product_desc_;
  final product_breed;
  FrontPAge({
    this.product_name,
    this.product_photto,
    this.product_price,
    this.product_desc_,
    this.product_breed,
  });
  @override
  _FrontPAgeState createState() => _FrontPAgeState();
}

class _FrontPAgeState extends State<FrontPAge> {
  Stream dataStream;
  TextEditingController serachcontroller = TextEditingController();
  UploadImage uploadImage = UploadImage();
  QuerySnapshot searchsnapshot;

  Widget DataList() {
    return Container(
        child: Column(
      children: <Widget>[
        StreamBuilder(
          stream: Firestore.instance.collection("data").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                DocumentSnapshot coure = snapshot.data.documents[index];
                dynamic getdata = coure.data();
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Body(
                                  product_name_detail: getdata['name'],
                                  product_photto_detail: getdata['imageUrl'],
                                  product_price_detail: getdata['price'],
                                  product_desc_detail: getdata['desc'],
                                  product_breed_detail: getdata['breed'],
                                )));
                  },
                  child: ImageTile(
                    name: getdata["name"],
                    price: getdata['price'],
                    imageurl: getdata['imageUrl'],
                    desc: getdata['desc'],
                    breed: getdata['breed'],
                  ),
                );
              },
            );
          },
        )
      ],
    ));
  }

  Widget searchList() {
    return ListView.builder(
      itemCount: searchsnapshot.documents.length,
      itemBuilder: (context, index) {
        DocumentSnapshot coure = searchsnapshot.documents[index];
        dynamic getdata = coure.data();
        return SearchTile(
          name: getdata["name"],
        );
      },
    );
  }

  initalSearch() {
    uploadImage.getdData(serachcontroller.text).then((val) {
      setState(() {
        searchsnapshot = val;
      });
    });
  }

  Widget SearchTile({String name, String price}) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [Text(name), Text(price)],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Image.asset("assests/icon/menu.jpg"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Sidebar()));
            },
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(right: 30, left: 10),
              child: TextField(
                controller: serachcontroller,
                decoration: InputDecoration(
                  hintText: "Search",
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: IconButton(
              icon: Image.asset("assests/icon/search.png"),
              onPressed: () {
                SearchTile();
              },
            ),
          ),
          IconButton(
            icon: Image.asset("assests/icon/cart.png"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
          ),
        ],
      ),
      body: ListView(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          children: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Column(children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Expanded(child: Flexible(child: DataList())),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ]),
    );
  }
}

class ImageTile extends StatelessWidget {
  String imageurl, name, desc, price, breed;
  ImageTile({
    @required this.imageurl,
    @required this.name,
    @required this.desc,
    @required this.price,
    @required this.breed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.only(),
        height: 330,
        width: 0,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Column(children: <Widget>[
              Container(
                height: 210,
                width: 289,
                margin: EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  child: CachedNetworkImage(
                    imageUrl: imageurl == null ? " " : imageurl,
                    width: 190,
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        price == null ? " " : "Price- " + price,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        name == null ? " " : "Name- " + name,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(desc == null ? " " : "Descripation- " + desc,
                          style: TextStyle(
                            fontSize: 10,
                          )),
                      SizedBox(
                        height: 05,
                      ),
                      Text(breed == null ? " " : "brred- " + breed,
                          style: TextStyle(
                            fontSize: 10,
                          ))
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      )),
    );
  }
}
