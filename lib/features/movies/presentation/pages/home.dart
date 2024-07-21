import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumina/features/movies/presentation/bloc/movie/movie_bloc.dart';
import 'package:lumina/features/movies/presentation/bloc/movie/movie_event.dart';


import '../../../../injection_container.dart';
import '../widgets/custom_tab_bar.dart';
import 'category_tab.dart';

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
                    title: CustomTabBar(),

                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.8,
                        child:  TabBarView(
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
