import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:system_vote/app/interfaces/shared_local_storage_interface.dart';

class SharedLocalStore implements ILocalStorage {
  SessionManager sessionManager = SessionManager();

  @override
  Future delete(String key) async {
    return await sessionManager.remove(key);
  }

  @override
  Future get(String key) async {
    return await sessionManager.get(key);
  }

  @override
  Future put(String key, dynamic value) async {
    return await sessionManager.set(key, value);
  }
}
