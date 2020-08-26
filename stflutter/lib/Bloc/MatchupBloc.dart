import '../Widgets/MatchUpWidget.dart';
import 'dart:async';
import '../Persistent/CoreInfo.dart';

class MatchUpsBloc{
  final _matchUpFetcher=StreamController<List<MatchUpWidget>>.broadcast();
  Stream<List<MatchUpWidget>> get matchup => _matchUpFetcher.stream;

  void AddMatchUp(List Data){
    List<MatchUpWidget> _templist=[];
    print ('D');
    print (Data);
    for (var i=0;i<Data.length;i++){

      _templist.add(

          MatchUpWidget(Primaryname: Data[i]['primarycharactername'], Primarypicture: Data[i]['primarypicture'], Matchup: Data[i]['matchup'],Secondname: Data[i]['secondcharactername'],Secondpicture: Data[i]['secondpicture'],));
    }
    _matchUpFetcher.sink.add(_templist);
  }
  dispose(){

    _matchUpFetcher.close();
  }
}

MatchUpsBloc AMatchUp=MatchUpsBloc();