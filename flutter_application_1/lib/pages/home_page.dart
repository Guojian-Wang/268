import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/book_bloc.dart';
import '../blocs/book_event.dart';
import '../blocs/book_state.dart';
import '../widgets/book_detail_widget.dart';
import '../widgets/book_image_widget.dart';
import '../widgets/book_loading_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.filter_list), 
          onPressed: () {}, // Define action for the filter icon
        ),
        title: const Text("Book Club Home"),
        backgroundColor: const Color.fromARGB(255, 155, 198, 235), // Custom background color
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle), // User profile icon
            onPressed: () {}, // Define action for the profile icon
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
        children: [
          // Container for the filter buttons
          BlocBuilder<BookBloc, BookState>(
            builder: (context, state) {
              FilterType currentFilter = FilterType.none;
              if (state is BookLoaded) {
                currentFilter = state.filterType;
              }
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Filter by:",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 10), 
                    TextButton(
                      onPressed: () {
                        BlocProvider.of<BookBloc>(context).add(FilterByAuthor());
                      },
                      style: TextButton.styleFrom(
                        side: const BorderSide(color: Colors.black, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: currentFilter == FilterType.author
                            ? const Color.fromARGB(137, 147, 132, 132)
                            : Colors.transparent, // Darken when active
                      ),
                      child: const Text(
                        "Author",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 10), // Add space between buttons
                    TextButton(
                      onPressed: () {
                        BlocProvider.of<BookBloc>(context).add(FilterByTitle());
                      },
                      style: TextButton.styleFrom(
                        side: const BorderSide(color: Colors.black, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: currentFilter == FilterType.title
                            ? const Color.fromARGB(137, 147, 132, 132)
                            : Colors.transparent, // Darken when active
                      ),
                      child: const Text(
                        "Title",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          // Main content of the page
          SizedBox(
            height: 220, 
            child: BlocBuilder<BookBloc, BookState>(
              builder: (context, state) {
                if (state is BookLoading) {
                  return BookLoadingWidget(); // Show shimmer loading
                } else if (state is BookLoaded) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookDetailPage(book: state.books[index]),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: index == 0 ? 10 : 0)
                              .add(const EdgeInsets.symmetric(vertical: 10)),
                          child: BookImageWidget(book: state.books[index]),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 10); // Space between items
                    },
                    itemCount: state.books.length,
                  );
                } else {
                  return const Center(child: Text("No books available."));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
