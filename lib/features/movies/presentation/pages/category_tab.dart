
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../data/model/movie_model.dart';
import '../bloc/movie/movie_bloc.dart';
import '../bloc/movie/movie_event.dart';
import '../bloc/movie/movie_state.dart';
import '../widgets/dynamic_clipper.dart';
import '../widgets/movie_card.dart';

class CategoryTab extends StatefulWidget {
  final MovieEvent addEvent;

  const CategoryTab(this.addEvent, {super.key});

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab>
    with AutomaticKeepAliveClientMixin {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 0.2, // Shows 5 pages (1/5 of the screen each)
      initialPage: 1000,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  int currentPage = 2;


  @override
  Widget build(BuildContext context) {

    super.build(context);
    return BlocProvider<MovieBloc>(
      create: (context) => sl()..add(widget.addEvent),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (_, state) {
          if (state is MovieLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieDone) {
            return SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: PageView.custom(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    print(state.movies![index % state.movies!.length].title);
                    setState(() {
                      currentPage = index - 1000 + 2; // Adjust for the initial offset
                    });
                  },
                  childrenDelegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final itemIndex = index - 1000 + 2; // Adjust for the initial offset
                      int movieIndex = index % state.movies!.length;
                      return AnimatedBuilder(
                        animation: _pageController,
                        builder: (context, child) {
                          double value = 1.0;
                          if (_pageController.position.haveDimensions) {
                            value = (_pageController.page! - index).abs();
                            value = (1 - (value * 0.3)).clamp(0.5, 1.0);
                          }

                          // Determine if this is the center card
                          bool isCenter = value > 0.99;
                          return Opacity(
                          opacity: value ,
                          child: Transform.translate(
                            offset: Offset(0, 0),
                            child: Transform.rotate(
                              angle: value > 0.8 ? 0.0 :0.0,
                              child: Transform.scale(
                              scale: 3.125 * value,
                              child: AspectRatio(
                                aspectRatio: 0.625,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: isCenter
                                  ? child! // Show full card if it's the center
                                  : ClipRect(
                                    clipper: DynamicClipper(left: index < _pageController.page!, positionX: value),
                                    child: child,
                                  ),
                                ),
                              ),
                            ),
                            ),
                          ),
                        );
                        },
                        child: MovieCard(
                          movieModel: MovieModel.fromEntity(state.movies![movieIndex]),
                        ),
                      );
                    },
                    childCount: state.movies!.length + 2000, // Adjust this count as necessary
                  ),
                ),
              ),
            );
          } else if (state is MovieException) {
            print(state.exception);
          }
          print(state);
          return SizedBox();
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

