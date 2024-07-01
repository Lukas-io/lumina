import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumina/features/movies/presentation/bloc/movie/movie_bloc.dart';
import 'package:lumina/features/movies/presentation/bloc/movie/movie_event.dart';
import 'package:lumina/features/movies/presentation/bloc/movie/movie_state.dart';

import '../../../../injection_container.dart';
import '../widgets/custom_tab_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieBloc>(
      create: (context) => sl()..add(const GetTrending()),
      child: Scaffold(
        body: Stack(
          children: [
            Container(),
            DefaultTabController(
              length: 5,
              child: CustomScrollView(
                slivers: [
                  const SliverAppBar(
                    backgroundColor: Colors.transparent,
                    flexibleSpace: CustomTabBar(),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 1.5,
                        child: const TabBarView(
                          children: [
                            CategoryTab(GetTrending()),
                            CategoryTab(GetUpcomingMovies()),
                            CategoryTab(GetPopularMovies()),
                            CategoryTab(GetTv()),
                            CategoryTab(GetCartoons()),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTab extends StatefulWidget {
  final MovieEvent addEvent;

  const CategoryTab(this.addEvent, {super.key});

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab>
    with AutomaticKeepAliveClientMixin {
  late PageController _pageController;
  final int _currentPage = 6;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: 1 / 3,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<MovieBloc>(
      create: (context) => sl()..add(widget.addEvent),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (_, state) {
          if (state is MovieLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MovieDone) {
            return Column(
              children: [
                SizedBox(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  child: AspectRatio(
                    aspectRatio: 0.85,
                    child: AnimatedBuilder(
                        animation: _pageController,
                        builder: (context, child) {
                          return PageView.builder(
                            controller: _pageController,
                            scrollDirection: Axis.horizontal,
                            padEnds: false,
                            itemBuilder: (context, index) {
                              print(index);
                              double value = 0.0;
                              double translateX =
                                  (MediaQuery.sizeOf(context).width + 200) / 2;

                              print(MediaQuery.sizeOf(context).width / 2);
                              if (_pageController.position.haveDimensions) {
                                // print(_pageController.page);
                                value = index.toDouble() -
                                    (_pageController.page ?? 0);
                                value = value.abs();
                                value = (value * 0.2).clamp(-1, 1);
                                // print("value $value index $index");
                              }
                              return Transform(
                                transform: Matrix4.identity()
                                  ..scale(1 - value)
                                  ..translate(translateX),
                                child: AnimatedOpacity(
                                  duration: Duration(milliseconds: 100),
                                  opacity: 1,
                                  child: Container(
                                    color: Colors.red,
                                    height: 300.0,
                                    width: 363.0 / 545.0 * 300.0,
                                  ),
                                ),
                              );
                            },
                            itemCount: state.movies!.length,
                          );
                        }),
                  ),
                ),
                Container(
                  color: Colors.red,
                  height: 100.0,
                  width: 100.0,
                ),
              ],
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
