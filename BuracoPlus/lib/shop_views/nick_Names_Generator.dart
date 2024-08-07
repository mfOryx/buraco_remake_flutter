class NicknamesGenerator {
  static final NicknamesGenerator _instance = NicknamesGenerator._internal(); // Singleton instance

  factory NicknamesGenerator() {
    return _instance; // Return the singleton instance
  }

  NicknamesGenerator._internal(); // Private constructor

  List<String> generateCombinations() {
    const badWords = {'sex', 'cnt', 'fuk', 'cuk'}; // Add your bad words here
    List<String> combinations = [];

    List<int> validChars = [];

    // Add ASCII codes for '0' to '9'
    for (var i = 48; i <= 57; i++) {
      validChars.add(i);
    }

    // Add ASCII codes for 'a' to 'z'
    for (var i = 97; i <= 122; i++) {
      validChars.add(i);
    }

    // Generate combinations of 3 alphanumeric characters
    for (var i in validChars) {
      for (var j in validChars) {
        for (var k in validChars) {
          // Create a combination from the current characters
          String combo = String.fromCharCode(i) + String.fromCharCode(j) + String.fromCharCode(k);

          // Check if the combination has 2 or 1 same characters but not 3
          if (!badWords.contains(combo) && !((i == j && j == k))) {
            combinations.add(combo); // Add valid combination to the list
          }
        }
      }
    }

    // Sort combinations: alphabets first, then alphanumeric
    combinations.sort((a, b) {
      bool isAlpha(String s) => s.codeUnits.every((c) => (c >= 97 && c <= 122));
      bool aIsAlpha = isAlpha(a);
      bool bIsAlpha = isAlpha(b);
      if (aIsAlpha && !bIsAlpha) {
        return -1; // 'a' comes before 'b'
      } else if (!aIsAlpha && bIsAlpha) {
        return 1; // 'b' comes before 'a'
      } else {
        return a.compareTo(b); // Default alphabetical order
      }
    });

    return combinations; // Return the sorted list of valid combinations
  }

  List<String> searchCombinations(String searchValue) {
    List<String> combinations = generateCombinations(); // Get all valid combinations
    List<String> result = [];

    // Check if the searchValue length is 2 or 3
    if (searchValue.length == 2 || searchValue.length == 3) {
      for (String combo in combinations) {
        if (combo.startsWith(searchValue)) { // Check if the combination starts with the search value
          result.add(combo); // Add the matching combination to the result list
        }
      }
    }

    return result; // Return the list of matching combinations
  }
}
