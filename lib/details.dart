import 'package:flutter/material.dart';
import 'package:flutter_project/flower.dart';
import 'package:flutter_project/checkout.dart';

class FlowerDetailsPage extends StatelessWidget {
  final Flower _flower;

  const FlowerDetailsPage(this._flower, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF361650),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFFfaf4f6)),
        title: Text(
          _flower.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFFfaf4f6),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Hero(
                tag: _flower.photo,
                child: Image(
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  image: AssetImage(_flower.photo),
                )
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              _flower.description,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'Price: CAD ${_flower.price.toString()}',
              style: const TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CheckoutPage())
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF361650),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 10,
                ),
              ),
              child: const Text(
                'Buy Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}