// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$validityAtom = Atom(name: 'HomeStoreBase.validity');

  @override
  bool get validity {
    _$validityAtom.reportRead();
    return super.validity;
  }

  @override
  set validity(bool value) {
    _$validityAtom.reportWrite(value, super.validity, () {
      super.validity = value;
    });
  }

  @override
  String toString() {
    return '''
validity: ${validity}
    ''';
  }
}
