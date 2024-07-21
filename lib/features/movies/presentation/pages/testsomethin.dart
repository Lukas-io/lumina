import 'package:flutter/cupertino.dart';

import '../../data/model/movie_model.dart';
import '../widgets/movie_card.dart';

class CustomStackedPageView extends StatefulWidget {
  final List<MovieModel> movies;

  CustomStackedPageView({required this.movies});

  @override
  _CustomStackedPageViewState createState() => _CustomStackedPageViewState();
}

class _CustomStackedPageViewState extends State<CustomStackedPageView> {
  late PageController _pageController;
  int currentPage = 1000; // Start at a large number for "infinite" scrolling

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: currentPage,
      viewportFraction: 0.2, // Adjust as needed
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! > 0) {
              // Swipe right
              _pageController.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else if (details.primaryVelocity! < 0) {
              // Swipe left
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
          child: AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              return Stack(
                children: _buildStackedPages(constraints),
              );
            },
          ),
        );
      },
    );
  }

  List<Widget> _buildStackedPages(BoxConstraints constraints) {
    double page = _pageController.hasClients ? _pageController.page! : currentPage.toDouble();
    int centralIndex = page.round();

    List<Widget> stackedPages = [];

    // Build pages in the desired order
    for (int i = -2; i <= 2; i++) {
      int index = (centralIndex + i) % widget.movies.length;
      double scale;
      double horizontalOffset;

      if (i.abs() == 2) {
        scale = 0.7;
        horizontalOffset = i * constraints.maxWidth * 0.35;
      } else if (i.abs() == 1) {
        scale = 0.85;
        horizontalOffset = i * constraints.maxWidth * 0.2;
      } else {
        scale = 1.0;
        horizontalOffset = 0;
      }

      // Adjust vertical position to create stacking effect
      double verticalOffset = 20.0 * i.abs();

      Widget pageWidget = Positioned(
        left: constraints.maxWidth / 2 - (constraints.maxWidth * 0.2 * scale / 2) + horizontalOffset,
        top: verticalOffset,
        child: Transform.scale(
          scale: scale,
          child: SizedBox(
            width: constraints.maxWidth * 0.2,
            child: MovieCard(movieModel: widget.movies[index]),
          ),
        ),
      );

      // Add widgets to the stack in the desired order
      if (i == 0) {
        stackedPages.add(pageWidget);
      } else {
        stackedPages.insert(0, pageWidget);
      }
    }

    return stackedPages;
  }
}