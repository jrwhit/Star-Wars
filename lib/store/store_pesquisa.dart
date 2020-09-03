import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'store_pesquisa.g.dart';

class PesquisaStore = _PesquisaStore with _$PesquisaStore;

abstract class _PesquisaStore with Store{
  @observable
  TextEditingController textSearch = TextEditingController();
  @observable
  bool isSearching =  false, searchEmpty =  false, isLoading = false;

  @computed
  get isTitle{
    return textSearch.text.isNotEmpty;
  }

  @action
  void setSearching(bool value){
    isSearching = value;
  }
}