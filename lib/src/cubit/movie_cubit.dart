import 'package:bloc/bloc.dart';
import 'package:movie_search_sample/src/repository/movie_repository.dart';

class MovieCubit extends Cubit<List<String>> {
  MovieRepository _movieRepository;
  MovieCubit(this._movieRepository) : super([]);

  void search(String key) async {
    var result = await _movieRepository.search(key);
    emit(result);
  }

  @override
  void onChange(Change<List<String>> change) {
    super.onChange(change);
    // print(change);
  }
}
