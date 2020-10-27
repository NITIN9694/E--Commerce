import 'package:Petsell/Payments/razorpayment.dart';
import 'package:Petsell/Screen/cart.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final product_name_detail;
  final product_photto_detail;
  final product_price_detail;
  final product_desc_detail;
  final product_breed_detail;
  Body({
    this.product_desc_detail,
    this.product_name_detail,
    this.product_photto_detail,
    this.product_price_detail,
    this.product_breed_detail,
  });
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 190),
              child: Image.asset(
                "assests/icon/backk.png",
                height: 30,
                width: 20,
              ),
            ),
          ),
        ),
        body: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 700,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 700 * 0.3),
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(34),
                                topRight: Radius.circular(34))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.product_name_detail,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 40),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "Price",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        )),
                                    TextSpan(
                                        text:
                                            widget.product_price_detail + "/-",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                        )),
                                    TextSpan(
                                        text: widget.product_breed_detail,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                        ))
                                  ]),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 120),
                                child: Image.network(
                                  widget.product_photto_detail,
                                  height: 280,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 60),
                                child: Text(
                                  widget.product_desc_detail,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, left: 10),
                                child: SizedBox(height: 20, child: Add()),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Cart(
                                                product_name:
                                                    widget.product_name_detail,
                                                product_price:
                                                    widget.product_price_detail,
                                                product_breed:
                                                    widget.product_breed_detail,
                                                product_photto: widget
                                                    .product_photto_detail,
                                              )));
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 30, left: 60),
                                  child: SizedBox(
                                    height: 30,
                                    child: Image.asset("assests/icon/cart.png"),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 20),
                                child: SizedBox(
                                  height: 30,
                                  width: 300,
                                  child: FlatButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Payment(
                                                    product_price_final: widget
                                                        .product_price_detail,
                                                  )));
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(19)),
                                    child: Text("Buy Now"),
                                  ),
                                ),
                              ),
                            ]),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  int numofItem = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          height: 20,
          width: 60,
          child: OutlineButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              setState(() {
                numofItem--;
              });
            },
            child: Icon(Icons.remove),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(numofItem.toString().padLeft(2, "0")),
        ),
        SizedBox(
          height: 20,
          width: 60,
          child: OutlineButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
            onPressed: () {
              setState(() {
                numofItem++;
              });
            },
            child: Center(
              child: Icon(
                Icons.add,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
