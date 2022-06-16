import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:books_app/router/app_routes.dart';
import 'package:books_app/providers/providers.dart';

void main() {
  runApp( BooksApp() );
}

class BooksApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (_) => BookListProvider() )
      ],
      child: _MyApp()
    );
  }
}

class _MyApp extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}