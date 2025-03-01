import 'package:flutter/material.dart';

import '../../../profile/data/model/user_model.dart';

class HomeItemModel{
  final String title;
  final Color containerColor;
  final String iconUrl;
  final Widget Function(BuildContext, UserModel) onTap;
  final String? description;
  HomeItemModel({required this.title, this.description,required this.iconUrl,required this.containerColor, required this.onTap});
}