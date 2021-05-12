import 'package:hive/hive.dart';

import 'package:flutter_movie/common/constants/global.dart';

abstract class AuthenticationLocalDataSource {
  Future<void> saveSessionId(String sessionId);
}

class AuthenticationLocalDataSourceImpl extends AuthenticationLocalDataSource {
  @override
  Future<void> saveSessionId(String sessionId) async {
    Box box = await Hive.openBox(authenticationBox);
    await box.put('session_id', sessionId);
  }
}
