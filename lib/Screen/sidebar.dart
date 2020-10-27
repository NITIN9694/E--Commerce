import 'package:Petsell/Screen/addpet.dart';
import 'package:Petsell/Screen/cart.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Center(
              child: DrawerHeader(
                child: CircleAvatar(
                  child: Icon(Icons.person_add),
                ),
              ),
            ),
            Divider(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      children: <Widget>[Icon(Icons.add_a_photo)],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 130),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AddPet()));
                      },
                      child: Text(
                        "Sell Your Pet",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      children: <Widget>[Icon(Icons.shopping_cart)],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 130),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Cart()));
                      },
                      child: Text(
                        "Your Producet",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Divider(
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Row(
                            children: <Widget>[Icon(Icons.search)],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 130),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => AddPet()));
                            },
                            child: Text(
                              "Search",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: 220,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Row(
                            children: <Widget>[Icon(Icons.message)],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 130),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => AddPet()));
                            },
                            child: Text(
                              "Message",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: 370,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 210),
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Row(
                            children: <Widget>[Icon(Icons.settings)],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 130),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => AddPet()));
                            },
                            child: Text(
                              "Setting",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
