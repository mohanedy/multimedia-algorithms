import 'dart:collection';

class ShannonFanoAlgorithm {
  String word;
  Map<String, int> freq;
  Map codeMap;
  LinkedHashMap frequencyMap;
  ShannonFanoAlgorithm(this.word) {
    calculateFrequency();
  }

  void calculateFrequency() {
    freq = {};

    for (int i = 0; i < word.length; i++) {
      int count = 0;
      freq[word[i]] = count;
      for (int j = 0; j < word.length; j++) {
        if (word[i] == word[j]) {
          freq[word[i]]++;
        }
      }
    }
    var sortedKeys = freq.keys.toList(growable: false)
      ..sort((k1, k2) => freq[k2].compareTo(freq[k1]));
    frequencyMap = new LinkedHashMap.fromIterable(sortedKeys,
        key: (k) => k, value: (k) => freq[k]);

    codeMap = encode(frequencyMap);
  }

  Map encode(Map freq) {
    Map<String, String> result = Map<String, String>();
    List<String> charList = [];
    Iterator entries = freq.entries.iterator;
    while (entries.moveNext()) {
      MapEntry entry = entries.current;
      charList.add(entry.key);
    }

    generateBit(result, charList, true);

    return result;
  }

  void generateBit(Map<String, String> result, List<String> charList, bool up) {
    String bit = "";
    if (result.isNotEmpty) {
      bit = (up) ? "0" : "1";
    }

    for (String c in charList) {
      String s = (result[c] == null) ? "" : result[c];
      result[c] = s + bit;
    }

    if (charList.length >= 2) {
      int separator = (charList.length / 2.0).floor();
      List<String> upList = charList.sublist(0, separator);
      generateBit(result, upList, true);
      List<String> downList = charList.sublist(separator, charList.length);
      generateBit(result, downList, false);
    }
  }
}
