import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:system_vote/app/interfaces/shared_local_storage_interface.dart';

class SharedLocalStore implements ILocalStorage {
  SessionManager sessionManager;

  SharedLocalStore(this.sessionManager);

  @override
  Future delete(String key) async {
    await sessionManager.remove(key);
    print(sessionManager.containsKey(key));
  }

  @override
  Future get(String key) async {
    return await sessionManager.get(key);
  }

  @override
  Future put(String key, dynamic value) async {
    await sessionManager.set(key, value);
  }
}
