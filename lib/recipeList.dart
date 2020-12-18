import 'package:flutter/material.dart';
import 'package:food_recipe/recipeDetail.dart';
import 'dart:convert';

class RecipeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Recipe'),
        ),
        body: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/recipeList.json'),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            var jsonData = json.decode(snapshot.data.toString());

            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: jsonData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          child: ListTile(
                            // leading: Image(
                            //     image: AssetImage(
                            //         jsonData[index]['imageFile'][0])),
                            leading: Image.asset(jsonData[index]['imageFile'][0]),
                            title: Text(jsonData[index]['name']),
                            subtitle: Text(jsonData[index]['subtitle']),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RecipeDetail(jsonData[index])));
                            },
                          )),
                    );
                  });
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              return Container();
            }
          },
        ));
  }
}
