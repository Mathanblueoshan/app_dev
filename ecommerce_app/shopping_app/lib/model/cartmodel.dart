import 'package:flutter/material.dart';
import 'package:shopping_app/model/shoemodel.dart';

class Cart extends ChangeNotifier {
  //list of shoes
  List<Shoe> ShoeShop = [
    Shoe(
        name: 'mr.red',
        price: "230",
        imagePath: "lib/images/shoe1.png",
        description:
            "Shoes specific to the sport of basketball were developed by Chuck Taylor, and are popularl"),
    Shoe(
        name: 'mr.Yellow',
        price: "1030",
        imagePath: "lib/images/shoe3.png",
        description:
            " the same year and produced rubber-soled and heeled shoes under a variety of brand names, "),
    Shoe(
        name: 'mr.Grey',
        price: "537",
        imagePath: "lib/images/shoe4.png",
        description:
            "These shoes often utilize materials like rubber to achieve this purpose.[65] The earliest "),
    Shoe(
        name: 'mr.Blue',
        price: "2650",
        imagePath: "lib/images/shoe5.jpg",
        description:
            " shoes have been made from leather, wood or canvas, but are increasingly being made from rub"),
    Shoe(
        name: 'mr.king',
        price: "300",
        imagePath: "lib/images/shoe6.jpeg",
        description:
            "shoes made by famous designers may be made of expensive materials, use complex construction "),
  ];

  //list of items in user cart
  List<Shoe> userCart = [];

  //list of Shoes for sale
  List<Shoe> getShoeList() {
    return ShoeShop;
  }

  //get cart
  List<Shoe> getUserCart() {
    return userCart; //initially empty list
  }

  //add items to cart

  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove items to cart

  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);

    notifyListeners();
  }
}
