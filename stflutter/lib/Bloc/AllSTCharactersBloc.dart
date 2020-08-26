import 'package:flutter/material.dart';
import '../Widgets/FGCCardWidget.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import '../Persistent/CoreInfo.dart';
class STCharactersBloc{
  final _characterFetcher=StreamController<List<FGCCard>>.broadcast();
  Stream<List<FGCCard>> get Characters => _characterFetcher.stream;

  void AddCharacters(List Data){
    List<FGCCard> _templist=[];
    for (var i=0;i<Data.length;i++){
      _templist.add(
          FGCCard(name: Data[i]['charactername'], picture: Data[i]['picture']));
    }
      _characterFetcher.sink.add(_templist);
    }
  dispose(){

    _characterFetcher.close();
  }
  }

  STCharactersBloc AllST=STCharactersBloc();


