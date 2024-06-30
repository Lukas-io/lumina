import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumina/features/movies/presentation/bloc/movie/movie_bloc.dart';
import 'package:lumina/features/movies/presentation/bloc/movie/movie_event.dart';
import 'package:lumina/features/movies/presentation/bloc/movie/movie_state.dart';

import '../../../../injection_container.dart';
import '../../data/model/movie_model.dart';
import '../widgets/custom_tab_bar.dart';
import '../widgets/movie_card.dart';

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
  final int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: 0.7,
    );
    super.initState();
  }

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
            return Column(
              children: [
                SizedBox(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  child: AspectRatio(
                    aspectRatio: 0.85,
                    child: PageView.builder(
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return MovieCard(
                            movieModel:
                                MovieModel.fromEntity(state.movies![index]));
                      },
                      itemCount: state.movies!.length,
                    ),
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
