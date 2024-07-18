import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsManager with ChangeNotifier {

  bool _darkMode = false;
  bool _manualSorting = true;
  bool _cardRotation = true;
  bool _topCardRotation = true;
  bool _newMessages = true;
  bool _friendRequestsNotification = true;
  bool _tournaments = true;
  bool _systemSounds = true;
  bool _trill = true;
  bool _friendRequestsRestrictions = true;
  bool _clubInvites = true;
  bool _invitesToTable = true;

  String _lobbyPreference = "0";

  String _language = "en";

  String get language => _language;

  bool get darkMode => _darkMode;

  bool get manualSorting => _manualSorting;

  bool get cardRotation => _cardRotation;

  bool get topCardRotation => _topCardRotation;

  bool get newMessages => _newMessages;

  bool get friendRequestsNotification => _friendRequestsNotification;

  bool get tournaments => _tournaments;

  bool get systemSounds => _systemSounds;

  bool get trill => _trill;

  bool get friendRequestsRestrictions => _friendRequestsRestrictions;

  bool get clubInvites => _clubInvites;

  bool get invitesToTable => _invitesToTable;


 // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


 
  void setDarkMode(bool value) {
    _darkMode = value;
    saveSettingsDataInSharedPreferences();
    notifyListeners();
  }

  void setManualSorting(bool value) {
    _manualSorting = value;
    saveSettingsDataInSharedPreferences();
    notifyListeners();
  }

  void setCardRotation(bool value) {
    _cardRotation = value;
    saveSettingsDataInSharedPreferences();
    notifyListeners();
  }

  void setTopCardRotation(bool value) {
    _topCardRotation = value;
    saveSettingsDataInSharedPreferences();
    notifyListeners();
  }

  void setNewMessages(bool value) {
    _newMessages = value;
    saveSettingsDataInSharedPreferences();
    notifyListeners();
  }

  void setFriendRequestsNotification(bool value) {
    _friendRequestsNotification = value;
    saveSettingsDataInSharedPreferences();
    notifyListeners();
  }

  void setTournaments(bool value) {
    _tournaments = value;
    saveSettingsDataInSharedPreferences();
    notifyListeners();
  }

  void setSystemSounds(bool value) {
    _systemSounds = value;
    saveSettingsDataInSharedPreferences();
    notifyListeners();
  }

  void setTrill(bool value) {
    _trill = value;
    saveSettingsDataInSharedPreferences();
    notifyListeners();
  }

  void setFriendRequestsRestrictions(bool value) {
    _friendRequestsRestrictions = value;
    saveSettingsDataInSharedPreferences();
    notifyListeners();
  }

  void setClubInvites(bool value) {
    _clubInvites = value;
    saveSettingsDataInSharedPreferences();
    notifyListeners();
  }

  void setInvitesToTable(bool value) {
    _invitesToTable = value;
    saveSettingsDataInSharedPreferences();
    notifyListeners();
  }

  void setLanguage(String value) {
    _language = value;
    saveSettingsDataInSharedPreferences();
    notifyListeners();
  }

  //**************************** SAVE SETTINGS DATA IN SHARED PREFERENCE *********************
  // loads the data from shared Preferences to state variables and notifyListeners to update the UI
  Future<void> loadSettingsFromSharedPreferences(
      [SharedPreferences? prefs]) async {
    prefs ??= await SharedPreferences.getInstance();

    _darkMode = prefs.getBool('_darkMode') ?? _darkMode;
    _manualSorting = prefs.getBool('_manualSorting') ?? _manualSorting;
    _cardRotation = prefs.getBool('_cardRotation') ?? _cardRotation;
    _topCardRotation = prefs.getBool('_topCardRotation') ?? _topCardRotation;
    _newMessages = prefs.getBool('_newMessages') ?? _newMessages;
    _friendRequestsNotification =
        prefs.getBool('_friendRequestsNotification') ?? _friendRequestsNotification;
    _tournaments = prefs.getBool('_tournaments') ?? _tournaments;
    _systemSounds = prefs.getBool('_systemSounds') ?? _systemSounds;
    _trill = prefs.getBool('_trill') ?? _trill;
    _friendRequestsRestrictions =
        prefs.getBool('_friendRequestsRestrictions') ?? _friendRequestsRestrictions;
    _clubInvites = prefs.getBool('_clubInvites') ?? _clubInvites;
    _invitesToTable = prefs.getBool('_invitesToTable') ?? _invitesToTable;
    _lobbyPreference = (prefs.getInt('lobbyPreference') ?? _lobbyPreference).toString();
    _language = prefs.getString('_languagePreference') ?? _language;


    notifyListeners();
  }

  //************************** create a  Settings json string to be sent to server ********************
  Future<String> prepareAllSettingsInJsonFormat( ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> settings = {};

    settings['_darkMode'] = prefs.getBool('_darkMode') ?? _darkMode;
    settings['_manualSorting'] =
        prefs.getBool('_manualSorting') ?? _manualSorting;
    settings['_cardRotation'] = prefs.getBool('_cardRotation') ?? _cardRotation;
    settings['_topCardRotation'] =
        prefs.getBool('_topCardRotation') ?? _topCardRotation;
    settings['_newMessages'] = prefs.getBool('_newMessages') ?? _newMessages;
    settings['_friendRequestsNotification'] =
        prefs.getBool('_friendRequestsNotification') ??
            _friendRequestsNotification;
    settings['_tournaments'] = prefs.getBool('_tournaments') ?? _tournaments;
    settings['_systemSounds'] = prefs.getBool('_systemSounds') ?? _systemSounds;
    settings['_trill'] = prefs.getBool('_trill') ?? _trill;
    settings['_friendRequestsRestrictions'] =
        prefs.getBool('_friendRequestsRestrictions') ??
            _friendRequestsRestrictions;
    settings['_clubInvites'] = prefs.getBool('_clubInvites') ?? _clubInvites;
    settings['_invitesToTable'] =
        prefs.getBool('_invitesToTable') ?? _invitesToTable;

    settings['_lobbyPreference'] = prefs.getInt('lobbyPreference') ?? 0;
    settings['_languagePreference'] =
        prefs.getString('_languagePreference') ?? 'en';

    return jsonEncode(settings);
  }


  //**************************** SAVE SETTINGS DATA IN SHARED PREFERENCE *********************
  void saveSettingsDataInSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('_darkMode', darkMode);
    await prefs.setBool('_manualSorting', manualSorting);
    await prefs.setBool('_cardRotation', cardRotation);
    await prefs.setBool('_topCardRotation', topCardRotation);
    await prefs.setBool('_newMessages', newMessages);
    await prefs.setBool(
        '_friendRequestsNotification', friendRequestsNotification);
    await prefs.setBool('_tournaments', tournaments);
    await prefs.setBool('_systemSounds', systemSounds);
    await prefs.setBool('_trill', trill);
    await prefs.setBool(
        '_friendRequestsRestrictions', friendRequestsRestrictions);
    await prefs.setBool('_clubInvites', clubInvites);
    await prefs.setBool('_invitesToTable', invitesToTable);

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
  Future<void> loadAndSaveSettingsFromAndToSharedPreferences(
      [SharedPreferences? prefs]) async {
    prefs ??= await SharedPreferences.getInstance();

    _darkMode = prefs.getBool('_darkMode') ?? _darkMode;
    _manualSorting = prefs.getBool('_manualSorting') ?? _manualSorting;
    _cardRotation = prefs.getBool('_cardRotation') ?? _cardRotation;
    _topCardRotation = prefs.getBool('_topCardRotation') ?? _topCardRotation;
    _newMessages = prefs.getBool('_newMessages') ?? _newMessages;
    _friendRequestsNotification =
        prefs.getBool('_friendRequestsNotification') ?? _friendRequestsNotification;
    _tournaments = prefs.getBool('_tournaments') ?? _tournaments;
    _systemSounds = prefs.getBool('_systemSounds') ?? _systemSounds;
    _trill = prefs.getBool('_trill') ?? _trill;
    _friendRequestsRestrictions =
        prefs.getBool('_friendRequestsRestrictions') ?? _friendRequestsRestrictions;
    _clubInvites = prefs.getBool('_clubInvites') ?? _clubInvites;
    _invitesToTable = prefs.getBool('_invitesToTable') ?? _invitesToTable;
    _lobbyPreference = (prefs.getInt('lobbyPreference') ?? _lobbyPreference).toString();
    _language = prefs.getString('_languagePreference') ?? _language;

    if (kDebugMode) {
      print(">>loadAndSaveSettingsFromAndToSharedPreferences<<<");
    }

    saveSettingsDataInSharedPreferences();

    notifyListeners();
  }

  Future<void> saveSettingsDataFromServerToSharedPreferences(Map<String, dynamic> settings) async {

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
       loadAndSaveSettingsFromAndToSharedPreferences();
     }
     else {
      
     //  no need to put ?? and get the value from variable [refactor later...]
    await prefs.setBool('_darkMode', settings['_darkMode'] ?? _darkMode);
    await prefs.setBool('_manualSorting', settings['_manualSorting'] ?? _manualSorting);
    await prefs.setBool('_cardRotation', settings['_cardRotation'] ?? _cardRotation);
    await prefs.setBool('_topCardRotation', settings['_topCardRotation'] ?? _topCardRotation);
    await prefs.setBool('_newMessages', settings['_newMessages'] ?? _newMessages);
    await prefs.setBool('_friendRequestsNotification', settings['_friendRequestsNotification'] ?? _friendRequestsNotification);
    await prefs.setBool('_tournaments', settings['_tournaments'] ?? _tournaments);
    await prefs.setBool('_systemSounds', settings['_systemSounds'] ?? _systemSounds);
    await prefs.setBool('_trill', settings['_trill'] ?? _trill);
    await prefs.setBool('_friendRequestsRestrictions', settings['_friendRequestsRestrictions'] ?? _friendRequestsRestrictions);
    await prefs.setBool('_clubInvites', settings['_clubInvites'] ?? _clubInvites);
    await prefs.setBool('_invitesToTable', settings['_invitesToTable'] ?? _invitesToTable);

    // update the state variables and call notify listeners to update the settings UI
    loadSettingsFromSharedPreferences();
     }
   }catch(ex){
       if(kDebugMode){
         print('Exception during saveSettingsDataFromServerToSharedPreferences: $ex');
       }
   }
  }

  //

}
