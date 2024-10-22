import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/widgets.dart';

import '../utilites/tags_name.dart';
import '../widget/text_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String name;
  final String price;
  final String description;
  final String image;
  final String id;
  final int index;
  const ProductDetailsScreen({super.key, required this.name, required this.price, required this.description, required this.image, required this.id, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: TextWidget(
          value: name,
          size: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black.withOpacity(0.7),
        ),
        actions: [
          badges.Badge(
            badgeContent: TextWidget(
              value: "5",
              size: 12,
              fontWeight: FontWeight.w700,
              color: Colors.white.withOpacity(0.7),
            ),
            badgeStyle: badges.BadgeStyle(
                badgeColor: Colors.orangeAccent
            ),
            child: Icon(Icons.shopping_cart),
          ),
          SizedBox(width: 20,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: imageTag+index.toString(),
              child: SizedBox(
                  height: 200,
                  width: double.maxFinite,
                  child: Image.network(image.toString(),fit: BoxFit.contain,)),
            ),
            Divider(),
            TextWidget(
              value: name,
              size: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black.withOpacity(0.9),
            ),
            SizedBox(height: 10,),
            TextWidget(
              value: '${price} \$',
              size: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.7),
            ),
            SizedBox(height: 10,),

            TextWidget(
              value: description,
              size: 14,
              fontWeight: FontWeight.w300,
              color: Colors.black.withOpacity(0.7),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: MaterialButton(
          height: 50,
            minWidth: double.maxFinite,
            color: Colors.orangeAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))

            ),
            child:TextWidget(
              value: 'Add to cart',
              size: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white.withOpacity(0.9),
            ) ,
            onPressed: (){

        }),
      ),
    );
  }
}
