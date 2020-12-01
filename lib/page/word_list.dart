import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class WordList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(child: Text(wordPair.toString())),
    );
  }
}
