import 'package:flutter/material.dart';
import 'package:recipesapp/models/category.api.dart';
import 'package:recipesapp/models/category.dart';
import 'package:recipesapp/models/recipe.api.dart';
import 'package:recipesapp/models/recipe.dart';
import 'package:recipesapp/views/recipe_detail.dart';
import 'package:recipesapp/views/widget/recipe_card.dart';

class BuildWidgetCategory extends StatefulWidget {
  const BuildWidgetCategory({Key? key}) : super(key: key);

  @override
  _BuildWidgetCategoryState createState() => _BuildWidgetCategoryState();
}

class _BuildWidgetCategoryState extends State<BuildWidgetCategory> {
  List<Category> _categories = List<Category>.empty(growable: true);
  bool _isLoading = true;
  List<Recipe> _recipes = List<Recipe>.empty(growable: true);

  @override
  void initState() {
    super.initState();
    getCate();
    getRecipes();
  }

  Future<void> getCate() async {
    _categories = await CategoryApi.getCategories();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipes();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> getRecipesByCat(String tag) async {
    _recipes = await RecipeApi.getRecipesByCategory(tag);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          height: 45,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (_categories.isNotEmpty) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isLoading = true;
                          });
                          getRecipesByCat(_categories[index].tag);
                        },
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
        ),
        _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  if (_recipes.isNotEmpty) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RecipeDetail(recipe: _recipes[index]),
                            ));
                      },
                      child: RecipeCard(
                          title: _recipes[index].name,
                          cookTime: _recipes[index].totalTime,
                          rating: _recipes[index].rating.toString(),
                          image: _recipes[index].images),
                    );
                  }
                  return Container();
                },
                separatorBuilder: (BuildContext context, int index) =>
                    VerticalDivider(
                  color: Colors.transparent,
                  width: 5,
                ),
                itemCount: _recipes.length,
              ),
      ],
    );
  }
}
