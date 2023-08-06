import 'package:flutter/material.dart';

class CardBody {
  VoidCallback? onPressed;
  String? titleLine1;
  String? titleLine2;
  String? titleLine3;
  String? price;
  String? iconTitle;
  String? logoTitle1;
  String? logoTitle2;
  String? logoTitle3;
  String? date;
  String? statusIcon1;
  String? statusIcon2;
  String? statusIcon3;

  CardBody({
    this.onPressed,
    this.titleLine1,
    this.titleLine2,
    this.titleLine3,
    this.price,
    this.iconTitle,
    this.logoTitle1,
    this.logoTitle2,
    this.logoTitle3,
    this.date,
    this.statusIcon1,
    this.statusIcon2,
    this.statusIcon3,
  });
}
