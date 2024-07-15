// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:unique_identifier/unique_identifier.dart';
//
// class UniqueIdentifierService {
//
//   UniqueIdentifierService._privateConstructor();
//   static final UniqueIdentifierService _instance = UniqueIdentifierService._privateConstructor();
//   factory UniqueIdentifierService() {
//     return _instance;
//   }
//
//   String _uniqueIdentifier = '';
//   String get uniqueIdentifier => _uniqueIdentifier;
//   set uniqueIdentifier(String value) {
//     _uniqueIdentifier = value;
//   }
//
//   Future<String> initUniqueIdentifierState() async {
//     String identifier;
//     try {
//       identifier = (await UniqueIdentifier.serial)!;
//     } on PlatformException {
//       identifier = 'Failed to get Unique Identifier';
//     }
//     if (kDebugMode) {
//       print("identifier = $identifier")    ;
//     }
//     return   identifier;
//
//
//   }
// }