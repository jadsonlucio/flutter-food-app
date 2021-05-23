import 'dart:html';

import 'package:flutter/material.dart';
import 'package:food_app/core/app_image.dart';
import 'package:food_app/core/app_text_styles.dart';
import 'package:food_app/screens/favorites/favorites_controller.dart';
import 'package:food_app/screens/favorites/widgets/card_favorite_widget.dart';
import 'package:provider/provider.dart';
import 'package:food_app/models/product.dart';

import '../../core/app_text_styles.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  late FavoritesController controller;

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<FavoritesController>(context);
    return Column(
      children: [
        Title(
            color: Colors.black,
            child: Container(
                padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
                child: Text(
                  "Favorites",
                  style: AppTextStyles.tabtitle,
                ))),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: controller.listFavoritesNotifier,
                  builder: (context, List<Product> value, _) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        var product = value[index];
                        return FavoriteWidget(
                          title: product.name,
                          description: product.description,
                          image: product.imageUrl,
                          price: product.price,
                          onRemoveProduct: () {
                            controller.removeProduct(index: index);
                            this.setState(() {});
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
