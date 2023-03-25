// ignore_for_file: prefer_const_constructors, file_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:shopping_app/Controller/cart_controller.dart';
import 'package:shopping_app/DataBase/Model/products_model.dart';
// import 'package:shopping_app/Screens/CartScreen/Cart.dart';

class WShoes extends StatefulWidget {
  const WShoes({Key key}) : super(key: key);

  @override
  State<WShoes> createState() => _WShoesState();
}

class _WShoesState extends State<WShoes> {
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Womens Shoes",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(5),
                alignment: Alignment.center,
                constraints: BoxConstraints.expand(height: 200),
                child: imageSlider(context)),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                scrollDirection: Axis.vertical,
                itemCount: Product.womenShoes.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.network(Product.womenShoes[index].images,
                          height: 90),
                      Text(Product.womenShoes[index].name,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      Text("\u{20B9}${Product.womenShoes[index].price}",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 15)),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black38, elevation: 2.0),
                          onPressed: () {
                            cartController
                                .addProduct(Product.womenShoes[index]);
                          },
                          child: Text("Add To Cart",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)))
                    ],
                  );
                }),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                // Get.to(() => Cart());
              },
              child: Text("Go to cart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600)))
        ],
      ),
    );
  }
}

Swiper imageSlider(context) {
  return Swiper(
    autoplay: true,
    itemBuilder: (BuildContext context, int index) {
      return Image.asset('assets/Images/discount.jpg');
    },
    itemCount: 5,
    viewportFraction: 0.7,
    scale: 0.8,
  );
}
