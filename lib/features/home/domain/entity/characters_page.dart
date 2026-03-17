import 'character.dart';

class CharactersPage {
  final Info info;
  final List<Character> characters;

  CharactersPage({
    required this.info,
    required this.characters,
  });
}

class Info {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  Info({required this.count, required this.pages, this.next, this.prev});
}