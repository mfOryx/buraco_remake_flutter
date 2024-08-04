import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateTableProvider with ChangeNotifier {

  bool classicToggle = false;
  bool professionalToggle = true;
  bool twoPlayersToggle = true;
  bool fourPlayersToggle = false;
  bool directToggle = true;
  bool indirectToggle = false;
  bool makartCheckbox = true;
  bool pointsOne = true;
  bool pointsTwo = false;
  bool pointsThree = false;
  bool pointsFour = false;
  bool turnTimeOne = true;
  bool turnTimeTwo = false;
  bool turnTimeThree = false;
  bool turnTimeFour = false;
  bool passwordToggle = false;
  bool chatToggle = false;
  String? selectedLevel = "None";
  String? selectedStyle = "assets/cardImagesFront/cards-front-01.png";
  String? selectedDeck = "assets/cardImagesBack/cards-back-01.png";
  String? selectedTable = "assets/tablesImages/table_blue.png";

  bool get getClassicToggle => classicToggle;
  bool get getProfessionalToggle => professionalToggle;
  bool get getTwoPlayersToggle => twoPlayersToggle;
  bool get getFourPlayersToggle => fourPlayersToggle;
  bool get getDirectToggle => directToggle;
  bool get getIndirectToggle => indirectToggle;
  bool get getMakartCheckbox => makartCheckbox;
  bool get getPointsOne => pointsOne;
  bool get getPointsTwo => pointsTwo;
  bool get getPointsThree => pointsThree;
  bool get getPointsFour => pointsFour;
  bool get getTurnTimeOne => turnTimeOne;
  bool get getTurnTimeTwo => turnTimeTwo;
  bool get getTurnTimeThree => turnTimeThree;
  bool get getTurnTimeFour => turnTimeFour;
  bool get getPasswordToggle => passwordToggle;
  bool get getChatToggle => chatToggle;
  String? get getSelectedLevel => selectedLevel;
  String? get getSelectedStyle => selectedStyle;
  String? get getSelectedDeck => selectedDeck;
  String? get getSelectedTable => selectedTable;

  void setClassicToggle(bool value) {
    classicToggle = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setProfessionalToggle(bool value) {
    professionalToggle = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setTwoPlayersToggle(bool value) {
    twoPlayersToggle = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setFourPlayersToggle(bool value) {
    fourPlayersToggle = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setDirectToggle(bool value) {
    directToggle = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setIndirectToggle(bool value) {
    indirectToggle = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setMakartCheckbox(bool value) {
    makartCheckbox = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setPointsOne(bool value) {
    pointsOne = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setPointsTwo(bool value) {
    pointsTwo = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setPointsThree(bool value) {
    pointsThree = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setPointsFour(bool value) {
    pointsFour = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setTurnTimeOne(bool value) {
    turnTimeOne = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setTurnTimeTwo(bool value) {
    turnTimeTwo = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setTurnTimeThree(bool value) {
    turnTimeThree = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setTurnTimeFour(bool value) {
    turnTimeFour = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setPasswordToggle(bool value) {
    passwordToggle = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setChatToggle(bool value) {
    chatToggle = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setSelectedLevel(String value) {
    selectedLevel = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setSelectedStyle(String value) {
    selectedStyle = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setSelectedDeck(String value) {
    selectedDeck = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setSelectedTable(String value) {
    selectedTable = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void toggleSelection(String toggleSelected) {
    switch (toggleSelected) {
        case "classicToggle":
          setClassicToggle(true);
          setProfessionalToggle(false);
          return;
        case "professionalToggle":
          setProfessionalToggle(true);
          setClassicToggle(false);
          return;
        case "twoPlayersToggle":
          setTwoPlayersToggle(true);
          setFourPlayersToggle(false);
          return;
        case "fourPlayersToggle":
          setFourPlayersToggle(true);
          setTwoPlayersToggle(false);
          return;
        case "directToggle":
          setDirectToggle(true);
          setIndirectToggle(false);
          return;
        case "indirectToggle":
          setIndirectToggle(true);
          setDirectToggle(false);
          return;
        case "makartCheckbox":
          setMakartCheckbox(!makartCheckbox);
          return;
        case "turnTimeOne":
          setTurnTimeOne(true);
          setTurnTimeTwo(false);
          setTurnTimeThree(false);
          setTurnTimeFour(false);
          return;
        case "turnTimeTwo":
          setTurnTimeOne(false);
          setTurnTimeTwo(true);
          setTurnTimeThree(false);
          setTurnTimeFour(false);
          return;
        case "turnTimeThree":
          setTurnTimeOne(false);
          setTurnTimeTwo(false);
          setTurnTimeThree(true);
          setTurnTimeFour(false);
          return;
        case "turnTimeFour":
          setTurnTimeOne(false);
          setTurnTimeTwo(false);
          setTurnTimeThree(false);
          setTurnTimeFour(true);
          return;
        case "pointsOne":
          setPointsOne(true);
          setPointsTwo(false);
          setPointsThree(false);
          setPointsFour(false);
          return;
        case "pointsTwo":
          setPointsOne(false);
          setPointsTwo(true);
          setPointsThree(false);
          setPointsFour(false);
          return;
        case "pointsThree":
          setPointsOne(false);
          setPointsTwo(false);
          setPointsThree(true);
          setPointsFour(false);
          return;
        case "pointsFour":
          setPointsOne(false);
          setPointsTwo(false);
          setPointsThree(false);
          setPointsFour(true);
          return;
        default:
          return;
    }
  }

  //**************************** SAVE SETTINGS DATA IN SHARED PREFERENCE *********************
  // loads the data from shared Preferences to state variables and notifyListeners to update the UI
  Future<void> loadOptionsFromSharedPreferences(
      [SharedPreferences? prefs]) async {
    prefs ??= await SharedPreferences.getInstance();

    classicToggle = prefs.getBool('classicToggle') ?? classicToggle;
    professionalToggle = prefs.getBool('professionalToggle') ?? professionalToggle;
    twoPlayersToggle = prefs.getBool('twoPlayersToggle') ?? twoPlayersToggle;
    fourPlayersToggle = prefs.getBool('fourPlayersToggle') ?? fourPlayersToggle;
    directToggle = prefs.getBool('directToggle') ?? directToggle;
    indirectToggle = prefs.getBool('indirectToggle') ?? indirectToggle;
    makartCheckbox = prefs.getBool('makartCheckbox') ?? makartCheckbox;
    turnTimeOne = prefs.getBool('turnTimeOne') ?? turnTimeOne;
    turnTimeTwo = prefs.getBool('turnTimeTwo') ?? turnTimeTwo;
    turnTimeThree = prefs.getBool('turnTimeThree') ?? turnTimeThree;
    turnTimeFour = prefs.getBool('turnTimeFour') ?? turnTimeFour;
    pointsOne = prefs.getBool('pointsOne') ?? pointsOne;
    pointsTwo = prefs.getBool('pointsTwo') ?? pointsTwo;
    pointsThree = prefs.getBool('pointsThree') ?? pointsThree;
    pointsFour = prefs.getBool('pointsFour') ?? pointsFour;
    passwordToggle = prefs.getBool('passwordToggle') ?? passwordToggle;
    chatToggle = prefs.getBool('chatToggle') ?? chatToggle;
    selectedLevel = prefs.getString('selectedLevel') ?? selectedLevel;
    selectedStyle = prefs.getString('selectedStyle') ?? selectedStyle;
    selectedDeck = prefs.getString('selectedDeck') ?? selectedDeck;
    selectedTable = prefs.getString('selectedTable') ?? selectedTable;

    notifyListeners();
  }

  //************************** create a  Settings json string to be sent to server ********************
  Future<String> prepareAllOptionsInJsonFormat( ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> options = {};

    options['classicToggle'] = prefs.getBool('classicToggle') ?? classicToggle;
    options['professionalToggle'] = prefs.getBool('professionalToggle') ?? professionalToggle;
    options['twoPlayersToggle'] = prefs.getBool('twoPlayersToggle') ?? twoPlayersToggle;
    options['fourPlayersToggle'] = prefs.getBool('fourPlayersToggle') ?? fourPlayersToggle;
    options['directToggle'] = prefs.getBool('directToggle') ?? directToggle;
    options['indirectToggle'] = prefs.getBool('indirectToggle') ?? indirectToggle;
    options['makartCheckbox'] = prefs.getBool('makartCheckbox') ?? makartCheckbox;
    options['turnTimeOne'] = prefs.getBool('turnTimeOne') ?? turnTimeOne;
    options['turnTimeTwo'] = prefs.getBool('turnTimeTwo') ?? turnTimeTwo;
    options['turnTimeThree'] = prefs.getBool('turnTimeThree') ?? turnTimeThree;
    options['turnTimeFour'] = prefs.getBool('turnTimeFour') ?? turnTimeFour;
    options['pointsOne'] = prefs.getBool('pointsOne') ?? pointsOne;
    options['pointsTwo'] = prefs.getBool('pointsTwo') ?? pointsTwo;
    options['pointsThree'] = prefs.getBool('pointsThree') ?? pointsThree;
    options['pointsFour'] = prefs.getBool('pointsFour') ?? pointsFour;
    options['passwordToggle'] = prefs.getBool('passwordToggle') ?? passwordToggle;
    options['chatToggle'] = prefs.getBool('chatToggle') ?? chatToggle;
    options['selectedLevel'] = prefs.getString('selectedLevel') ?? selectedLevel;
    options['selectedStyle'] = prefs.getString('selectedStyle') ?? selectedStyle;
    options['selectedDeck'] = prefs.getString('selectedDeck') ?? selectedDeck;
    options['selectedTable'] = prefs.getString('selectedTable') ?? selectedTable;

    return jsonEncode(options);
  }


  //**************************** SAVE SETTINGS DATA IN SHARED PREFERENCE *********************
  void saveOptionsDataInSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('classicToggle', classicToggle);
    await prefs.setBool('professionalToggle', professionalToggle);
    await prefs.setBool('twoPlayersToggle', twoPlayersToggle);
    await prefs.setBool('fourPlayersToggle', fourPlayersToggle);
    await prefs.setBool('directToggle', directToggle);
    await prefs.setBool('indirectToggle', indirectToggle);
    await prefs.setBool('makartCheckbox', makartCheckbox);
    await prefs.setBool('turnTimeOne', turnTimeOne);
    await prefs.setBool('turnTimeTwo', turnTimeTwo);
    await prefs.setBool('turnTimeThree', turnTimeThree);
    await prefs.setBool('turnTimeFour', turnTimeFour);
    await prefs.setBool('pointsOne', pointsOne);
    await prefs.setBool('pointsTwo', pointsTwo);
    await prefs.setBool('pointsThree', pointsThree);
    await prefs.setBool('pointsFour', pointsFour);
    await prefs.setBool('passwordToggle', passwordToggle);
    await prefs.setBool('chatToggle', chatToggle);
    await prefs.setString('selectedLevel', selectedLevel!);
    await prefs.setString('selectedStyle', selectedStyle!);
    await prefs.setString('selectedDeck', selectedDeck!);
    await prefs.setString('selectedTable', selectedTable!);

    if(kDebugMode){
      print("Shared Prefrences changed : ");
    }
    //Prepare the JSON and send it to the server
    //String settingJsonString = await prepareAllSettingsInJsonFormat();
    // Post the JSON to the server
    //  SocketServiceSingleton().emitWithAck(Socketemitkeys.settingsEmit, settingJsonString)  ;
  }

  //***************************************************************************
  //***************************************************************************
  //***************************************************************************
  //***************************************************************************


  //*************************** Load The data from shared Preferences ********************
  //called from optionsButton.dart in start
  Future<void> loadAndSaveOptionsFromAndToSharedPreferences(
      [SharedPreferences? prefs]) async {
    prefs ??= await SharedPreferences.getInstance();

    classicToggle = prefs.getBool('classicToggle') ?? classicToggle;
    professionalToggle = prefs.getBool('professionalToggle') ?? professionalToggle;
    twoPlayersToggle = prefs.getBool('twoPlayersToggle') ?? twoPlayersToggle;
    fourPlayersToggle = prefs.getBool('fourPlayersToggle') ?? fourPlayersToggle;
    directToggle = prefs.getBool('directToggle') ?? directToggle;
    indirectToggle = prefs.getBool('indirectToggle') ?? indirectToggle;
    makartCheckbox = prefs.getBool('makartCheckbox') ?? makartCheckbox;
    turnTimeOne = prefs.getBool('turnTimeOne') ?? turnTimeOne;
    turnTimeTwo = prefs.getBool('turnTimeTwo') ?? turnTimeTwo;
    turnTimeThree = prefs.getBool('turnTimeThree') ?? turnTimeThree;
    turnTimeFour = prefs.getBool('turnTimeFour') ?? turnTimeFour;
    pointsOne = prefs.getBool('pointsOne') ?? pointsOne;
    pointsTwo = prefs.getBool('pointsTwo') ?? pointsTwo;
    pointsThree = prefs.getBool('pointsThree') ?? pointsThree;
    pointsFour = prefs.getBool('pointsFour') ?? pointsFour;
    passwordToggle = prefs.getBool('passwordToggle') ?? passwordToggle;
    chatToggle = prefs.getBool('chatToggle') ?? chatToggle;
    selectedLevel = prefs.getString('selectedLevel') ?? selectedLevel;
    selectedStyle = prefs.getString('selectedStyle') ?? selectedStyle;
    selectedDeck = prefs.getString('selectedDeck') ?? selectedDeck;
    selectedTable = prefs.getString('selectedTable') ?? selectedTable;

    if (kDebugMode) {
      print(">>loadAndSaveSettingsFromAndToSharedPreferences<<<");
    }

    saveOptionsDataInSharedPreferences();

    notifyListeners();
  }

  Future<void> saveOptionsDataFromServerToSharedPreferences(Map<String, dynamic> settings) async {

    bool dataSavedPreviouslyOnServer = false;
    SharedPreferences prefs;
    try{
      prefs = await SharedPreferences.getInstance();

      // if any key is emoty or null then it means there is no settings data on the server
      if (settings.isNotEmpty) {
        dataSavedPreviouslyOnServer = !settings.keys.any((key) =>
        settings.containsKey(key) && (settings[key] != null && settings[key] != ""));
      } else {
        // If settings is null or empty, set noDataSavedPreviouslyOnServer to true
        dataSavedPreviouslyOnServer = false;
      }

      // if there is no data on the server about settings
      if(dataSavedPreviouslyOnServer == false)
      {
        if (kDebugMode) {
          print('>>dataSavedPreviouslyOnServer = false<<')   ;
        }
        // this function will get the data from shared preferences [if exist] ...
        // otherwise get the default data and store again in shared preferences
        loadAndSaveOptionsFromAndToSharedPreferences();
      }
      else {
        //  no need to put ?? and get the value from variable [refactor later...]
        await prefs.setBool('classicToggle', settings['classicToggle'] ?? classicToggle);
        await prefs.setBool('professionalToggle', settings['professionalToggle'] ?? professionalToggle);
        await prefs.setBool('twoPlayersToggle', settings['twoPlayersToggle'] ?? twoPlayersToggle);
        await prefs.setBool('fourPlayersToggle', settings['fourPlayersToggle'] ?? fourPlayersToggle);
        await prefs.setBool('directToggle', settings['directToggle'] ?? directToggle);
        await prefs.setBool('indirectToggle', settings['indirectToggle'] ?? indirectToggle);
        await prefs.setBool('makartCheckbox', settings['makartCheckbox'] ?? makartCheckbox);
        await prefs.setBool('turnTimeOne', settings['turnTimeOne'] ?? turnTimeOne);
        await prefs.setBool('turnTimeTwo', settings['turnTimeTwo'] ?? turnTimeTwo);
        await prefs.setBool('turnTimeThree', settings['turnTimeThree'] ?? turnTimeThree);
        await prefs.setBool('turnTimeFour', settings['turnTimeFour'] ?? turnTimeFour);
        await prefs.setBool('pointsOne', settings['pointsOne'] ?? pointsOne);
        await prefs.setBool('pointsTwo', settings['pointsTwo'] ?? pointsTwo);
        await prefs.setBool('pointsThree', settings['pointsThree'] ?? pointsThree);
        await prefs.setBool('pointsFour', settings['pointsFour'] ?? pointsFour);
        await prefs.setBool('passwordToggle', settings['passwordToggle'] ?? passwordToggle);
        await prefs.setBool('chatToggle', settings['chatToggle'] ?? chatToggle);
        await prefs.setString('selectedLevel', settings['selectedLevel'] ?? selectedLevel);
        await prefs.setString('selectedStyle', settings['selectedStyle'] ?? selectedStyle);
        await prefs.setString('selectedDeck', settings['selectedDeck'] ?? selectedDeck);
        await prefs.setString('selectedTable', settings['selectedTable'] ?? selectedTable);

        // update the state variables and call notify listeners to update the settings UI
        loadOptionsFromSharedPreferences();
      }
    }catch(ex){
      if(kDebugMode){
        print('Exception during saveOptionsDataFromServerToSharedPreferences: $ex');
      }
    }
  }
}