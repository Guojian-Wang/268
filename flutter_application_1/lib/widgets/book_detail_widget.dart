import 'package:flutter/material.dart';
import '../model/book.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        backgroundColor: const Color.fromARGB(255, 155, 198, 235), // Same as home
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(book.localImagePath, height: 400), // Replace with local image
            const SizedBox(height: 20),
            Text(
              book.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text("Author: ${book.author}"),
            const SizedBox(height: 10),
            Text("Published: ${book.publicationDate}"),
            const SizedBox(height: 10),
            Text("Description: ${book.description}"),
            
          ],
        ),
      ),
    );
  }
}
