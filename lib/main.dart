import 'dart:html';
import 'dart:io';

import 'package:flutter/services.dart';
<<<<<<< HEAD
import 'package:flutter_movie/data/tables/movie_table.dart';
=======
import 'package:flutter_movie/data/tabels/movie_table.dart';
>>>>>>> e8c7ec1ca93c26cf50311cd7932685b51f4a5a08
import 'package:pedantic/pedantic.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'package:flutter_movie/presentation/widgets/movie_app.dart';
import 'package:flutter_movie/dipendencies/get_it.dart' as getIt;

<<<<<<< HEAD
=======
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

>>>>>>> e8c7ec1ca93c26cf50311cd7932685b51f4a5a08
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  await Hive.initFlutter();
  Hive.registerAdapter(MovieTableAdapter());
  unawaited(getIt.init());
<<<<<<< HEAD
  // Box box = await Hive.openBox(name);
=======
  final Directory appDirectoryPath =
      await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDirectoryPath.toString());
  Hive.registerAdapter(MovieTableAdapter());

>>>>>>> e8c7ec1ca93c26cf50311cd7932685b51f4a5a08
  runApp(MovieApp());
}
