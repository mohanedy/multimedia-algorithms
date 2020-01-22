class LZW {
  final String word;

  LZW(this.word);

  Map<String, List> encode() {
    int dictSize = 256;
    List<int> output = [];
    List<String> outputSymbols = [];
    Map<String, int> dict = Map.fromIterables(
        List.generate(dictSize, (index) {
          return String.fromCharCode(index);
        }),
        List.generate(dictSize, (index) {
          return index;
        }));
    String w = '';
    for (String l in word.split('')) {
      String wl = w + l;
      if (dict.containsKey(wl)) {
        w = wl;
      } else {
        output.add(dict[w]);
        outputSymbols.add(w);
        dict[wl] = dictSize;
        dictSize += 1;
        w = l;
      }
    }
    output.add(dict.values.last);
    outputSymbols.add(dict.keys.last);
    return {'sym': outputSymbols, 'code': output};
  }

  Map<String, dynamic> decode() {
    int dictSize = 256;
    List<int> output = [];
    List<String> outputSymbols = [];
    Map<int, String> dict = Map.fromIterables(
      List.generate(dictSize, (index) {
        return index;
      }),
      List.generate(dictSize, (index) {
        return String.fromCharCode(index);
      }),
    );
    final wordInt = word.split(',').map((v) => int.parse(v)).toList();
    String w = String.fromCharCode(wordInt[0]);
    output.add(wordInt.removeAt(0));
    outputSymbols.add(w);
    for (int l in wordInt) {
      String entry = '';
      if (dict.containsKey(l)) {
        entry = dict[l];
      } else if (l == dictSize) {
        entry = w + w[0];
      }
      output.add(l);
      outputSymbols.add(entry);
      dict[dictSize] = w + entry[0];
      dictSize += 1;
      w = entry;
    }

    return {'sym': outputSymbols, 'code': output, 'res': outputSymbols.join()};
  }
}
