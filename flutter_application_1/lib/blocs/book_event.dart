import '../model/book.dart';

abstract class BookEvent {}

class LoadBooks extends BookEvent {
  final List<Book> books;
  LoadBooks(this.books);
}

class FilterByAuthor extends BookEvent {}

class FilterByTitle extends BookEvent {}
