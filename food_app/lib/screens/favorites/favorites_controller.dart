import 'package:flutter/material.dart';
import 'package:food_app/core/app_image.dart';
import 'package:food_app/models/product.dart';

class FavoritesController {
  FavoritesController() {
    
  }

  final listFavoritesNotifier = ValueNotifier<List<Product>>([
    Product(
      name: "Pizza 4 queijos",
      description: "Pizza Grande sabor 4 queijos",
      price: 48.9,
      imageUrl: AppImage.pizza,
    ),
    Product(
      name: "Bolo Chocolate",
      description: "Bolo ",
      price: 50.9,
      imageUrl: AppImage.cake,
    ),
  ]);

  List<Product> get products => listFavoritesNotifier.value;

  void addProduct({required Product product, int quantity = 1}) {
    products.add(product);
    
  }

  void removeProduct({required int index}) {
    products.removeAt(index);
    
  }

}
