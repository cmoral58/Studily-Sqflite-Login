import 'package:flutter/material.dart';
import 'package:Studily/data/repository.dart';
import 'package:Studily/models/Book.dart';
import 'package:Studily/widgets/book_card_compact.dart';

abstract class StampCollectionPageAbstractState<T extends StatefulWidget>
    extends State<T> {
  List<Book> items = new List();

  @override
  void initState() {
    super.initState();
    Repository.get().getFavoriteBooks().then((books) {
      setState(() {
        items = books;
      });
    });
  }
}
