import 'package:equatable/equatable.dart';
import '../model/book.dart';
enum FilterType { none, author, title }

abstract class BookState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BookInitial extends BookState {}

class BookLoading extends BookState {} // Shimmer/loading state

class BookLoaded extends BookState {
  final List<Book> books;
  final FilterType filterType;
  BookLoaded(this.books, {this.filterType = FilterType.none});

  @override
  List<Object?> get props => [books, filterType];
}
