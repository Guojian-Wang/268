import 'package:bloc/bloc.dart';
import '../model/book.dart';
import 'book_event.dart';
import 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookInitial()) {
    on<LoadBooks>(onLoadBooks);
    on<FilterByAuthor>(onFilterByAuthor);
    on<FilterByTitle>(onFilterByTitle);

    // Automatically load books on initialization
    add(LoadBooks([]));
  }

  void onLoadBooks(LoadBooks event, Emitter<BookState> emit) async {
    emit(BookLoading());
    await Future.delayed(Duration(milliseconds: 500));
    emit(BookLoaded(getInitialBooks())); // Default filterType will be used
  }

  void onFilterByAuthor(FilterByAuthor event, Emitter<BookState> emit) async {
    if (state is BookLoaded) {
      List<Book> books = List<Book>.from((state as BookLoaded).books);
      books.sort((a, b) => a.author.compareTo(b.author));
      emit(BookLoading());
      await Future.delayed(Duration(milliseconds: 300));
      emit(BookLoaded(books, filterType: FilterType.author)); // Set filterType to author
    }
  }

  void onFilterByTitle(FilterByTitle event, Emitter<BookState> emit) async {
    if (state is BookLoaded) {
      List<Book> books = List<Book>.from((state as BookLoaded).books);
      books.sort((a, b) => a.title.compareTo(b.title));
      emit(BookLoading());
      await Future.delayed(Duration(milliseconds: 300));
      emit(BookLoaded(books, filterType: FilterType.title)); // Set filterType to title
    }
  }

  List<Book> getInitialBooks() {
  return [
    Book(
      title: "1984",
      author: "George Orwell",
      description: "A dystopian novel depicting a terrifying, suffocating, totalitarian society focused on the pursuit of power.",
      localImagePath: "assets/images/1984.jpg",
      publicationDate: "1949",
    ),
    Book(
      title: "A Brief History of Time",
      author: "Stephen Hawking",
      description: "An exploration of the core secrets of time and space, a cutting-edge read on the nature of the universe.",
      localImagePath: "assets/images/A Brief History of Time.jpg",
      publicationDate: "1988",
    ),
    Book(
      title: "A Heartbreaking Work of Staggering Genius",
      author: "Dave Eggers",
      description: "A memoir redefining the 21st-century family story, written by a college senior.",
      localImagePath: "assets/images/A Heartbreaking Work of Staggering Genius.jpg",
      publicationDate: "2000",
    ),
    Book(
      title: "A Long Way Gone: Memoirs of a Boy Soldier",
      author: "Ishmael Beah",
      description: "A harrowing memoir of a child soldier during the civil war in Sierra Leone, highlighting the realities of war and recovery.",
      localImagePath: "assets/images/A Long Way Gone.jpg",
      publicationDate: "2007",
    ),
    Book(
      title: "The Bad Beginning: Or, Orphans!",
      author: "Lemony Snicket",
      description: "A children's book that reveals a unique perspective on the world through the eyes of orphans.",
      localImagePath: "assets/images/The Bad Beginning.jpg",
      publicationDate: "1999",
    ),
    Book(
      title: "A Wrinkle in Time",
      author: "Madeleine L'Engle",
      description: "A globally popular young adult book that inspires imagination and creativity.",
      localImagePath: "assets/images/A Wrinkle in Time.jpg",
      publicationDate: "1962",
    ),
    Book(
      title: "Selected Stories 1968-1994",
      author: "Alice Munro",
      description: "A collection of 28 stories spanning nearly 30 years, showcasing Munro's wisdom and emotional depth.",
      localImagePath: "assets/images/Selected Stories 1968-1994.jpg",
      publicationDate: "1996",
    ),
    Book(
      title: "Alice's Adventures in Wonderland & Through the Looking-Glass",
      author: "Lewis Carroll",
      description: "A unique coming-of-age story of a girl and her adventures in a fantastical underground world.",
      localImagePath:"assets/images/Alice's Adventures in Wonderland & Through the Looking-Glass.jpg",
      publicationDate: "1865",
    ),
  ];
}
}
