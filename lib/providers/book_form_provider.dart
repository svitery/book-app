import 'package:flutter/material.dart';

import 'package:books_app/models/book.dart';

class BookFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Book book;

  BookFormProvider( this.book );

  void updateRead( bool? value ){
    book.read = value ?? false;
    notifyListeners();
  }

}