import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MovieParams extends Equatable {
  final int id;

  MovieParams({@required this.id});

  @override
  List<Object> get props => [id];
}
