import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/common/constants/languages.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/entities/language_entity.dart';
import 'package:flutter_movie/domain/entities/no_params.dart';
import 'package:flutter_movie/domain/usecases/get_preferred_language.dart';
import 'package:flutter_movie/domain/usecases/update_preferred_language.dart';

part 'language_event.dart';
part 'language_state.dart';

// converting bloc to cubit emmiting the states
class LanguageCubit extends Cubit<LanguageState> {
  final GetPreferredLanguage getPreferredLanguage;
  final UpdatePreferredLanguage updatePreferredLanguage;

  LanguageCubit({
    @required this.getPreferredLanguage,
    @required this.updatePreferredLanguage,
  }) : super(LanguageChanged(locale: Locale(Languages.language[0].code)));

  void toggleLanguageEvent(LanguageEntity languageEntity) async {
    await updatePreferredLanguage(languageEntity.code);
    loadPreferredLanguageEvent();
  }

  void loadPreferredLanguageEvent() async {
    final response = await getPreferredLanguage(NoParams());
    emit(response.fold((error) => LanguageError(appErrorType: error.errorType),
        (langauageCode) => LanguageChanged(locale: Locale(langauageCode))));
  }

  // @override
  // Stream<LanguageState> mapEventToState(
  //   LanguageEvent event,
  // ) async* {
  //   if (event is ToggleLanguageEvent) {
  //     await updatePreferredLanguage(event.languageEntity.code);
  //     add(LoadPreferredLanguageEvent());
  //   } else if (event is LoadPreferredLanguageEvent) {
  //     final response = await getPreferredLanguage(NoParams());
  //     yield response.fold(
  //         (error) => LanguageError(appErrorType: error.errorType),
  //         (langauageCode) => LanguageChanged(locale: Locale(langauageCode)));
  //   }
  // }
}
