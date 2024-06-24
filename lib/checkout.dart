import 'package:flutter/material.dart';
import 'package:flutter_project/products.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFbe96ef),
      appBar: AppBar(
        backgroundColor: const Color(0xFF361650),
        iconTheme: const IconThemeData(color: Color(0xFFfaf4f6)),
        title: const Text(
          'Checkout',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildInputField('Full Name'),
                const SizedBox(height: 20),
                _buildInputField('Address'),
                const SizedBox(height: 20),
                _buildInputField('Phone'),
                const SizedBox(height: 20),
                _buildInputField('Email'),
                const SizedBox(height: 20),
                _buildInputField('Card Number'),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: _buildInputField('Expiry Date'),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildInputField('CVV'),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Simulate purchase
                      _showPurchaseSuccessDialog(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF361650),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                  ),
                  child: const Text(
                    'Purchase',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String labelText) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFfaf4f6),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: -5,
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $labelText';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 15, vertical: 10),
        ),
      ),
    );
  }

  void _showPurchaseSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            children: [
              Image(
                  width: 250,
                  height: 250,
                  image: AssetImage("images/fireworks.gif")
              ),
              SizedBox(width: 10),

            ],
          ),
          content: const Text(
            'Purchase was successful.',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductsPage(title: 'Our Flowers')),
                );
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.purple,
                ),
              ),
            ),
          ],
          titleTextStyle: const TextStyle(
            color: Colors.black,
          ),
          contentTextStyle: const TextStyle(
            color: Colors.black,
          ),
          actionsPadding: const EdgeInsets.only(right: 16),
          backgroundColor: Colors.white,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
      },
    );
  }

}
