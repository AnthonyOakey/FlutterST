import 'package:flutter/material.dart';
import 'dart:async';
import '../Persistent/CoreInfo.dart';
class SavedMatchesBloc{
  List<dynamic>savedlist=[];
  //final _matchUpFetcher=StreamController<List<MatchUpWidget>>.broadcast();
  //Stream<List<MatchUpWidget>> get matchup => _matchUpFetcher.stream;
  //add
// remove



 int GetLength(){
   return savedlist.length;
 }

 void Remove(int i){

 }

}

SavedMatchesBloc ASavedMatches=SavedMatchesBloc();