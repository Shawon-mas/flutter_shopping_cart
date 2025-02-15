import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_shopping_cart/model/cart_model.dart';
import 'package:flutter_shopping_cart/model/product_model.dart';
import 'package:flutter_shopping_cart/screen/product_details_screen.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import '../database/db_helper.dart';
import '../utilites/tags_name.dart';
import '../widget/text_widget.dart';
import 'cart_screen.dart';

class ProductList extends StatelessWidget {
  ProductList({super.key});
  CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    DBHelper db = DBHelper();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: TextWidget(
          value: "Product Page",
          size: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black.withOpacity(0.7),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.to(() => CartScreen());
            },
            child: badges.Badge(
              badgeContent: GetBuilder<CartController>(
                builder: (cartController) {
                  return TextWidget(
                    value: cartController.getCounter().toString(),
                    size: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white.withOpacity(0.7),
                  );
                }
              ),
              badgeStyle: badges.BadgeStyle(badgeColor: Colors.orangeAccent),
              child: Icon(Icons.shopping_cart),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 175 / 230),
        itemCount: product.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orangeAccent.withOpacity(0.2)),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: imageTag + index.toString(),
                      child: SizedBox(
                          height: 130,
                          width: 150,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.network(
                              product[index].image.toString(),
                              fit: BoxFit.contain,
                            ),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(ProductDetailsScreen(
                          name: product[index].name.toString(),
                          price: product[index].price.toString(),
                          image: product[index].image.toString(),
                          description: product[index].description.toString(),
                          id: product[index].name.toString(),
                          index: index,
                        ));
                      },
                      child: TextWidget(
                        value: product[index].name.toString(),
                        color: Colors.black,
                        size: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              value: "${product[index].price.toString()} \$",
                              color: Colors.black.withOpacity(0.5),
                              size: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            db
                                .insert(Cart(
                              productId: product[index].id,
                              productImage: product[index].image,
                              productPrice: product[index].price,
                              productName: product[index].name,
                            ))
                                .then((value) {
                              print("value:" + value.toString());
                              controller.addTotalPrice(double.parse(
                                  product[index].price.toString()));
                              controller.addCounter();
                              final snackBar = SnackBar(
                                backgroundColor: Colors.green,
                                content: TextWidget(
                                  value: 'Product is added to cart',
                                  color: Colors.white,
                                  size: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                                duration: Duration(seconds: 2),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }).onError((error, stackTrace) {
                              print("Error:" + error.toString());
                              print("stackTrace: " + stackTrace.toString());
                              final snackBar = SnackBar(
                                backgroundColor: Colors.red,
                                content: TextWidget(
                                  value: 'Product is already added to cart',
                                  color: Colors.white,
                                  size: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                                duration: Duration(seconds: 2),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            });
                          },
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.orangeAccent,
                            child: Icon(Icons.add),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
