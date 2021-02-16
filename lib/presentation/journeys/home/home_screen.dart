import 'package:flutter/material.dart';
import 'package:flutter_movie/dipendencies/get_it.dart';
import 'package:flutter_movie/presentation/blocs/movie_crousel/movie_crousel_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieCrouselBloc movieCrouselBloc;

  @override
  void initState() {
    super.initState();
    movieCrouselBloc = getItInstance<MovieCrouselBloc>();
    movieCrouselBloc.add(CrouselLoadEvent());
  }

  void dispose() {
    super.dispose();
    movieCrouselBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.6,
            child: Placeholder(
              color: Colors.grey,
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.4,
            child: Placeholder(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
