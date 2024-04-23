// options_data.dart
import 'package:buracoplus/helpers/modal_helpers.dart';
import 'package:buracoplus/models/options_model.dart';
import 'package:flutter/foundation.dart';

final List<OptionGroup> optionGroups = [
  OptionGroup(
    title: 'Generale',
    options: [
      OptionItem(
        title: 'Dark Mode',
        isSwitch: true,
        switchValue: true,
        onSwitchChanged: (val) {},
        onTap: (context) {},
      ),
      OptionItem(
        title: 'Lobby',
        requireLoggedIn: true,
        onTap: (context) {
          ModalHelpers.showLanguagesMenu(context);
        },
      ),
      OptionItem(
        title: 'Lingua',
        requireLoggedIn: true,
        onTap: (context) {
          ModalHelpers.showLanguagesMenu(context);
        },
      ),
      OptionItem(
        title: 'Ordinamento manuale',
        isSwitch: true,
        switchValue: true,
        onSwitchChanged: (val) {
          if (kDebugMode) {
            print('Switch Ordinamento manuale: $val');
          }
        },
        onTap: (context) {},
      ),
      OptionItem(
        title: 'Rotazione carte',
        isSwitch: true,
        switchValue: true,
        onSwitchChanged: (val) {
          if (kDebugMode) {
            print('Switch Rotazione carte: $val');
          }
        },
        onTap: (context) {},
      ),
      OptionItem(
        title: 'Rotazione carte superiori',
        isSwitch: true,
        switchValue: true,
        onSwitchChanged: (val) {
          if (kDebugMode) {
            print('Switch Rotazione carte superiori: $val');
          }
        },
        onTap: (context) {},
      ),
    ],
  ),
  OptionGroup(
    title: 'Notifiche',
    options: [
      OptionItem(
        title: 'Nuovi messaggi',
        isSwitch: true,
        switchValue: true,
        onSwitchChanged: (val) {
          if (kDebugMode) {
            print('Switch Nuovi messaggi: $val');
          }
        },
        onTap: (context) {},
      ),
      OptionItem(
        title: 'Richieste di amicizia',
        isSwitch: true,
        switchValue: true,
        onSwitchChanged: (val) {
          if (kDebugMode) {
            print('Switch Richieste di amicizia: $val');
          }
        },
        onTap: (context) {},
      ),
      OptionItem(
        title: 'Tornei',
        isSwitch: true,
        switchValue: true,
        onSwitchChanged: (val) {
          if (kDebugMode) {
            print('Switch Tornei: $val');
          }
        },
        onTap: (context) {},
      ),
    ],
  ),
  OptionGroup(
    title: 'Suoni',
    options: [
      OptionItem(
        title: 'Suoni di sistema',
        isSwitch: true,
        switchValue: true,
        onSwitchChanged: (val) {
          if (kDebugMode) {
            print('Switch Suoni di sistema: $val');
          }
        },
        onTap: (context) {},
      ),
      OptionItem(
        title: 'Trillo',
        isSwitch: true,
        switchValue: true,
        onSwitchChanged: (val) {
          if (kDebugMode) {
            print('Switch Trillo: $val');
          }
        },
        onTap: (context) {},
      )
    ],
  ),
  OptionGroup(
    title: 'Restrizioni',
    options: [
      OptionItem(
        title: 'Richieste di amicizia',
        isSwitch: true,
        switchValue: true,
        onSwitchChanged: (val) {
          if (kDebugMode) {
            print('Switch Richieste di amicizia: $val');
          }
        },
        onTap: (context) {},
      ),
      OptionItem(
        title: 'Inviti clubs',
        isSwitch: true,
        switchValue: true,
        onSwitchChanged: (val) {
          if (kDebugMode) {
            print('Switch Inviti clubs: $val');
          }
        },
        onTap: (context) {},
      ),
      OptionItem(
        title: 'Inviti al tavolo',
        isSwitch: true,
        switchValue: true,
        onSwitchChanged: (val) {
          if (kDebugMode) {
            print('Switch Inviti al tavolo: $val');
          }
        },
        onTap: (context) {},
      ),
    ],
  ),
];
