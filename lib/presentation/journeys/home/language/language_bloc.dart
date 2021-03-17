import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/common/constants/languages.dart';
import 'package:flutter_movie/domain/entities/language_entity.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc()
      : super(LanguageChanged(locale: Locale(Languages.language[0].code)));

  @override
  Stream<LanguageState> mapEventToState(
    LanguageEvent event,
  ) async* {
    final languageEntity = (event as LanguageChangeEvent).languageEntity;
    yield LanguageChanged(locale: Locale(languageEntity.code));
  }
}
