import 'dart:collection';

import 'package:collection/collection.dart';

class HuffmanCodingAlgorithm {
  String word;
  Map<String, int> freq;
  PriorityQueue<HuffmanNode> queue;
  LinkedHashMap<String, int> frequencyMap;
  Map<String, String> codeMap = {};

  HuffmanCodingAlgorithm(this.word) {
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

    encode(frequencyMap);
  }

  Map encode(Map freq) {
    Map<String, String> result = Map<String, String>();
    queue = PriorityQueue<HuffmanNode>((e1, e2) => e1.freq.compareTo(e2.freq));
    for (String key in frequencyMap.keys) {
      HuffmanNode node = HuffmanNode();
      node.freq = frequencyMap[key];
      node.char = key;
      node.left = null;
      node.right = null;

      queue.add(node);
    }
    HuffmanNode root;
    while (queue.length > 1) {
      HuffmanNode x = queue.removeFirst();

      HuffmanNode y = queue.removeFirst();

      HuffmanNode sumNode = HuffmanNode();
      sumNode.freq = x.freq + y.freq;
      sumNode.char = x.char + y.char;
      sumNode.left = x;
      sumNode.right = y;
      root = sumNode;
      queue.add(sumNode);
    }
    generateCode(root, '');

    return {};
  }

  void generateCode(HuffmanNode node, String binaryNumber) {
    if (node.left == null && node.right == null && node.char.length == 1) {
      codeMap[node.char] = binaryNumber;
      return;
    }
    generateCode(node.left, binaryNumber + '0');
    generateCode(node.right, binaryNumber + '1');
  }
}

class HuffmanNode {
  int freq;
  String char;
  HuffmanNode left;
  HuffmanNode right;
}
