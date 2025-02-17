//import 'package:characters/src/extensions.dart';
import 'package:localized_rich_text/localized_rich_text.dart';

extension CustomListLocalizedRichTextKey on List<LocalizedRichTextKey> {
  ///This function return the [List<LocalizedRichTextKey>] ordered by the [text] to localize.
  ///
  ///The `keys` have to be translated in the same order like they are declared in the [text] to localize
  List<LocalizedRichTextKey> orderedByText(List<String> textSplitted) {
    try {
      final Set<LocalizedRichTextKey> keysToFind = Set.from(this);
      final List<LocalizedRichTextKey> _listToReturn = [];

      if (textSplitted.isNotEmpty) {
        String keyFounded = '';

        for (final _ in textSplitted) {
          keyFounded += _;
          if (keysToFind.any((a) => keyFounded.contains(a.key))) {
            final keyToAdd = keysToFind.firstWhere((a) => keyFounded.contains(a.key));
            if (!_listToReturn.contains(keyToAdd)) {
              _listToReturn.add(keyToAdd);
              keysToFind.remove(keyToAdd);
            }
          }
        }
        return _listToReturn;
      }
      return this;
    } catch (e) {
      return this;
    }
  }
}


