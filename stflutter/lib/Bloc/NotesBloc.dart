import 'package:flutter/material.dart';
import 'dart:async';
import '../Persistent/CoreInfo.dart';
class NotesBloc{
  final _GenericNotes=StreamController<String>.broadcast();
  final _PersonalNotes=StreamController<String>.broadcast();
  final _WhoseNotes=StreamController<List>.broadcast();

  Stream<String> get GenericNotes => _GenericNotes.stream;
  Stream<String> get PersonalNotes => _PersonalNotes.stream;
  Stream<List> get WhoseNotesG=>_WhoseNotes.stream;

  void AddInfo(String Primary, String Second){
    _WhoseNotes.sink.add([Primary,Second]);
  }


  void AddGeneric(String Notes){
    _GenericNotes.sink.add(Notes);
  }

  void AddPersonal(String Notes){
    if (Notes==null){Notes="";}
    _PersonalNotes.sink.add(Notes);
  }
  dispose(){

    _PersonalNotes.close();
    _GenericNotes.close();
  }
}
NotesBloc ANotes=NotesBloc();