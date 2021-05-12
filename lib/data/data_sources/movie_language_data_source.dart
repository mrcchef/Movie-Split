import 'package:flutter/material.dart';
import 'package:flutter_movie/common/constants/global.dart';
import 'package:flutter_movie/domain/entities/language_entity.dart';
import 'package:hive/hive.dart';
import 'package:pedantic/pedantic.dart';

abstract class MovieLanguageDataSource {
  Future<String> getPreferredLanguage();
  Future<void> updatePreferredLanguage(String languageCode);
}

class MovieLanguageDataSourceImpl extends MovieLanguageDataSource {
  @override
  Future<String> getPreferredLanguage() async {
    Box box = await Hive.openBox(languageBox);
    return box.get(preferredLanguage);
  }

  @override
  Future<void> updatePreferredLanguage(String languageCode) async {
    Box box = await Hive.openBox(languageBox);
    unawaited(box.put(preferredLanguage, languageCode));
  }
}
