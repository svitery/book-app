import 'package:flutter/material.dart';

import 'package:books_app/screens/screens.dart';

class AppRoutes {

  static const initialRoute = 'home';

  static Map<String, Widget Function(BuildContext)> routes = {
    'home': ( BuildContext context ) => const HomeScreen(),
    'book_form': ( BuildContext context ) => BookFormScreen()
  };

}