import 'dart:convert';
import 'package:buracoplus/common/settingsManager.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../common/popUp.dart';

class SettingsManagerService{

  //***************************************************************************
  //  *****  urls for fetching and saving settings data on server *****
  //***************************************************************************
  final String saveSettingsUrl = "";
  final String fetchSettingsUrl = "";


  //***************************************************************************
  //  ***** HTTP POST request to save settings data to server *****
  //***************************************************************************
  Future<void> saveSettings(String settingJsonString) async {
    try {
      var response = await http.post(
        Uri.parse(saveSettingsUrl), // Use the variable directly
        headers: {'Content-Type': 'application/json'},
        body: settingJsonString,
      );

      if (response.statusCode == 200) {
        PopUps.popUpSimpleSucess("Success", "Settings saved to server");
      } else {
        PopUps.popUpSimpleError("Oops!", "Failed to post settings to server");
      }
    } catch (e) {
      // Handle any exceptions
     
      PopUps.popUpSimpleError("Exception!", 'Error during saveSettings: $e');
    }
  }
  //***************************************************************************
  //  ***** HTTP GET request to fetch settings data from your server *****
  //***************************************************************************
  Future<void> fetchSettings() async {
      bool test = true;

      if(test){

        // Update settings in shared Preferences from fetched data
        Map<String, dynamic> settings = {};

        final SettingsManager _settingsManager = SettingsManager();
        _settingsManager.saveSettingsDataFromServerToSharedPreferences(settings);

      }else {
    try {
      var response = await http.get(
        Uri.parse(fetchSettingsUrl), // Use the variable directly
      );

      if (response.statusCode == 200) {
        // Parse the JSON response
        Map<String, dynamic> settings = jsonDecode(response.body);

        // Update settings in shared Preferences from fetched data
        final SettingsManager _settingsManager = SettingsManager();
        _settingsManager.saveSettingsDataFromServerToSharedPreferences(settings);

        PopUps.popUpSimpleSucess("Success", "Settings fetched successfully");
      } else {
        PopUps.popUpSimpleError("Oops!", "Failed to fetch settings from server");
      }
    } catch (e) {
      // Handle any exceptions
      print('Exception during fetchSettings: $e');
      PopUps.popUpSimpleError("Oops!", "Failed to fetch settings from server");
    }
  }
  }//test
}