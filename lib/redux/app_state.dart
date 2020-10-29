import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:Studily/data/repository.dart';
import 'package:Studily/models/Book.dart';

class AppState {
  AppState({this.readBooks});

  final List<Book> readBooks;

  static AppState initState() {
    return new AppState(readBooks: []);
  }
}
