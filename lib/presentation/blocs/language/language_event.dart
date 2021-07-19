part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class ToggleLanguageEvent extends LanguageEvent {
  final LanguageEntity languageEntity;
  ToggleLanguageEvent({required this.languageEntity});

  List<Object> get props => [languageEntity.code];
}

class LoadPreferredLanguageEvent extends LanguageEvent {}
