import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class MovieCastEntity extends Equatable {
  final String creditId;
  final String name;
  final String posterPath;
  final String character;

  MovieCastEntity({
    required this.creditId,
    required this.name,
    required this.posterPath,
    required this.character,
  });

  List<Object> get props => [creditId];
}
