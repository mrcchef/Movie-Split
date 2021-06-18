part of 'movie_tapped_bloc.dart';

// We have declared tabIndex in the abstract class b/c tabIndex is used to
// manage the current tapped tab
// Since we at pops getter it returns the tabIndex and when ever we click on the
// same tab at that time it will not reload b/c bloc will check the current state
// weather it is changed or not and since to check now tabIndex is the parameter
// which will same
abstract class MovieTappedState extends Equatable {
  final int tabIndex;
  const MovieTappedState({this.tabIndex});

  @override
  List<Object> get props => [tabIndex];
}

class MovieTappedInitial extends MovieTappedState {}

class MovieTappedLoaded extends MovieTappedState {
  final List<MovieEntity> movies;

  MovieTappedLoaded({@required tabIndex, @required this.movies})
      : assert(tabIndex >= 0, "tab index should be greater than 0"),
        assert(movies != null, "moives should not be null"),
        super(tabIndex: tabIndex);
}

class MovieTappedError extends MovieTappedState {
  final AppErrorType appErrorType;
  MovieTappedError({this.appErrorType, tabIndex}) : super(tabIndex: tabIndex);
}

class MovieTappedLoadingState extends MovieTappedState {
  MovieTappedLoadingState({@required tabIndex}) : super(tabIndex: tabIndex);
}
