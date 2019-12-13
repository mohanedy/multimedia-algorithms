import 'dart:collection';

class ArithmeticCoding {
  String word;
  LinkedHashMap<String, double> probSorted;
  Map<String, List<double>> ranges = {};

  ArithmeticCoding(this.word) {
    calculateProb();
  }

  void calculateProb() {
    Map<String, double> prob = {};
    for (int i = 0; i < word.length; i++) {
      int count = 0;
      for (int j = 0; j < word.length; j++) {
        if (word[i] == word[j]) {
          count++;
        }
      }
      prob[word[i]] = count / word.length;
    }

    var sortedKeys = prob.keys.toList(growable: false)
      ..sort((k1, k2) => prob[k2].compareTo(prob[k1]));
    probSorted = LinkedHashMap.fromIterable(sortedKeys,
        key: (k) => k, value: (k) => prob[k]);

    calculateRange('', 0, 1, 1, true);
    print(ranges);
  }

  void calculateRange(
      String w, double low, double high, double range, bool first) {
    if (w == word) {
      return;
    }

    for (String letter in probSorted.keys) {
      if (first) {
        first = false;
        high = low + range * probSorted[letter];
      } else {
        low = high;
        high = low + range * probSorted[letter];
      }

      String temp = w + letter;
      if (temp == word.substring(0, temp.length)) {
        w = w + letter;
        ranges[w] = [low, high];
        break;
      }
    }
    range = high - low;
    calculateRange(w, low, high, range, true);
  }
}
