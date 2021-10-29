import 'dart:collection';



// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



class Letter {
  late String letter;
  Letter(String l) {
    if (l.length != 1) {
      throw Exception("Can only be a single letter");
    }
    letter = l;
  }

  @override
  String toString() => letter;
}

class Sentence {
  List<Letter> letters = [];
  void addLetter(Letter? letter) => letters.add(letter!);

  @override
  String toString() => letters.join("");
}

class LetterFactory {
  Map<String, Letter> letters = {};

  Letter? fetchLetter(String l) {
    if (letters.containsKey(l)) {
      return letters[l];
    }
    var letter = Letter(l);
    letters[l] = letter;
    return letter;
  }

  int get lettersCreated => letters.length;
}

class Document {
  LetterFactory letterFactory = LetterFactory();
  int lettersWritten = 0;
  late SplayTreeMap<int, Sentence> sentences;

  Document() {
    sentences = SplayTreeMap<int, Sentence>();
  }

  void export() => sentences.forEach((k, v) => print("$v"));

  void write(int sentenceKey, String letterString) {
    if (!sentences.containsKey(sentenceKey)) {
      sentences[sentenceKey] = Sentence();
    }

    var l = letterFactory.fetchLetter(letterString);
    sentences[sentenceKey]!.addLetter(l);
    lettersWritten++;
  }

  int get lettersCreated => letterFactory.lettersCreated;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Document &&
      other.lettersWritten == lettersWritten &&
      other.sentences == sentences;
  }

  @override
  int get hashCode => lettersWritten.hashCode ^ sentences.hashCode;
}

void main() {
  var doc = Document();

  doc.write(6, "t");
  doc.write(7, "u");
  doc.write(1, "A");
  doc.write(2, "y");
  doc.write(7, "s");
  doc.write(3, "b");
  doc.write(2, "o");
  doc.write(3, "a");
  doc.write(2, "u");
  doc.write(1, "l");
  doc.write(3, "s");
  doc.write(3, "e");
  doc.write(4, "a");
  doc.write(1, "l");
  doc.write(2, "r");
  doc.write(5, "b");
  doc.write(5, "e");
  doc.write(5, "l");
  doc.write(5, "o");
  doc.write(4, "r");
  doc.write(5, "n");
  doc.write(4, "e");
  doc.write(6, "o");
  doc.write(5, "g");

  doc.export();

  print("\r\nDocument wrote: ${doc.lettersWritten}.");
  print("Letters created: ${doc.lettersCreated}.");

  /*
    All
    your
    base
    are
    belong
    to
    us

    Document wrote: 24.
    Letters created: 13.
  */
}
