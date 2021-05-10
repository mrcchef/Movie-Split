import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/common/constants/languages.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/entities/language_entity.dart';
import 'package:flutter_movie/domain/entities/no_params.dart';
import 'package:flutter_movie/domain/usecases/get_preferred_language.dart';
import 'package:flutter_movie/domain/usecases/update_preferred_language.dart';
import 'package:http/http.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final GetPreferredLanguage getPreferredLanguage;
  final UpdatePreferredLanguage updatePreferredLanguage;

  LanguageBloc({
    @required this.getPreferredLanguage,
    @required this.updatePreferredLanguage,
  }) : super(LanguageChanged(locale: Locale(Languages.language[0].code)));

  @override
  Stream<LanguageState> mapEventToState(
    LanguageEvent event,
  ) async* {
    if (event is ToggleLanguageEvent) {
      await updatePreferredLanguage(event.languageEntity.code);
      add(LoadPreferredLanguageEvent());
    } else if (event is LoadPreferredLanguageEvent) {
      final response = await getPreferredLanguage(NoParams());
      yield response.fold(
          (error) => LanguageError(appErrorType: error.errorType),
          (langauageCode) => LanguageChanged(locale: Locale(langauageCode)));
    }
  }
}
