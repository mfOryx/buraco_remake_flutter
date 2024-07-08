
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:buracoplus/common/translation_manager.dart';
import 'package:buracoplus/helpers/preferences_service.dart'    ;

class SettingsManager with ChangeNotifier
{
  bool _darkMode = true;
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

  String _lobbyPreference = "0"  ;
  String _language = "en";

  bool get darkMode => _darkMode;
  bool get manualSorting => _manualSorting;
  bool get cardRotation => _cardRotation;
  bool get topCardRotation => _topCardRotation;
  bool get newMessages => _newMessages;
  bool get friendRequestsNotification => _friendRequestsNotification;
  bool get tournaments => _tournaments;
  bool get systemSounds => _systemSounds;
  bool get trill => _trill;
  bool get friendRequestsRestrictions=>_friendRequestsRestrictions;
  bool get clubInvites => _clubInvites;
  bool get invitesToTable => _invitesToTable;

 
 


  void setDarkMode(bool value) {
    _darkMode = value;
    notifyListeners();
  }

  void setManualSorting(bool value) {
    _manualSorting = value;
    notifyListeners();
  }

  void setCardRotation(bool value) {
    _cardRotation = value;
    notifyListeners();
  }

  void setTopCardRotation(bool value) {
    _topCardRotation = value;
    notifyListeners();
  }

  void setNewMessages(bool value) {
    _newMessages = value;
    notifyListeners();
  }

  void setFriendRequestsNotification(bool value) {
    _friendRequestsNotification = value;
    notifyListeners();
  }

  void setTournaments(bool value) {
    _tournaments = value;
    notifyListeners();
  }

  void setSystemSounds(bool value) {
    _systemSounds = value;
    notifyListeners();
  }

  void setTrill(bool value) {
    _trill = value;
    notifyListeners();
  }

  void setFriendRequestsRestrictions(bool value) {
    _friendRequestsRestrictions = value;
    notifyListeners();
  }

  void setClubInvites(bool value) {
    _clubInvites = value;
    notifyListeners();
  }

  void setInvitesToTable(bool value) {
    _invitesToTable = value;
    notifyListeners();
  }

  void saveSettingsDataInSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('_darkMode', darkMode);
    await prefs.setBool('_manualSorting', manualSorting);
    await prefs.setBool('_cardRotation', cardRotation);
    await prefs.setBool('_topCardRotation', topCardRotation);
    await prefs.setBool('_newMessages', newMessages);
    await prefs.setBool('_friendRequestsNotification', friendRequestsNotification);
    await prefs.setBool('_tournaments', tournaments);
    await prefs.setBool('_systemSounds', systemSounds);
    await prefs.setBool('_trill', trill);
    await prefs.setBool('_friendRequestsRestrictions', friendRequestsRestrictions);
    await prefs.setBool('_clubInvites', clubInvites);
    await prefs.setBool('_invitesToTable', invitesToTable);
     // prefs.getInt('_lobbyPreference') ?? 0;
     // prefs.getString("_languagePreference")  ;

  }

  Future<Map<String, dynamic>> getAllSettingsFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();


    Map<String, dynamic> settings = {};


    settings['_darkMode'] = prefs.getBool('_darkMode') ?? false;
    settings['_manualSorting'] = prefs.getBool('_manualSorting') ?? false;
    settings['_cardRotation'] = prefs.getBool('_cardRotation') ?? false;
    settings['_topCardRotation'] = prefs.getBool('_topCardRotation') ?? false;
    settings['_newMessages'] = prefs.getBool('_newMessages') ?? false;
    settings['_friendRequestsNotification'] = prefs.getBool('_friendRequestsNotification') ?? false;
    settings['_tournaments'] = prefs.getBool('_tournaments') ?? false;
    settings['_systemSounds'] = prefs.getBool('_systemSounds') ?? false;
    settings['_trill'] = prefs.getBool('_trill') ?? false;
    settings['_friendRequestsRestrictions'] = prefs.getBool('_friendRequestsRestrictions') ?? false;
    settings['_clubInvites'] = prefs.getBool('_clubInvites') ?? false;
    settings['_invitesToTable'] = prefs.getBool('_invitesToTable') ?? false;

    settings['_lobbyPreference'] = prefs.getInt('_lobbyPreference') ?? 0;
    settings['_languagePreference'] = prefs.getString('_languagePreference') ?? 'en';
    // Convert the map to JSON and return it
    return settings;
  }

}