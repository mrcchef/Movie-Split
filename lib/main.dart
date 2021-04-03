import 'dart:html';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_movie/data/tabels/movie_table.dart';
import 'package:pedantic/pedantic.dart';
import 'package:flutter/material.dart';

import 'package:flutter_movie/presentation/widgets/movie_app.dart';
import 'package:flutter_movie/dipendencies/get_it.dart' as getIt;

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(getIt.init());
  final Directory appDirectoryPath =
      await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDirectoryPath.toString());
  Hive.registerAdapter(MovieTableAdapter());

  runApp(MovieApp());
}
