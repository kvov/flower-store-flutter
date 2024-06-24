import 'package:flutter/material.dart';
import 'package:flutter_project/flower.dart';
import 'package:flutter_project/details.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final List<Flower> flowers = [
    Flower(
      "Alstroemeria",
      19.99,
      "images/alstromeria.jpg",
      "Pops of color and muted tones, Alstroemeria is the ruler of balance. This perennial has lavender blooms with accents of purple, yellow/cream and white shading, with brown markings of paint strokes.",
    ),
    Flower(
      "Azalea",
      49.99,
      "images/azalea.webp",
      "Deep pink with red freckles, Azalea is an ethereal shrub to behold! Mounding in growth habit, the trumpet-shaped blooms are bountiful and open in nature as another herald of spring.",
    ),
    Flower(
      "Camellia",
      99.99,
      "images/camellia.jpg",
      "Camellia is a delicious and refreshingly sweet, white and red striped flower blossom. This shrub is dense, tight, and upright in growth, with glossy dark green foliage.",
    ),
    Flower(
      "Gardenia",
      59.99,
      "images/gardenia.jpg",
      "Gardenia takes many forms with petals of various shapes and patterns! Its leaves are shiny, green, lance-like in structure. The blossoms are highly fragrant and alluring.",
    ),
    Flower(
      "Hydrangea",
      69.99,
      "images/hydrangea.webp",
      "This blue or pink (depending on soil ph) floret shrub does not disappoint! Besides its beauty, it is believed to be the original due to its ability to flower consistently and for a long period of time.",
    ),
    Flower(
      "Lavandula",
      29.99,
      "images/lavandula.jpg",
      "This perennial represents the light and dark elements we carry within ourselves and mirror out into the world, the highs and lows in the dramas of life if you will.",
    ),
    Flower(
      "Rose",
      49.99,
      "images/rose.jpg",
      "The rose has one large flower per stem. Whether you live in a colder rainy area of the country or the sunshine state, the color will stay true until the petals drop and the plant will reward you with large clean leaves.",
    ),
    Flower(
      "Violet",
      19.99,
      "images/violet.jpg",
      "Violets are one of the world's best known and most popular houseplants. They are compact, low-growing little beauties with delicate, velvety leaves and are available in a myriad of forms and colors.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFbe96ef),
      appBar: AppBar(
        backgroundColor: const Color(0xFF361650),
        centerTitle: true,
        iconTheme: IconThemeData(color: const Color(0xFFfaf4f6)),
        title: Text(
          widget.title, // Using the title passed to the widget
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFfaf4f6),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: flowers.length,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration:
                            const Duration(milliseconds: 500),
                          reverseTransitionDuration:
                            const Duration(milliseconds: 500),
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              FadeTransition(
                                  opacity: animation,
                                  child: FlowerDetailsPage(flowers[index]),
                              )
                      )
                    );
                  },
                  child: Card(
                    color: const Color(0xFFfaf4f6),
                    elevation: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero (
                              tag: flowers[index].photo,
                              child:
                              Image(
                                  width: 100,
                                  height: 100,
                                  image: AssetImage(flowers[index].photo)
                              )
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  flowers[index].name,
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'CAD ${flowers[index].price.toString()}',
                                  style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
