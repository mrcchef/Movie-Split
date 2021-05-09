import 'package:flutter/services.dart';
import 'package:flutter_movie/data/tables/movie_table.dart';
import 'package:pedantic/pedantic.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'package:flutter_movie/presentation/widgets/movie_app.dart';
import 'package:flutter_movie/dipendencies/get_it.dart' as getIt;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  await Hive.initFlutter();
  Hive.registerAdapter(MovieTableAdapter());
  unawaited(getIt.init());
  // Box box = await Hive.openBox(name);
  runApp(MovieApp());
}
