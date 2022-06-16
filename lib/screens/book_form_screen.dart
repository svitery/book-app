import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:books_app/providers/providers.dart';

class BookFormScreen extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {

    final bookListProvider = Provider.of<BookListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text( 'Agregar Libro' )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ChangeNotifierProvider(
              create: ( _ ) => BookFormProvider( bookListProvider.selectedBook ),
              child: _BookForm()
            )

          ]
        ),
      ),
    );
  }
}

class _BookForm extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final bookForm = Provider.of<BookFormProvider>(context);
    final book = bookForm.book;

    final bookListProvider = Provider.of<BookListProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric( horizontal: 20 ),
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 20 ),
        width: double.infinity,
        child: Form(
          key: bookForm.formKey,
          child: Column(
            children: [
              SizedBox( height: 30 ),
              TextFormField(
                autocorrect: false,
                initialValue: book.title,
                onChanged: ( value ) => book.title = value, 
                decoration: InputDecoration(
                  hintText: 'Título del libro', 
                ),
              ),
              SizedBox( height: 10 ),
              TextFormField(
                autocorrect: false,
                initialValue: book.author,
                onChanged: ( value ) => book.author = value,
                decoration: InputDecoration(
                  hintText: 'Autor del libro', 
                ),
              ),
              SizedBox( height: 10),
              Row(
                children: [
                  Checkbox(
                    value: book.read,
                    onChanged: bookForm.updateRead
                  ),
                  const Text( 'Leído' ),
                ],
              ),
              SizedBox( height: 10),
              MaterialButton(
                shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
                disabledColor: Colors.grey,
                elevation: 5,
                color: Colors.blue,
                child: Text(
                  'Guardar',
                  style: TextStyle( color: Colors.white )
                ),
                onPressed: (){
                  bookListProvider.addOrUpdateBook( book );
                  print('${book.title}, ${book.author}, ${book.read}');
                  Navigator.of( context ).pushNamedAndRemoveUntil(
                    'home',
                    ( Route<dynamic> route ) => false
                  );
                }
              )
            ]
          )
        )
      )
    );
  }
}