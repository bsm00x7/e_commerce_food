import 'package:flutter/material.dart';

class ItemModel {
  final String imgPath;
  final String title;
  final double price;
  Color color;

  ItemModel({
    this.color = Colors.white,
    required this.imgPath,
    required this.title,
    required this.price,
  });
}
