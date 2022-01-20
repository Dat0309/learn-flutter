import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/models/photo.dart';

Widget wallPaper(List<PhotosModel> photos, BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: photos.map((PhotosModel photosModel) {
        return GridTile(
          child: GestureDetector(
            onTap: () {},
            child: Hero(
              tag: photosModel.src.portrait,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: kIsWeb
                      ? Image.network(
                          photosModel.src.portrait,
                          height: 50,
                          width: 100,
                          fit: BoxFit.cover,
                        )
                      : CachedNetworkImage(
                          imageUrl: photosModel.src.portrait,
                          placeholder: (context, url) => Container(
                            color: Color(0xfff5f8fd),
                          ),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Wallpaper",
        style: TextStyle(
          color: Colors.black87,
          fontFamily: 'Overpass',
        ),
      ),
      Text(
        "Daz",
        style: TextStyle(
          color: Colors.blue,
          fontFamily: 'Overpass',
        ),
      ),
    ],
  );
}