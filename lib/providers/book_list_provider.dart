import 'package:flutter/material.dart';
import 'package:books_app/models/book.dart';

class BookListProvider extends ChangeNotifier{
  
  final List<Book> books = [];
  late Book selectedBook;

  void addOrUpdateBook( Book book ){
    if ( books.contains( book ) ){
      int index = books.indexOf( book );
      books[ index ] = book;
    } else{
      books.add( book );
    }
    //notifyListeners();
  }

}