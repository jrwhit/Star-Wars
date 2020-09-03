// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_pesquisa.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PesquisaStore on _PesquisaStore, Store {
  Computed<dynamic> _$isTitleComputed;

  @override
  dynamic get isTitle =>
      (_$isTitleComputed ??= Computed<dynamic>(() => super.isTitle,
              name: '_PesquisaStore.isTitle'))
          .value;

  final _$textSearchAtom = Atom(name: '_PesquisaStore.textSearch');

  @override
  TextEditingController get textSearch {
    _$textSearchAtom.reportRead();
    return super.textSearch;
  }

  @override
  set textSearch(TextEditingController value) {
    _$textSearchAtom.reportWrite(value, super.textSearch, () {
      super.textSearch = value;
    });
  }

  final _$isSearchingAtom = Atom(name: '_PesquisaStore.isSearching');

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  final _$searchEmptyAtom = Atom(name: '_PesquisaStore.searchEmpty');

  @override
  bool get searchEmpty {
    _$searchEmptyAtom.reportRead();
    return super.searchEmpty;
  }

  @override
  set searchEmpty(bool value) {
    _$searchEmptyAtom.reportWrite(value, super.searchEmpty, () {
      super.searchEmpty = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_PesquisaStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$_PesquisaStoreActionController =
      ActionController(name: '_PesquisaStore');

  @override
  void setSearching(bool value) {
    final _$actionInfo = _$_PesquisaStoreActionController.startAction(
        name: '_PesquisaStore.setSearching');
    try {
      return super.setSearching(value);
    } finally {
      _$_PesquisaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textSearch: ${textSearch},
isSearching: ${isSearching},
searchEmpty: ${searchEmpty},
isLoading: ${isLoading},
isTitle: ${isTitle}
    ''';
  }
}
