import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Payment extends StatefulWidget {
  final product_price_final;
  Payment({this.product_price_final});
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  Razorpay razorpay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccesful);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerPaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerPaymentExternal);
  }

// vCTXRftwvEwNYkdNHFdbn6W4
  void openChecout() {
    var option = {
      "key": "rzp_test_IlcEFlQExgAUNF",
      "amout": num.parse(widget.product_price_final),
      "prefill": {
        "email": "nitinjha909@gmail.com",
        "contact": "95880800400",
      },
      "name": "Pay",
      "external": {
        "wallets": ["payment"]
      }
    };
    try {
      razorpay.open(option);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void handlerPaymentSuccesful() {
    print("Payment SuccesFul");
  }

  void handlerPaymentError() {
    print("Payment Error");
  }

  void handlerPaymentExternal() {
    print("Payment External");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.yellow,
              Colors.white,
            ])),
        child: Padding(
          padding: const EdgeInsets.only(top: 120.0),
          child: Column(
            children: <Widget>[
              Text("Are You Confrom For this Payment?"),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  widget.product_price_final,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 120,
              ),
              FlatButton(
                onPressed: () {
                  openChecout();
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19)),
                child: Text("Procced"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
