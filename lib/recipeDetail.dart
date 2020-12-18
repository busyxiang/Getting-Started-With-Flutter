import 'package:flutter/material.dart';
import 'package:food_recipe/imageSlides.dart';

class RecipeDetail extends StatelessWidget {
  final recipeData;

  RecipeDetail(this.recipeData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(this.recipeData['name'])),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ImageSlides(this.recipeData['imageFile']),
            Column(
              children: [
                InfoCard(
                    "Recipe Info", this.recipeData['recipeInfo'], 'keyvalue'),
                InfoCard(
                    "Ingredients", this.recipeData['ingredients'], 'index'),
                InfoCard("Directions", this.recipeData['steps'], 'steps')
              ],
            )
          ]),
        ));
  }
}

class InfoCard extends StatelessWidget {
  final title;
  final contents;
  final type;

  InfoCard(this.title, this.contents, this.type);

  @override
  Widget build(BuildContext context) {
    List<Widget> contentTextList = new List<Widget>();

    if (this.type == 'keyvalue') {
      Map.from(this.contents).forEach((key, value) {
        contentTextList.add(Text(
          "${key}: ${value}",
        ));
      });
    } else if (this.type == 'index') {
      List<String> list = List.from(this.contents);

      for (var i = 0; i < list.length; i++) {
        contentTextList.add(Text("${i + 1}. ${list[i]}"));
      }
    } else if (this.type == 'steps') {
      List<String> list = List.from(this.contents);

      for (var i = 0; i < list.length; i++) {
        contentTextList.add(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Steps ${i + 1}',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text(list[i])
          ],
        ));
      }
    }

    return Center(
        child: Container(
            child: Card(
                shadowColor: Colors.grey[300],
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            this.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          ...contentTextList
                        ])))));
  }
}
