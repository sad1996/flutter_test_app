import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'favourites_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage(this.title, {this.name});

  final String title;
  final String name;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<WordPair> _words = generateWordPairs().take(20).toList();
  static List<WordPair> _favorites = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.list,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return FavouritesPage(_favorites, (box){
                    onFavouritePressed(box);
                  });
                }));
              },
            )
          ],
        ),
        body: ListView.separated(
          itemCount: _words.length,
          itemBuilder: (context, index) {
            WordPair box = _words[index];
            return ListTile(
              onTap: (){
                onFavouritePressed(box);
              },
              title: Text(
                box.asPascalCase,
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(
                _favorites.contains(box)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: _favorites.contains(box) ? Colors.red : Colors.grey,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ));
  }

  onFavouritePressed(WordPair box) {
    setState(() {
      if (_favorites.contains(box))
        _favorites.remove(box);
      else
        _favorites.add(box);
    });
  }
}
