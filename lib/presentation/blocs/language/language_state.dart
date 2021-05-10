part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

class LanguageChanged extends LanguageState {
  final Locale locale;
  LanguageChanged({this.locale});

  List<Object> get props => [locale.languageCode];
}

class LanguageError extends LanguageState {
  final AppErrorType appErrorType;
  LanguageError({this.appErrorType});

  List<Object> get props => [appErrorType];
}
