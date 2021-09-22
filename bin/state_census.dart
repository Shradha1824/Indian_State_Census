import 'dart:convert';
import 'dart:io';

void main(List<String> args) {
  var stateCensus = StateCensusAnalyser('', '', '', '');
  stateCensus.loadStateCensusData();
}

class StateCensusAnalyser {
  late String State;
  late String Population;

  late String AreaInSqKm;
  late String DensityPerSqKm;
  StateCensusAnalyser(
      this.State, this.Population, this.AreaInSqKm, this.DensityPerSqKm);

  StateCensusAnalyser.fromList(List<String> cols)
      : this(cols[0], cols[1], cols[2], cols[3]);

  @override
  String toString() {
    return 'StateCensusAnalyser{State:$State, Population : $Population, AreaInSqKm :$AreaInSqKm, DensityPerSqKm: $DensityPerSqKm}';
  }

  void loadStateCensusData() {
    try {
      final file = File('StateCensusData.csv');
      Stream<List> inputStream = file.openRead();
      inputStream.transform(utf8.decoder).transform(LineSplitter()).listen(
          (String line) {
        List row = line.split(',');

        String State = row[0];
        String Population = row[1];
        String AreaInSqKm = row[2];
        String DensityPerSqKm = row[3];

        print('State: $State');
        print('Population: $Population');
        print('AreainSqkm: $AreaInSqKm');
        print('DensityPerSqKm: $DensityPerSqKm');
      }, onDone: () {
        print('File is now closed.');
      }, onError: (e) {
        print(e.toString());
      });
    } catch (e) {
      throw Exception();
    }
  }
}
