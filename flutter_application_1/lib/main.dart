// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/book_bloc.dart';
import 'blocs/book_event.dart';
import 'pages/home_page.dart';

void main() {
  
  runApp(BookClubApp());
}

class BookClubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Club',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => BookBloc()..add(LoadBooks([])), // Initialize and load books
        child: HomePage(),
      ),
    );
  }
}
