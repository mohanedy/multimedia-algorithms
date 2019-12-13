class SimpleRepetitionAlgorithm {
  final String word;

  SimpleRepetitionAlgorithm(this.word);

  String encode() {
    String result = word;
    for (int i = 0; i < word.length - 1; i++) {
      int count = 1;
      int startIndex = i;
      int endIndex;
      while (word[i] == word[i + 1]) {
        i++;
        count++;
        endIndex = i;
        if (i + 1 == word.length) {
          break;
        }
      }
      if (count > 1) {
        print(result);
        print('start ' + startIndex.toString());
        print('end ' + endIndex.toString());
        print('length ' + word.length.toString());
        result = result.replaceRange(
            startIndex, endIndex + 1, '_' + word[i] + count.toString() + ',');
      }
    }
    print(result);
    return result;
  }

  String decode() {}
}
