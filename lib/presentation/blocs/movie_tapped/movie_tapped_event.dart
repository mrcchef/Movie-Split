part of 'movie_tapped_bloc.dart';

abstract class MovieTappedEvent extends Equatable {
  const MovieTappedEvent();

  @override
  List<Object> get props => [];
}

class TabChangedEvent extends MovieTappedEvent {
  final int tabIndex;

  TabChangedEvent({required this.tabIndex});

  @override
  List<Object> get props => [tabIndex];
}
