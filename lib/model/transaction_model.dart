import 'package:flutter/material.dart';

class TransactionModel {
  final Color? background;
  final String? image;
  final String? title;
  final String? subTitle;
  final String? price;
  final String? time;

  TransactionModel(this.background, this.image, this.title, this.subTitle,
      this.price, this.time);
}