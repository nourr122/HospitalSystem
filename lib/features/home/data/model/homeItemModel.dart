import 'package:flutter/material.dart';

class HomeItemModel{
  final String title;
  final Color containerColor;
  final String iconUrl;
  final Widget Function(BuildContext) onTap;
  final String? description;
  HomeItemModel({required this.title, this.description,required this.iconUrl,required this.containerColor, required this.onTap});
}