import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search_sample/src/bloc/movie_bloc.dart';
import 'package:movie_search_sample/src/cubit/movie_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('영화 검색')),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              context.read<MovieBloc>().add(SearchMovieEvent(value));
            },
          ),
          Expanded(
            child:
                BlocBuilder<MovieBloc, List<String>>(builder: (context, state) {
              return ListView.separated(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(state[index]),
                ),
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey,
                ),
                itemCount: state.length,
              );
            }),
          )
        ],
      ),
    );
  }
}
