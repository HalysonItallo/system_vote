// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedStore on FeedStoreBase, Store {
  final _$postsAtom = Atom(name: 'FeedStoreBase.posts');

  @override
  Future<List<dynamic>> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(Future<List<dynamic>> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  @override
  String toString() {
    return '''
posts: ${posts}
    ''';
  }
}
