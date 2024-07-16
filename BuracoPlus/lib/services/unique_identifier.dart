import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_udid/flutter_udid.dart';

class UniqueIdentifierService {

  UniqueIdentifierService._privateConstructor();
  static final UniqueIdentifierService _instance = UniqueIdentifierService._privateConstructor();
  factory UniqueIdentifierService() {
    return _instance;
  }

  String _uniqueIdentifier = '';
  String get uniqueIdentifier => _uniqueIdentifier;
  set uniqueIdentifier(String value) {
    _uniqueIdentifier = value;
  }

  Future<String> initUniqueIdentifierState() async {
    String identifier;
    try {
      identifier = await FlutterUdid.udid;
    } on PlatformException {
      identifier = 'Failed to get Unique Identifier';
    }
    if (kDebugMode) {
      print("identifier = $identifier")    ;
    }
    return   identifier;


  }

  Future<void> initPlatformState() async {
    String udid;
    try {
      udid = await FlutterUdid.udid;
      print("uuid : "+udid);
    } on PlatformException {
      udid = 'Failed to get UDID.';
    }


  }

}