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

  Future<String> getSessionId() async {
    Box box = await Hive.openBox(authenticationBox);
    return await box.get('session_id');
  }

  Future<void> deleteSesstionId(String sessionId) async {
    Box box = await Hive.openBox('session_id');
    await box.delete(sessionId);
  }
}
