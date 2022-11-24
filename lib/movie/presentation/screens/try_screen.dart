import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/movie/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movie/presentation/controller/movies_event.dart';
import 'package:movies_app/movie/presentation/controller/movies_state.dart';

class TryScreen extends StatelessWidget {
  const TryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context){
          return MoviesBloc(sl(),sl(),sl())..add(GetNowPlayingMoviesEvent());
        },
      child: BlocBuilder<MoviesBloc,MoviesState>(
        builder: (context,state){
          return const Scaffold();
        },
          ),
    );
  }
}
