import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MarketplaceScreen(),
    );
  }
}

class MarketplaceScreen extends StatelessWidget {
  final List<Product> featureProducts = [
    Product('Camisa Casual', 'lib/assets/images/camisa.png', 29.99),
    Product('Dipirona Monohidratada', 'lib/assets/images/dip.png', 49.99),
    Product('Leite Integral', 'lib/assets/images/leite.png', 5.99),
    Product('Xarope', 'lib/assets/images/xarope.png', 89.99),
  ];

  final List<String> carouselImages = [
    'lib/assets/images/camisa.png',
    'lib/assets/images/dip.png',
    'lib/assets/images/leite.png',
    'lib/assets/images/xarope.png',
    // Add more images as needed  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: const Color.fromARGB(255, 0, 0, 0)),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        title: Text('Produtos Disponiveis'),
      ),
      body: Column(
        children: [
          // Carousel
          CarouselSlider(
            items: carouselImages.map((image) {
              return Image.asset(image);
            }).toList(),
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          ),
          // Featured Products
          Expanded(
            child: ListView.builder(
              itemCount: featureProducts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(featureProducts[index].image),
                  title: Text(featureProducts[index].name),
                  subtitle: Text('\$${featureProducts[index].price}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String image;
  final double price;

  Product(this.name, this.image, this.price);
}
