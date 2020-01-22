import 'dart:math';

class QuantizationService {
  int levels = 0;
  double range;
  double delta;
  final int quantizationBits;
  List<double> sortedSamples;
  String quantizationResult;
  List<String> binaryData = [];
  List<double> resampling = [];
  final List<double> samples;

  List<List<double>> levelsRanges;

  QuantizationService(this.quantizationBits, this.samples) {
    levels = pow(2, quantizationBits);
    sortedSamples = List.from(samples);
    sortedSamples.sort((a, b) => a.compareTo(b));
    range = sortedSamples[sortedSamples.length - 1] - sortedSamples[0];

    delta = range / levels;

    initRanges();
  }

  String binary(int n) {
    String res = "";
    if (n == 0) return '0' * quantizationBits;
    while (n > 0) {
      res = (n % 2).toString() + res;
      n = n ~/ 2;
    }
    if (res.length < quantizationBits) {
      res = res.padLeft(quantizationBits, '0');
    }
    quantizationResult = res;
    return res;
  }

  initRanges() {
    levelsRanges = [];
    double start = sortedSamples[0];
    for (int i = 0; i < levels; i++) {
      levelsRanges.add([start, start + delta]);
      start = start + delta;
    }
  }

  String quantize() {
    String result = '';
    for (int j = 0; j < samples.length; j++) {
      for (int i = 0; i < levels; i++) {
        if (sortedSamples.indexOf(samples[j]) == sortedSamples.length - 1) {
          if (levelsRanges[i][0] <= samples[j] &&
              levelsRanges[i][1] >= samples[j]) {
            result += binary(i);
            binaryData.add(binary(i));
          }
        }
        if (levelsRanges[i][0] <= samples[j] &&
            levelsRanges[i][1] > samples[j]) {
          result += binary(i);
          binaryData.add(binary(i));
        }
      }
    }
    return result;
  }

  double calculateError() {
    double error = 0;
    for (int i = 0; i < binaryData.length; i++) {
      String decimal = int.parse(binaryData[i], radix: 2).toRadixString(10);
      double val = (levelsRanges[int.parse(decimal)][0] +
              levelsRanges[int.parse(decimal)][1]) /
          2;
      resampling.add(val);
      double diff = samples[i] - (val);
      if (diff < 0) diff *= -1;
      error += diff;
    }

    return error;
  }
}
