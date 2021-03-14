import 'package:flutter_movie/domain/entities/language_entity.dart';

class Languages {
  const Languages._();

  static final List<LanguageEntity> language = [
    LanguageEntity(code: 'en', value: 'English'),
    LanguageEntity(code: 'es', value: 'Spanish'),
  ];
}
