import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/models/photo.dart';
import 'package:wallpaper_app/widgets/widget.dart';
import 'package:http/http.dart' as http;

class CategoriesScreen extends StatefulWidget {
  final String catName;
  CategoriesScreen(this.catName);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<PhotosModel> photos = List<PhotosModel>.empty(growable: true);
  ScrollController _scrollController = new ScrollController();
  int noOfImageLoad = 30;

  getCategoriesWallpaper() async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=${widget.catName}&per_page=$noOfImageLoad&page=1"),
        headers: {"Authorization": apiKEY}).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      if (photos.length > 0) photos.clear();
      jsonData["photos"].forEach((element) {
        PhotosModel photosModel = PhotosModel.fromMap(element);
        photos.add(photosModel);
      });
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getCategoriesWallpaper();
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        noOfImageLoad = noOfImageLoad + 30;
        getCategoriesWallpaper();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              Icons.add,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 10),
        controller: _scrollController,
        child: wallPaper(photos, context),
      ),
    );
  }
}
