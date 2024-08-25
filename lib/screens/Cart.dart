import 'package:final_project/formatting.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../Provider/cartNotifier.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Formatting design = Formatting();
  void _startCheckout() {
    showDialog(
      context: context,
      builder: (context) {
        return CheckOutBox(); 
      },
    ).then((_) {
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartNotifier = Provider.of<Cartnotifier>(context);

    

    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: const CheckOutBox(),
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: cartNotifier.cartList.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartNotifier.cartList.length,
                    itemBuilder: (context, index) {
                      final item = cartNotifier.cartList[index];
                      return Card(
                        margin: EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(item.title),
                          subtitle: Text(
                            "₹ ${design.toInr(item.price)} x Quantity: ${item.quantity} = ₹ ${design.toInr(item.price) * item.quantity}",
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove_circle),
                                onPressed: () {
                                  cartNotifier.decQty(index);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.add_circle),
                                onPressed: () {
                                  cartNotifier.incQty(index);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

class CheckOutBox extends StatefulWidget {
  const CheckOutBox({super.key});

  @override
  State<CheckOutBox> createState() => _CheckOutBoxState();
}

class _CheckOutBoxState extends State<CheckOutBox> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void openCheckout(double amount) async {
    int amountInPaise = (amount * 100).toInt(); 
    var options = {
      'key': 'rzp_test_QuCbsq1kJTOrdW', 
      'amount': amountInPaise.toString(), 
      'name': 'Test',
      'description': 'Test Payment',
      'prefill': {
        'contact': '123456789',
        'email': 'yourid@gmail.com',
      },
      'external': {
        'wallets': ['paytm'],
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
      msg: "Payment Successful: ${response.paymentId}",
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
      msg: "Payment Failed: ${response.message}",
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
      msg: "External Wallet: ${response.walletName}",
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Cartnotifier>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600;

    return Container(
      height: MediaQuery.of(context).size.height * 0.28,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isWideScreen ? 40 : 30),
      ),
      padding: EdgeInsets.all(isWideScreen ? 30 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SubTotal",
                style: GoogleFonts.playfairDisplay(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(108, 76, 54, 1.0),
                  ),
              ),
              Text(
                "₹ ${provider.totPrice()}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isWideScreen ? 18 : 16,
                ),
              ),
            ],
          ),
          SizedBox(height: isWideScreen ? 15 : 10),
          const Divider(),
          SizedBox(height: isWideScreen ? 15 : 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style:  GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(108, 76, 54, 1.0),
                  ),
              ),
              Text(
                "₹${provider.totPrice()}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isWideScreen ? 20 : 18,
                ),
              ),
            ],
          ),
          SizedBox(height: isWideScreen ? 30 : 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(108, 76, 54, 1.0),
              minimumSize: Size(double.infinity, isWideScreen ? 60 : 55),
            ),
            onPressed: () {
              if (provider.totPrice() > 0) {
                openCheckout(provider.totPrice());
              }
            },
            child: Text(
              "Check Out",
              style:  GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}