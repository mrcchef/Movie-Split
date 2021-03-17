part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class LanguageChangeEvent extends LanguageEvent {
  final LanguageEntity languageEntity;
  LanguageChangeEvent({this.languageEntity})
      : assert(languageEntity != null, "local can not be null");

  List<Object> get props => [languageEntity.code];
}
