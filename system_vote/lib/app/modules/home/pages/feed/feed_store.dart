import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:mobx/mobx.dart';

part 'feed_store.g.dart';

class FeedStore = FeedStoreBase with _$FeedStore;

@observable
abstract class FeedStoreBase with Store {
  @observable
  Future<List> posts = Future.value([]);

  Future<void> logout() async {
    var sessionManager = SessionManager();
    await sessionManager.destroy();
    Modular.to.navigate('/');
  }
}
