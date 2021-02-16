import 'package:flutter/services.dart';
import 'package:flutter_movie/presentation/widgets/movie_app.dart';
import 'package:pedantic/pedantic.dart';
import 'package:flutter/material.dart';

import 'package:flutter_movie/dipendencies/get_it.dart' as getIt;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(getIt.init());
  // runApp(MovieApp());
}
