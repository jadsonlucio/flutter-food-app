import 'package:flutter/material.dart';
import 'package:food_app/core/app_colors.dart';
import 'package:food_app/core/app_text_styles.dart';

class FavoriteWidget extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  final String image;
  final Function onRemoveProduct;

  const FavoriteWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.onRemoveProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black45.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(-4, -4), // changes position of shadow
          ),
          BoxShadow(
            color: Colors.black45.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(4, 4), // changes position of shadow
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(flex: 3, child: Image.asset(this.image)),
          Expanded(
            flex: 9,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      this.title,
                      style: AppTextStyles.itemtitle17,
                    ),
                    InkWell(
                      onTap: () {
                        this.onRemoveProduct();                  
                      },
                      child: Container(      
                        width: 40,
                        height: 40,               
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: new BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45.withOpacity(0.20),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: Offset(4, 4),
                            ),
                          ],                       
                        ),
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.red[800],
                          size: 25,
                        )
                      )
                    ),   
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      this.description,
                      style: AppTextStyles.subtitleMediumd14,
                    ), 
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${this.price}",
                      style: AppTextStyles.itemtitle17,
                    ),
                  ],
                ),
              ],
              
            ),
          )
        ],
      ),
    );
  }
}
