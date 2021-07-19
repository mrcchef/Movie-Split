import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class VideoEntity extends Equatable {
  final String title, key, type;

  VideoEntity({required this.title, required this.key, required this.type});
  @override
  List<Object> get props => [title];

  @override
  bool get stringify => true;
}
