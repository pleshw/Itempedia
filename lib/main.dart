import 'package:flutter/material.dart';
import 'Components/ItemList.dart';
import 'GameClasses/Item.dart';

var catalog = new Map<String, Item>();

// Create and return a new item.
Item makeItem(String name, String brief, {double price = 0, String imgUrl}) {
  Item item = new Item(name, brief, price: price, imageUrl: imgUrl);
  return item;
}

// Add an item to the catalog if that item doesn't already exist.
bool catalogItem(Item item) {
  if (catalog.containsKey(item.name())) return false;
  catalog[item.id()] = item;
  return true;
}


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    catalogItem(makeItem("Pow-Pow", "An wild gun.",
        price: 20000, imgUrl: "assets/images/Pow-Pow.jpg"));

    catalogItem(makeItem("Fishbones", "An wild gun.",
        price: 20000, imgUrl: "assets/images/Fishbones.jpg"));

    catalogItem(makeItem("Bug-Game", "[][[]]~~[[]´´[]{}^``Ç",
        price: 99999999999999, imgUrl: "assets/images/NotFound.png"));

    return MaterialApp(
      title: 'Itempedia',
      home: ItemList( catalog ),
    );
  }
}
