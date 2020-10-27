import 'package:Petsell/Payments/razorpayment.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  final product_name;
  final product_photto;
  final product_price;
  final product_desc_;
  final product_breed;
  Cart({
    this.product_name,
    this.product_photto,
    this.product_price,
    this.product_desc_,
    this.product_breed,
  });
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 190,
              child: Card(
                color: Colors.blueAccent,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Image.network(
                          widget.product_photto,
                          height: 120,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, left: 29),
                          child: Text(
                            widget.product_name,
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 29.0),
                          child: Text(
                            widget.product_price,
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        FlatButton(
                          height: 30,
                          minWidth: 170,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.white,
                          child: Text("Remove"),
                        ),
                        FlatButton(
                          height: 30,
                          minWidth: 170,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Payment()));
                          },
                          color: Colors.white,
                          child: Text("Buy"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
