import 'dart:convert';
import 'dart:io';

void main(List<String> args) {
  var stream = File('D:\StateCensusData.csv').openRead();
  var buffer = StringBuffer();

  stream.transform(utf8.decoder).listen((event) {
    buffer.write(event);
  }, onDone: () => print(buffer.toString()), onError: (e) => print(e));

  print("=================================");

  var stream1 = File('D:\StateCode.csv').openRead();
  var buffer1 = StringBuffer();

  stream1.transform(utf8.decoder).listen((event) {
    buffer.write(event);
  }, onDone: () => print(buffer1.toString()), onError: (e) => print(e));
}
