import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:system_vote/app/services/shared_local_storage.dart';

part 'feed_store.g.dart';

class FeedStore = FeedStoreBase with _$FeedStore;

@observable
abstract class FeedStoreBase with Store {
  final SharedLocalStore _sharedLocalStore;

  FeedStoreBase(this._sharedLocalStore);

  @observable
  Future<List> posts = Future.value([]);

  Future<void> logout() async {
    await _sharedLocalStore.delete("id");

    Modular.to.navigate('/');
  }
}
