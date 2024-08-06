import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/user.dart';
import '../models/logged_in_player.dart';
import '../models/tables.dart';

class CreateTableProvider with ChangeNotifier {
  LoggedInPlayer? user = User().getPlayer();
  String? username;
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
  String? password = "";
  bool chatToggle = false;
  int selectedLevel = 0;
  int selectedStyle = 0;
  int selectedDeck = 0;
  int selectedTable = 0;
  List<TablePlayers> players = [
    TablePlayers(
      playerId: '0',
      ip: '0',
      chairId: 0,
    ),
    TablePlayers(
      playerId: '0',
      ip: '0',
      chairId: 0,
    ),
    TablePlayers(
      playerId: '0',
      ip: '0',
      chairId: 0,
    ),
    TablePlayers(
      playerId: '0',
      ip: '0',
      chairId: 0,
    ),
  ];

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
  String? get getPassword => password;
  bool get getChatToggle => chatToggle;
  int get getSelectedLevel => selectedLevel;
  int get getSelectedStyle => selectedStyle;
  int get getSelectedDeck => selectedDeck;
  int get getSelectedTable => selectedTable;

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

  void setPassword(String value) {
    password = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setChatToggle(bool value) {
    chatToggle = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setSelectedLevel(int value) {
    selectedLevel = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setSelectedStyle(int value) {
    selectedStyle = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setSelectedDeck(int value) {
    selectedDeck = value;
    saveOptionsDataInSharedPreferences();
    notifyListeners();
  }

  void setSelectedTable(int value) {
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
    professionalToggle =
        prefs.getBool('professionalToggle') ?? professionalToggle;
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
    password = prefs.getString('password') ?? password;
    chatToggle = prefs.getBool('chatToggle') ?? chatToggle;
    selectedLevel = prefs.getInt('selectedLevel') ?? selectedLevel;
    selectedStyle = prefs.getInt('selectedStyle') ?? selectedStyle;
    selectedDeck = prefs.getInt('selectedDeck') ?? selectedDeck;
    selectedTable = prefs.getInt('selectedTable') ?? selectedTable;

    notifyListeners();
  }

  //************************** create a  Settings json string to be sent to server ********************
  Future<String> prepareAllOptionsInJsonFormat() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> options = {};

    options['tableName'] = "Table of " + username!;
    options['gameRule'] =
        (prefs.getBool('classicToggle') ?? classicToggle) ? 1 : 2;
    options['numberOfPlayers'] =
        (prefs.getBool('twoPlayersToggle') ?? twoPlayersToggle) ? 2 : 4;
    options['isDirect'] =
        (prefs.getBool('directToggle') ?? directToggle) ? 1 : 0;
    options['isMakart'] =
        (prefs.getBool('makartCheckbox') ?? makartCheckbox) ? 1 : 0;
    options['turnTime'] = (prefs.getBool('turnTimeOne') ?? turnTimeOne)
        ? 15
        : ((prefs.getBool('turnTimeTwo') ?? turnTimeTwo)
            ? 30
            : ((prefs.getBool('turnTimeThree') ?? turnTimeThree)
                ? 45
                : ((prefs.getBool('turnTimeFour') ?? turnTimeFour) ? 60 : 15)));
    options['pointsToWin'] = (prefs.getBool('pointsOne') ?? pointsOne)
        ? "One Hand"
        : ((prefs.getBool('pointsTwo') ?? pointsTwo)
            ? ((prefs.getBool('classicToggle') ?? classicToggle)
                ? "1005"
                : "1505")
            : ((prefs.getBool('pointsThree') ?? pointsThree)
                ? ((prefs.getBool('classicToggle') ?? classicToggle)
                    ? "1505"
                    : "2000")
                : ((prefs.getBool('pointsFour') ?? pointsFour)
                    ? "2005"
                    : "One Hand")));
    options['password'] =
        (prefs.getBool('passwordToggle') ?? passwordToggle) ? password : null;
    options['chatToggle'] = (prefs.getBool('chatToggle') ?? chatToggle) ? 1 : 0;
    options['selectedLevel'] = prefs.getInt('selectedLevel') ?? selectedLevel;
    options['selectedStyle'] = prefs.getInt('selectedStyle') ?? selectedStyle;
    options['selectedDeck'] = prefs.getInt('selectedDeck') ?? selectedDeck;
    options['selectedTable'] = prefs.getInt('selectedTable') ?? selectedTable;

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
    await prefs.setInt('selectedLevel', selectedLevel);
    await prefs.setInt('selectedStyle', selectedStyle);
    await prefs.setInt('selectedDeck', selectedDeck);
    await prefs.setInt('selectedTable', selectedTable);

    if (kDebugMode) {
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
    professionalToggle =
        prefs.getBool('professionalToggle') ?? professionalToggle;
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
    selectedLevel = prefs.getInt('selectedLevel') ?? selectedLevel;
    selectedStyle = prefs.getInt('selectedStyle') ?? selectedStyle;
    selectedDeck = prefs.getInt('selectedDeck') ?? selectedDeck;
    selectedTable = prefs.getInt('selectedTable') ?? selectedTable;

    if (kDebugMode) {
      print(">>loadAndSaveSettingsFromAndToSharedPreferences<<<");
    }

    saveOptionsDataInSharedPreferences();

    notifyListeners();
  }

  Future<void> saveOptionsDataFromServerToSharedPreferences(
      Map<String, dynamic> settings) async {
    bool dataSavedPreviouslyOnServer = false;
    SharedPreferences prefs;
    try {
      prefs = await SharedPreferences.getInstance();

      // if any key is emoty or null then it means there is no settings data on the server
      if (settings.isNotEmpty) {
        dataSavedPreviouslyOnServer = !settings.keys.any((key) =>
            settings.containsKey(key) &&
            (settings[key] != null && settings[key] != ""));
      } else {
        // If settings is null or empty, set noDataSavedPreviouslyOnServer to true
        dataSavedPreviouslyOnServer = false;
      }

      // if there is no data on the server about settings
      if (dataSavedPreviouslyOnServer == false) {
        if (kDebugMode) {
          print('>>dataSavedPreviouslyOnServer = false<<');
        }
        // this function will get the data from shared preferences [if exist] ...
        // otherwise get the default data and store again in shared preferences
        loadAndSaveOptionsFromAndToSharedPreferences();
      } else {
        //  no need to put ?? and get the value from variable [refactor later...]
        await prefs.setBool(
            'classicToggle', settings['classicToggle'] ?? classicToggle);
        await prefs.setBool('professionalToggle',
            settings['professionalToggle'] ?? professionalToggle);
        await prefs.setBool('twoPlayersToggle',
            settings['twoPlayersToggle'] ?? twoPlayersToggle);
        await prefs.setBool('fourPlayersToggle',
            settings['fourPlayersToggle'] ?? fourPlayersToggle);
        await prefs.setBool(
            'directToggle', settings['directToggle'] ?? directToggle);
        await prefs.setBool(
            'indirectToggle', settings['indirectToggle'] ?? indirectToggle);
        await prefs.setBool(
            'makartCheckbox', settings['makartCheckbox'] ?? makartCheckbox);
        await prefs.setBool(
            'turnTimeOne', settings['turnTimeOne'] ?? turnTimeOne);
        await prefs.setBool(
            'turnTimeTwo', settings['turnTimeTwo'] ?? turnTimeTwo);
        await prefs.setBool(
            'turnTimeThree', settings['turnTimeThree'] ?? turnTimeThree);
        await prefs.setBool(
            'turnTimeFour', settings['turnTimeFour'] ?? turnTimeFour);
        await prefs.setBool('pointsOne', settings['pointsOne'] ?? pointsOne);
        await prefs.setBool('pointsTwo', settings['pointsTwo'] ?? pointsTwo);
        await prefs.setBool(
            'pointsThree', settings['pointsThree'] ?? pointsThree);
        await prefs.setBool('pointsFour', settings['pointsFour'] ?? pointsFour);
        await prefs.setBool(
            'passwordToggle', settings['passwordToggle'] ?? passwordToggle);
        await prefs.setBool('chatToggle', settings['chatToggle'] ?? chatToggle);
        await prefs.setInt(
            'selectedLevel', settings['selectedLevel'] ?? selectedLevel);
        await prefs.setInt(
            'selectedStyle', settings['selectedStyle'] ?? selectedStyle);
        await prefs.setInt(
            'selectedDeck', settings['selectedDeck'] ?? selectedDeck);
        await prefs.setInt(
            'selectedT able', settings['selectedTable'] ?? selectedTable);

        // update the state variables and call notify listeners to update the settings UI
        loadOptionsFromSharedPreferences();
      }
    } catch (ex) {
      if (kDebugMode) {
        print(
            'Exception during saveOptionsDataFromServerToSharedPreferences: $ex');
      }
    }
  }
}
