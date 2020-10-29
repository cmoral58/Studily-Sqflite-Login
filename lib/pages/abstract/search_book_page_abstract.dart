import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:Studily/data/repository.dart';
import 'package:Studily/pages/universal/book_notes_page.dart';
import 'package:Studily/models/Book.dart';
import 'package:Studily/utils/utils.dart';
import 'package:Studily/widgets/BookCard.dart';
import 'package:Studily/widgets/book_card_compact.dart';
import 'package:Studily/widgets/book_card_minimalistic.dart';

abstract class AbstractSearchBookState<T extends StatefulWidget>
    extends State<T> {
  List<Book> items = new List();

  final subject = new PublishSubject<String>();

  bool isLoading = false;

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  void _textChanged(String text) {
    if (text.isEmpty) {
      setState(() {
        isLoading = false;
      });
      _clearList();
      return;
    }
    setState(() {
      isLoading = true;
    });
    _clearList();
    Repository.get().getBooks(text).then((books) {
      setState(() {
        isLoading = false;
        if (books.isOk()) {
          items = books.body;
        } else {
          scaffoldKey.currentState.showSnackBar(new SnackBar(
              content: new Text(
                  "Something went wrong, check your internet connection")));
        }
      });
    });
  }

  void _clearList() {
    setState(() {
      items.clear();
    });
  }

  @override
  void dispose() {
    subject.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    subject.stream
        .debounce(new Duration(milliseconds: 600))
        .listen(_textChanged);
  }
}
