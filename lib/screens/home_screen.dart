import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:books_app/models/book.dart';
import 'package:books_app/providers/book_list_provider.dart';
import 'package:books_app/router/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final bookListProvider = Provider.of<BookListProvider>(context);
    final bookList = bookListProvider.books;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Books App')
      ),
      body: _HomeBody( bookList: bookList ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bookListProvider.selectedBook = new Book(
            title: '',
            author: '',
            read: false
          );
          Navigator.pushNamed(context, 'book_form');
        },
        backgroundColor: Colors.blue,
        child: const Icon( Icons.add )

      )
    );
  }
}

class _HomeBody extends StatelessWidget {
  _HomeBody({
    Key? key,
    required this.bookList
    }) : super(key: key);

  List<Book> bookList;

  @override
  Widget build(BuildContext context) {
    return bookList.length > 0
    ? _BookList()
    : Center(
      child: Text( 'No hay libros, click en el botón para agregar')
    );
  }
}

class _BookList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final bookListProvider = Provider.of<BookListProvider>(context);
    final bookList = bookListProvider.books;

    return ListView.builder(
      itemCount: bookList.length,
      itemBuilder: (BuildContext context, int i) => Card(
        margin: EdgeInsets.all(10),
        child: ListTile(
          leading: Padding(
            padding: EdgeInsets.all( 10 ),
            child: bookList[i].read
              ? Icon( Icons.check_circle_rounded, color: Colors.green )
              : Icon( Icons.cancel, color: Colors.red )
          ),
          title: Text( bookList[i].title ),
          subtitle: Text( bookList[i].author ),
          tileColor: Colors.blue.withOpacity(0.1),
          contentPadding: EdgeInsets.symmetric(vertical: 20),
          onTap: (){
            bookListProvider.selectedBook = bookList[i];
            Navigator.pushNamed( context, 'book_form');
          }
        )
      )
    );
  }
}