class RLN {
  final String word;

  RLN(this.word);

  List<String> encode() {
    List<String> freq = [];

    for (int i = 0; i < word.length - 1; i++) {
      int count = 1;
      int index = i;
      while (word[i] == word[i + 1]) {
        i++;
        count++;
        if (i + 1 == word.length) break;
      }
      freq.add('(' + word[index].toString() + ',' + count.toString() + ')');
    }

    return freq;
  }

  String decode() {
    final dataList = word.split(' ');
    String res = '';
    for (int i = 0; i < dataList.length; i++) {
      final current = dataList[i].replaceAll('(', '').replaceAll(')', '');

      final arr = current.split(',');
      final repeated = arr[1];
      final char = arr[0];

      final temp = ''.padRight(int.parse(repeated), char);
      res += temp;
    }
    return res;
  }
}
