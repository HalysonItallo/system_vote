import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';

part 'post_store.g.dart';

class PostStore = PostStoreBase with _$PostStore;

abstract class PostStoreBase with Store {
  @observable
  bool isLiked = false;
  bool isDisliked = false;

  Future<void> addLike(String idPost) async {
    if (isLiked == false) {
      isLiked = true;
      isDisliked = false;

      var dio = Dio();

      var response = await dio.get('http://10.0.2.2:3333/addLike/$idPost');
      if (response.statusCode == 200) {
        Modular.to.navigate('/feed');
      }
    }
  }

  Future<void> addDislike(String idPost) async {
    if (isDisliked == false) {
      isDisliked = true;
      isLiked = false;

      var dio = Dio();

      var response = await dio.get('http://10.0.2.2:3333/addDislike/$idPost');
      if (response.statusCode == 200) {
        Modular.to.navigate('/feed');
      }
    }
  }
}
