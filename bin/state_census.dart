import 'dart:convert';
import 'dart:io';

void main(List<String> args) {
  var statecensusany = StateCensusAnalyser();
  statecensusany.loadCsv();

  var statecode = StateCodeAnalyser();
  statecode.loadCsv();
}

class StateCensusAnalyser {
  void loadCsv() {
    var stream = File('D:\StateCensusData.csv').openRead();
    var buffer = StringBuffer();

    stream.transform(utf8.decoder).listen((event) {
      buffer.write(event);
    }, onDone: () => print(buffer.toString()), onError: (e) => print(e));
  }
}

class StateCodeAnalyser {
  void loadCsv() {
    var stream = File('D:\StateCode.csv').openRead();
    var buffer = StringBuffer();

    stream.transform(utf8.decoder).listen((event) {
      buffer.write(event);
    }, onDone: () => print(buffer.toString()), onError: (e) => print(e));
  }
}
