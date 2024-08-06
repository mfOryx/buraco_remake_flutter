class NicknamesGenerator {
  static final NicknamesGenerator _instance = NicknamesGenerator._internal();

  factory NicknamesGenerator() {
    return _instance;
  }

  NicknamesGenerator._internal();

  List<String> generateCombinations() {
    const badWords = {'sex', 'cnt', 'fuk','cuk'}; // Add your bad words here
    List<String> combinations = [];

    // Generate combinations of 3 alphabetical characters
    for (var i = 97; i <= 122; i++) { // ASCII code for 'a' to 'z'
      for (var j = 97; j <= 122; j++) {
        for (var k = 97; k <= 122; k++) {
          // Create a combination from the current characters
          String combo = String.fromCharCode(i) + String.fromCharCode(j) + String.fromCharCode(k);

          // Check if the combination has 2 or 1 same characters but not 3
          if (!badWords.contains(combo) && !((i == j && j == k))) {
            combinations.add(combo);
          }
        }
      }
    }

    return combinations;
  }
}
