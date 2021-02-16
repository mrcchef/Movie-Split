part of 'movie_crousel_bloc.dart';

abstract class MovieCrouselEvent extends Equatable {
  const MovieCrouselEvent();

  @override
  List<Object> get props => [];
}

class CrouselLoadEvent extends MovieCrouselEvent {
  final int defaultIndex;

  const CrouselLoadEvent({this.defaultIndex = 0})
      : assert(defaultIndex >= 0, 'default index can not be less that 0');

  List<Object> get props => [defaultIndex];
}
