import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class FavouritesPage extends StatefulWidget {
  FavouritesPage(this._favourites, this.onUnFavourited);

  final List<WordPair> _favourites;
  final ValueChanged<WordPair> onUnFavourited;

  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  List<WordPair> _list;

  @override
  void initState() {
    super.initState();
    _list = widget._favourites;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
      ),
      body: ListView.separated(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          WordPair box = _list[index];
          return ListTile(
            onTap: () {
              widget.onUnFavourited(box);
              setState(() {
                _list.remove(box);
              });
            },
            title: Text(
              box.asPascalCase,
              style: TextStyle(fontSize: 18),
            ),
            trailing: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}
