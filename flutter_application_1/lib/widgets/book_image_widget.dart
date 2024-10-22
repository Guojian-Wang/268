import 'package:flutter/material.dart';
import '../model/book.dart';

class BookImageWidget extends StatelessWidget {
  final Book book;

  const BookImageWidget({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Image.asset(
          book.localImagePath, // Load the image from local assets
          fit: BoxFit.cover,
          width: 100,
          height: 150,
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.broken_image, size: 100);
          },
        ),
        SizedBox(height: 8),
        // Book title
        Container(
          width: 100, // Align the width of the title with the image
          child: Text(
            book.title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis, // Ellipsis if the text overflows
          ),
        ),
      ]
    );
  }
}

