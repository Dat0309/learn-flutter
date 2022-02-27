import 'package:flutter/material.dart';
import 'package:recipesapp/models/category.api.dart';
import 'package:recipesapp/models/category.dart';

class BuildWidgetCategory extends StatefulWidget {
  const BuildWidgetCategory({Key? key}) : super(key: key);

  @override
  _BuildWidgetCategoryState createState() => _BuildWidgetCategoryState();
}

class _BuildWidgetCategoryState extends State<BuildWidgetCategory> {
  List<Category> _categories = List<Category>.empty(growable: true);
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getCate();
  }

  Future<void> getCate() async {
    _categories = await CategoryApi.getCategories();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 45,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (_categories.isNotEmpty) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black45,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: Colors.white,
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.35),
                            BlendMode.multiply,
                          ),
                          image: NetworkImage(_categories[index].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Text(
                        _categories[index].name.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
          separatorBuilder: (BuildContext context, int index) =>
              VerticalDivider(
                color: Colors.transparent,
                width: 5,
              ),
          itemCount: _categories.length),
    );
  }
}
